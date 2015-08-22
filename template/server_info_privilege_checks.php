<?php
$dir = "template/img/";  
$server_mash = "http://" . $_SERVER['SERVER_NAME'] .$_SERVER['PHP_SELF'];
$main_dir = preg_replace("#(index[.]php|template[/](.+)[.]php)[/]?#","",$server_mash) ;
$image_dir = $main_dir . $dir;

//all privilege checks that require a database reference

abstract class db_class_aux{
    //all the function extensions for the db checks down there
    public function quick_return($table_name,$column_name,$value,$return_value,$misc_return_value = null){ global $db_main,$logged_dt,$_MONITORED;
        //i'll work on multiple-value searches later
        $search_q = mysqli_query($db_main, "SELECT * FROM $table_name WHERE $column_name = $value"); //SANITIZE YOUR SHIT!!! cannot stress this enough.
        if($search_q && mysqli_num_rows($search_q) > 0){
            switch($return_value){
                case "sql_result":
                    return $search_q;
                break;
                case "array":
                    if(!isset($misc_return_value)){
                        while($c_x = mysqli_fetch_assoc($search_q)){
                            $c_y[] = $c_x;
                        }  
                    }
                    else{
                        $c_y = mysqli_fetch_assoc($search_q);
                    }                 
                    return $c_y;
                break; 
                case "row_num":
                    return mysqli_num_rows($search_q);
                break;
            }
            if($return_value !== "sql_result") mysqli_free_result($search_q);
        }    
    }
    public function get_alter_rights(&$get_post_data,$type,$value,$is_from_reply = null){ global $_MONITORED,$db_main;    
        $sg_c = $this->quick_return("snowglobes","sg_url",$get_post_data['forwhom'],"array");
        $sgp_call = mysqli_query($db_main,"SELECT * FROM sg_permissions WHERE towhom='$_MONITORED[login_q]' 
        AND granted_by='$get_post_data[forwhom]' AND (access_type='moderator' OR access_type='root admin')");   
        if($get_post_data['bywhom'] === $_SESSION['login_q']){   
            if($get_post_data['forwhom'] === "self"){ $right2alter = true; }        //self-post alters are always allowed
            else{
                if($sg_c[0]['norm_alter_rights'] === $type || $sg_c[0]['norm_alter_rights'] === "all"){ $right2alter = true; }
                else{ //snowglobe rights don't match, then check for admin or mod status
                    if(mysqli_num_rows($sgp_call) > 0) $right2alter = true;
                }                                
            }   
        }
        else{
            if($get_post_data['forwhom'] === "self" && isset($is_from_reply)) $right2alter = true;  //you can also alter your own replies        
            if(mysqli_num_rows($sgp_call) > 0) $right2alter = true;  //or if you're a mod
        }
        return (isset($right2alter)) ? true : false; 
        unset($right2alter);
    }
}

class db_checks extends db_class_aux { 
    public function admin_rights($username){   global $db_main;
        //authentication process:
        //when an admin logs in, he will have a temporary admin session, and it'll be destroyed once he logs out or after 15 minutes, whichever comes first.
        //he can get a session back once he re-logs his password.
        $rights_search = mysqli_query($db_main, "SELECT * FROM admin_rights WHERE username = '".hack_free($username)."' 
        AND (misc_info='root' OR misc_info='report team' OR misc_info='super mod')");             
        if(mysqli_num_rows($rights_search) === 1){
            $db_confirmation = mysqli_fetch_assoc($rights_search);
            $test = [
                   'hash_match' => ($_SESSION['admin_privy']['hash'] === $db_confirmation['ar_hash']) ? true : false,
                   'time_check' => 
                   ( $_SESSION['admin_privy']['when'] === $db_confirmation['when_logged'] 
                   && 
                   (microtime(true) - $db_confirmation['when_logged'] < 900) ) ? true : false
                   ];
            if($test['hash_match'] === true){
                //check to see that the session hasn't expired
                if($test['time_check'] === true){
                    if($typeof_check !== "normal"){
                        return "";
                    }
                    return "Fully Confirmed";
                }
                else{
                    return "Password Needed";
                }        
            }                                     
        }   
    }
    public function check_perms_of_post($type,$value,$typeof_check = "normal"){ global $db_main,$logged_dt,$_MONITORED;
        $_MONITORED['login_q'] = !isset($_MONITORED['login_q']) ? "" : $_MONITORED['login_q'];
        $select_post = $this->quick_return("posts","postid",$value,"sql_result");
        switch($type){
            case "viewing_posts":
                if(mysqli_num_rows($select_post) > 0){
                    $get_post_data = mysqli_fetch_assoc($select_post);
                    switch((bool) true){
                        case ($get_post_data['forwhom'] !== "self"):
                            $sg_search = $this->quick_return("snowglobes","sg_url",$get_post_data['bywhom'],"array",true);
                            switch($sg_search['sg_privacy']){
                                case "public":
                                    $can_view = true;
                                break;
                                case "private":
                                    $sgp_search = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE granted_by ='$sg_search[sg_url]' 
                                    AND towhom='$_MONITORED[login_q]'");
                                    if($sgp_search && mysqli_num_rows($sgp_search) > 0){
                                        $can_view = true;
                                    }
                                break;
                            }
                        break;
                        case ($get_post_data['forwhom'] === "self"):
                            $get_prefs = mysqli_query($db_main, "SELECT viewable_to FROM users WHERE username='$get_post_data[bywhom]'");                           
                            $get_final_op = mysqli_fetch_assoc($get_prefs);   
                            if($get_final_op['viewable_to'] === "public"){
                                $can_view = true;
                            }
                            else{
                                $sgp_search = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE granted_by='$get_post_data[bywhom]' 
                                AND towhom='$_MONITORED[login_q]' AND access_type='friend snowglobe'");
                                if(mysqli_num_rows($sgp_search) > 0) $can_view = true;
                            }                       
                        break;
                    }
                    return (isset($can_view)) ? true : false;
                }
            break;
            case "altering_posts":
                if(mysqli_num_rows($select_post) > 0){
                    $get_post_data = mysqli_fetch_assoc($select_post);
                    //admin rights first
                    if($logged_dt['userid'] === "1") $right_2_alter = true;
                    if($get_post_data['cnttype'] === "1"){
                        if($this->get_alter_rights($get_post_data,$type,$value)) $right_2_alter = true;       
                    }                                                                                                 
                    if($get_post_data['cnttype'] === "2"){            
                        $dt_2 = $this->quick_return("posts","postid",$get_post_data['thread_id'],"array");                                             
                        if($this->get_alter_rights($dt_2[0],$type,$get_post_data['thread_id'],true) && 
                        $_SESSION['login_q'] === $get_post_data['bywhom']) $right_2_alter = true;   
                    }
                }
     
                //check for admin, mod, and user rights                                       
                switch($typeof_check){
                    case "normal":
                        return (isset($right_2_alter)) ? true : false;
                    break;
                    case "post_data":
                        return $get_post_data;
                    break;
                }
                unset($right_2_alter);
            break;    
        }
    }
}
$db_checks = new db_checks;   
?>