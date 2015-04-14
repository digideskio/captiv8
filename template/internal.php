<?php                  
$db_main = mysqli_connect("localhost","root","","captiv8");      
mysqli_set_charset($db_main,"ISO-8859-1");
date_default_timezone_set('America/Chicago');         
$allow_redirs = false;

if(isset($_GET['get_more'])){ //news_feed.php needs it
    require_once("auxiliary.php");
}
else{
    if(!isset($_GET['verify'])){        
        $_SESSION['temp_n'] = substr(sha1(md5(base64_encode(sqrt(microtime(true))))),0,25) 
        // microtime(true)
        ;//FIXED finally wooo
    }
    require("template/vars.php");                                                    
    require("template/auxiliary.php");
}
define('dflt_date_f',"F j, Y, g:i A");
define('index_page_check',(preg_match("#index.php([\072]([0-9]){0,15})*$#", extraurl()) && !isset($_SERVER['REDIRECT_URL'])));
define('news_feed_check',(index_page_check || isset($_GET['snowglobe']) || isset($_GET['get_more'])));
define('logged_in_check',isset($_SESSION['login_q']));
if(!isset($_GET['get_more'])){
    if(count($_GET) > 0){
        key_associations("thread_view,comment"); 
        key_associations("phase"); 
        key_associations("query,notifs,find,direct,verify"); 
        key_associations("snowglobe");
    }                                  
    if(isset($_GET['snowglobe'])){
        $sg_data[] = mysqli_query($db_main,"SELECT * FROM snowglobes WHERE sg_url='$_FILTERED[snowglobe]' 
        AND (sg_privacy='public' OR EXISTS(SELECT * FROM sg_permissions WHERE granted_by='$_FILTERED[snowglobe]' AND access_type != 'blocked'))");
        $sg_data[] = mysqli_query($db_main, "SELECT * FROM posts WHERE forwhom='$_FILTERED[snowglobe]' ORDER BY stamptime DESC");  
        //get snowglobe data, check for validation if it's private, then topics
        echo mysqli_error($db_main);
        if((!$sg_data[0] && !$sg_data[1]) || ($sg_data[0] && mysqli_num_rows($sg_data[0]) < 1)){
            redir_process("Location:".$main_dir."index.php");
        }
        else{
            $sg_details = mysqli_fetch_assoc($sg_data[0]);

            switch($sg_details['special_settings']){  
                case "school": $p_type_extra = 1;  break;
            }
            $save = $p_type_extra;
            $p_type_extra = isset($p_type_extra) ? " OR for_which_sg='".$p_type_extra."'" : "";
            $get_post_types = mysqli_query($db_main, "SELECT * FROM post_types WHERE 
            (
            for_which_sg = '0' 
            OR for_which_sg = '$sg_details[sg_url]'$p_type_extra
            ) 
            ORDER BY 
            CASE WHEN for_which_sg = '0' THEN 1 ELSE 0 END,
            CASE WHEN for_which_sg = '$save' THEN 1 ELSE 0 END,
            CASE WHEN for_which_sg = '$sg_details[sg_url]' THEN 1 ELSE 0 END,
            call_name ASC");
            while($p_types = mysqli_fetch_assoc($get_post_types)){
                $ptype_list[] = $p_types;
            } //default post types are included first, then post types for your snowglobe category, then post types for your snowglobe
              //the later mentioned, the more priority it has
              //then it's ordered by call name in ascending order
        }
    }                                                                                          
    if(isset($_GET['profile'])){
        $username = $_FILTERED['profile'];
        $profile_query = mysqli_query($db_main, "SELECT * FROM users WHERE username='$username'"); $matched = mysqli_fetch_assoc($profile_query);
        if(!$profile_query){
            redir_process("Location:".$main_dir."index.php"); 
            $_SESSION['error' .rand(56,1515)] = extraurl();
        }
    }
    $full_url = [$_SERVER['PHP_SELF'],preg_replace("#(.+)[/][^/]+$#","$1",$_SERVER['PHP_SELF'])];   
    if(!isset($_SESSION['db_query'])){
        foreach($_SESSION as $nkey => $nvalue){
            if(preg_match("#^(free[_]sess[_])#", $nkey)){ unset($_SESSION[$nkey]); }
        }
    }  
    if(logged_in_check){
        //anything (data needed to be received, data needed to be updated, etc.) when a user's logged in
        mysqli_query($db_main, "UPDATE users SET last_active_at=now() WHERE username='$_MONITORED[login_q]'");    
        $logged_user_data = mysqli_query($db_main, "SELECT * FROM users WHERE username='$_MONITORED[login_q]'");
        $logged_zen = mysqli_fetch_assoc($logged_user_data);
        if($logged_zen['image_in_limbo'] !== 0 && (microtime(true) - $logged_zen['image_in_limbo'] >= 3600*24)){
            //delete all images that were uploaded but didn't have a post to be embedded into after 24 hours being posted
            mysqli_query($db_main, "DELETE FROM images WHERE under_post='0' AND uploaded_by='$_MONITORED[login_q]'"); 
        }
        if(index_page_check){
            $edu_select = mysqli_query($db_main, "SELECT * FROM education WHERE forwhom='$_MONITORED[login_q]';");
            $default_pts = mysqli_query($db_main, "SELECT * FROM post_types WHERE for_which_sg='0'") ;
        }
        clear_array($_SESSION,"highschool|college"); //school, etc fillout clear on refresh
    }
    if(isset($_GET['thread_view'])){
        $_TRIM = hack_free($_GET['thread_view']);
        preg_match("#^(.{3,50})_([A-Za-z0-9]{10})$#",$_TRIM,$_SPLIT);
        foreach($_SPLIT as $key => $value){
            $_NOG[$key] = mysqli_real_escape_string($db_main, $value);
        }                                                
        $view_thread = mysqli_query($db_main, "SELECT * FROM posts WHERE thread_nick = '$_NOG[1]' AND topic_hash = '$_NOG[2]'");
        $thread_data = mysqli_fetch_assoc($view_thread) ?: "";
        //topic_hash doesn't necessarily make it a topic
        if(isset($_GET['comment'])){
            $specific = mysqli_query($db_main, "SELECT * FROM posts WHERE topic_hash='". hack_free($_GET['comment']) ."' AND (parent='$thread_data[postid]' OR thread_id='$thread_data[postid]')");
        }
    }   
    if(isset($_COOKIE['limbooo'][1])){
        for($bm = 0;$bm <= count($_COOKIE['limbooo'])-1;$bm++){
            setcookie("limbooo[".$bm."]","a",time()-1);
        }
    }
}
?>                                                               