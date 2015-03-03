<?php  error_reporting(~E_STRICT);      

//I have no idea why I still don't want to finish the school registration. I mean there's nothing complicated about it, i've already done similar functions

//I should probably find a better way to do this, but nevertheless
//Here i'm going to define which $_GET's can't be put together (i.e. both profile view and topic view, etc)
//It's going to be defined within its own isset($_GET['x']) conditional
//the $_GET key will be the first argument, its possible associates are going to be in array form on the second


                     
$db_main = mysqli_connect("localhost","root","","captiv8");      
mysqli_set_charset($db_main,"ISO-8859-1");

date_default_timezone_set('America/Chicago');         

  $allow_redirs = false;
//  $stopping_point =  
 
if(isset($_SESSION['login_q']) && isset($_SESSION['salt_q'])){
$logged_query = mysqli_query($db_main,"SELECT * FROM users WHERE username='$_SESSION[login_q]'");
$logged_dt = mysqli_fetch_assoc($logged_query);
}

if(isset($_GET['get_more'])){ //news_feed.php needs it

require_once("auxiliary.php");
}else{
if(!isset($_GET['verify'])){        
$_SESSION['temp_n'] = 
substr(sha1(md5(base64_encode(microtime()))),0,25) 
// microtime(true)
;//I've decided to just abandon session hashes for alised url's... for now.
//Instead i'll monitor spam floods by checking every 30 seconds.
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

$sg_data[] = mysqli_query($db_main,"SELECT * FROM snowglobes WHERE sg_url='$_FILTERED[snowglobe]' AND (sg_privacy='public' OR EXISTS(SELECT * FROM sg_permissions WHERE granted_by='$_FILTERED[snowglobe]' AND access_type != 'blocked'))");

$sg_data[] = mysqli_query($db_main, "SELECT * FROM posts WHERE forwhom='$_FILTERED[snowglobe]' ORDER BY stamptime DESC");  //get snowglobe data, check for validation if it's private, then topics

 echo mysqli_error($db_main);

if((!$sg_data[0] && !$sg_data[1]) || ($sg_data[0] && mysqli_num_rows($sg_data[0]) < 1)){
redir_process("Location:index.php");
}else{



$sg_details = mysqli_fetch_assoc($sg_data[0]);
}
}

                                                                            

if(isset($_GET['profile'])){
$username = $_FILTERED['profile'];
$profile_query = mysqli_query($db_main, "SELECT * FROM users WHERE username='$username'"); $matched = mysqli_fetch_assoc($profile_query);
if($profile_query){

}else{redir_process("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}

}


 


// mysqli_query($db_main,"CREATE TABLE sg_settings(sg_id NOT NULL AUTO_INCREMENT, PRIMARY KEY(sg_id), id varchar(36) NOT NULL, a1_check varchar(30), a2_check varchar(30), a3_check varchar(30), a4_check varchar(30), a5_check varchar(30))");  //snowglobes -- essentially the main settings
 //session hashes. Should probably make it a bit more elaborate

   //all automatic functions
/*foreach(mysqli_fetch_assoc($user_query) as $query_key){
if(isset($query_key['login_attempts']) && isset($query_key['login_att_last'])){
if(strtotime($query_key['login_att_last']) - strtotime(time()) <= 3600){
$dialdown = round((strtotime(time()) - strtotime($query_key['login_att_last']))/3600);
if($dialdown > $query_key['login_attempts']){
$dialdown="0";
}
mysqli_query($db_main, "UPDATE users SET login_attempts='$dialdown' WHERE username='$query_key[username]'");
}
}    //when I have more users i'm gonna have to come up with a more efficient way to reset all of them. I feel like this is kind of demanding on the server, since it happens each time someone refreshes a page... requesting each user's who has a failed login attempt for the last hour.

//even if it doesn't demand a lot, there's still a better way to do it.
}
/*if(isset($_SESSION['login_q'])){ //setting last activity for each user
//i'm thinking I should have like a regular expression string match thing.
$activity_funct = array();
for($mo = 0;$mo <= count($activity_funct);$mo++){
if($activity_funct[$mo][0]){   //I guess this limits us to booleans hm
$call_last_activity = $activity_funct[$mo][0][1];
}
}

mysqli_query($db_main, "UPDATE users SET last_actvity='$call_last_activity', last_active_at=now() WHERE username='$query_key[username]'");
}        */
   //this should help for search engines
   
                                                  //first is the entire URL, second is the folder that contains the file as displayed in the server + the URL/server name.
$full_url = [$_SERVER['PHP_SELF'],preg_replace("#(.+)[/][^/]+$#","$1",$_SERVER['PHP_SELF'])];   
   
   
   
if(!isset($_SESSION['db_query'])){
   foreach($_SESSION as $nkey => $nvalue){
   if(preg_match("#^(free[_]sess[_])#", $nkey)){
   unset($_SESSION[$nkey]);
   }
   }
   }
   
if(isset($_SESSION['login_q'])){mysqli_query($db_main, "UPDATE users SET last_active_at=now() WHERE username='$_MONITORED[login_q]'");    
$logged_user_data = mysqli_query($db_main, "SELECT * FROM users WHERE username='$_MONITORED[login_q]'");
$logged_zen = mysqli_fetch_assoc($logged_user_data);

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

function get_posts($pid_call,$tid_call,$limit = "25",$chain = "5",$special_select = "none",$show_more = "no"){     
//first, sort them out by hierarchial position
//then date
//chain is the number of comment ancestor-generations?(after the 1st child comment ancestor-generations?) you want to display
//my goodness I need to come up with a shorter term for it
//I need to make it increment -1 for each successive comment generation so that it'll stop looping child comments when chain is eventually reduced to 0.
global $db_main,$thread_data,$_MONITORED,$original_post;

if($special_select == "none"){
$q_req = mysqli_query($db_main, "SELECT * FROM posts WHERE parent='$pid_call' AND thread_id='$tid_call' ORDER BY stamptime DESC LIMIT 0,$limit");
$x = $chain;
if(mysqli_num_rows($q_req) > 0 && $x > 0){
while($q_dt = mysqli_fetch_assoc($q_req)) {

$margins = ($special_select == "none") ? array("<div class='margin'>","</div>") : array("","");   

   
echo $margins[0];

reply_format::show($q_dt);
                                   /*
echo "<div class='contentbox comment_box'><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$q_dt['bywhom']."'>".$q_dt['bywhom']."</a></h4></td><td><p class='post_text'>".$q_dt['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$q_dt['topic_hash'] ."'>". date(dflt_date_f, strtotime($q_dt['stamptime'])) ."</a></span>
</p>";
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$q_dt['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' id='post_".$q_dt['postid']."' name='post_".$q_dt['postid']."'>Reply</a><a href='#' class='comment_opts rad edit' id='edit_".$q_dt['postid']."'>Edit</a>";echo "</div>";}
echo "</td></tr></table></div>";  */    

 //I give up. wait
//recursive functions is what i'm missing. yesss never knew that
//now we need to find the fastest way to get the subcomments
//which is why i'm gonna make it recursive without changing anything
//fixing away the errors one of the time is the best way to do it in this case. Or at least the best one I can think of :/

$inception_q = mysqli_query($db_main, "SELECT * FROM posts WHERE parent='".$q_dt['postid']."' AND thread_id='$tid_call' ORDER BY stamptime DESC LIMIT 0,$limit") or die(mysqli_error($db_main));
if(mysqli_num_rows($inception_q) > 0){
get_posts($q_dt['postid'],$tid_call,"25",$chain-1);
} 

  echo $margins[1]; }}

if($q_req){mysqli_free_result($q_req);}}else{

// last solution, and then i'm gonna contemplate ragequitting
//moral of the story? Never use recursive functions unless you clearly know your parameters.



//get selected comment  
$get_selected_comment = mysqli_query($db_main, "SELECT * FROM posts WHERE postid=$special_select AND thread_id='$thread_data[postid]'");
if(mysqli_num_rows($get_selected_comment) == "1"){
 $q_dt = mysqli_fetch_assoc($get_selected_comment);
 $get_comments_above_selected = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$q_dt[parent]' AND thread_id='$thread_data[postid]'");
if(mysqli_num_rows($get_comments_above_selected) > 0){
  $q_parents = mysqli_fetch_assoc($get_comments_above_selected);

}else{redir_process("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}

}else{redir_process("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}

//get all child posts of single-referred-post comment
$get_child_comments = mysqli_query($db_main, "SELECT * FROM posts WHERE parent='$_SESSION[original_post_query]' AND thread_id='$thread_data[postid]' ORDER BY stamptime DESC LIMIT 0,25");
if(mysqli_num_rows($get_child_comments) > 0){ echo mysqli_num_rows($get_child_comments);
while($sync_children = mysqli_fetch_assoc($get_child_comments)){
get_posts($sync_children['postid'],$thread_data['postid']);         
} 
 
mysqli_free_result($get_child_comments);
}



   
}//end function
} 

}   
if(isset($_COOKIE['limbooo'][1])){
for($bm = 0;$bm <= count($_COOKIE['limbooo'])-1;$bm++){
setcookie("limbooo[".$bm."]","a",time()-1);
}
}




//we need to define which topic it's under    check
//other user's permissions in the poll
//show who voted in which
//mysqli_query($db_main, "ALTER TABLE posts ADD COLUMN(upvotes INT NOT NULL DEFAULT 1,downvotes INT NOT NULL DEFAULT 0)");
//mysqli_query($db_main, "ALTER TABLE polls ADD COLUMN(votes INT NOT NULL DEFAULT 0)");
//mysqli_query($db_main, "CREATE TABLE friend_limbo(user1 INT NOT NULL,user2 INT NOT NULL, time DATETIME NOT NULL, fl_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(fl_id))");
//mysqli_query($db_main, "CREATE TABLE notifications(n_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(n_id),content varchar(100) NOT NULL,url varchar(110) NOT NULL)");  


/* time to create the chat system
defining chat rights

-if an acount's banned, it cannot use the chat.
-Disable chat option for those who don't want to get PM's from random people.

-If they're both following each other, each other will be added on each other's chat list.

-Make the chats appear on the sidebar

*/


}  





 
  ?>                                                               