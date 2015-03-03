<?php if(isset($_GET['direct'])){ //all actions


switch($_GET['direct']){
case "snowglobes_submit":
//get all the requirements for a passing snowglobe
if(isset($_POST['sg_name']) && isset($_POST['sg_url']) && isset($_POST['sg_desc']) && isset($_POST['sg_privacy'])){

     $_POST['sg_motto'] = "";
if(preg_match("#^[-_A-Za-z0-9]{4,30}$#",$_POST['sg_url']) && preg_match("#^.{0,200}$#",$_POST['sg_motto']) && preg_match("#^.{4,100}$#",$_POST['sg_name']) && strlen($_POST['sg_desc']) <= 4500 && preg_match("#^(public|private)$#",$_POST['sg_privacy'])){   //all set, post that shit


$submit_sg = mysqli_query($db_main, "INSERT INTO snowglobes(sg_name,description,root_admin_id,sg_url,sg_privacy,motto) VALUES('$_SPIN[sg_name]','$_SPIN[sg_desc]','$logged_dt[userid]','$_SPIN[sg_url]','$_SPIN[sg_privacy]','$_SPIN[sg_motto]')");
$submit_sg_permission = mysqli_query($db_main, "INSERT INTO sg_permissions(access_type,towhom,granted_by) VALUES('root admin','$_MONITORED[login_q]','$_SPIN[sg_url]')");
if($submit_sg && $submit_sg_permission){   $_SESSION['db_query'] = "new_snowglobe";  
redir_process("Location:index.php?phase=2");}else{
echo mysqli_error($db_main);
}



}

}else{
redir_process("Location:index.php"); $_SESSION['error'] = "Failed issets" . time();
}

break;   //end snowglobes_submit

case "new_post":

echo "1";

if(count($_SPIN) > 30){  $_SESSION['error' .rand(56,1515)] = "Nice try DDOS's at ".extraurl();
redir_process("Location:index.php");}   //counter against ddos's
foreach($_SPIN as $key => $value){             //check for all the snowglobes they want to post in
if(preg_match("#^sg[_]#",$key) && $_SPIN[$key] == "on"){  $matched[$key] = preg_replace("#^sg_(.+)$#","$1",$key);                                              
if(!isset($snowglobes)){$snowglobes = $matched[$key];}else{$snowglobes = $snowglobes . "," . $matched[$key];}}         }
//snowglobe settings are by default for each individual snowglobe's setting, snowglobe permissions are custom and set by its admin or moderators.
//has to be a valid post. At least one snowglobe, and not match the default text or be empty. If it's a reply, i'll set it accordingly
//access_type under snowglobe permissions will be matched with id under snowglobe settings 
if(isset($snowglobes) || isset($_SPIN['parent_comment'])){  //check to see if it's either a new thread or a comment
// $pass_check = mysqli_query($db_main, "SELECT * FROM ")

echo "2";
$_SPIN['tcha1'] = isset($_SPIN['tcha1']) ? $_SPIN['tcha1'] : " ";
$thread_nick = mysqli_real_escape_string($db_main,strtolower(substr(preg_replace("#[^_A-Za-z 0-9-]#","",preg_replace("# #","_",$_SPIN['tcha1'])), 0, 50)));
$topic_hash = mysqli_real_escape_string($db_main,substr(sha1(microtime()),0,10));
$_SESSION['db_query'] = "posted content-anything";
 setcookie("limbooo[0]", "k", time()+1);  
if(isset($snowglobes)){//if posting a new thread
//check sg_settings first
//for each one

//by default, posts will be to yourself

$sg_id = "self"; 

foreach($matched as $key => $value){  


  $ze = [preg_match("#^[-_A-Za-z0-9]{4,50}$#",$value),preg_match("#^[-_A-Za-z0-9]{4,25}[\050]s[\051]$#",$value)];

  var_dump($ze); var_dump($_POST);

//save this idea
//for aliased URL's and verify session hashes, we can simply redirect posts to the index page, thereby getting a new session, and of course we'll save the $_POST data to a session, and if that same session is set, then we'll recognize the $_POST data. Of course the code has to come before their would-be respective $_SPIN and $_DATA sanitized $_POST clones.
//the page wherever that verify hash was needed will be new

//this is immune from would-be DOS'ers since the only way this could possibly occur is if a user posted data from an aliased URL


if($ze[0] === 1){ //check where it's posting //snowglobe posts are referenced in the database via their snowglobe_url, self-posts are 1, and posts to other profiles are referenced via their username and an (s) suffix

echo "3";

var_dump($matched);       
$snowglobe_search = mysqli_query($db_main,"SELECT * FROM snowglobes WHERE sg_url='".hack_free($value)."'"); 
if(mysqli_num_rows($snowglobe_search) > 0){$sg_details = mysqli_fetch_assoc($snowglobe_search);

if($sg_details['sg_privacy'] == "private"){  //cross-reference to a snowglobe permission
$sg_perm_check = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE granted_by='".hack_free($value)."' AND towhom='$_MONITORED[login_q]' AND (access_type = 'root admin' OR access_type = 'normal snowglobe' OR access_type = 'moderator')");
if(mysqli_num_rows($sg_perm_check) == 0){redir_process("Location:index.php");}

} 
//successful snowglobe permissions

$sg_id = $value;    




}else{redir_process("Location:index.php");}
}
  
  
 //users posting into their own snowglobe

if((preg_match("#^(.){3,150}$#", $_SPIN['tcha1']) === 0) || strlen($_SPIN['tcha2']) > 65335 || ($_POST['tcha1'] == $nx['17']) || $_POST['tcha2'] == $nx['18']){ $_SESSION['error' .rand(56,1515)] = extraurl();/*  */ redir_process("Location:index.php"); /*  */  }


  
$post_submission = mysqli_query($db_main, "INSERT INTO posts(content,cnttype,forwhom,parent,stamptime,bywhom,title,thread_nick,topic_hash) VALUES('$_DATA[tcha2]','1','$sg_id','0',CURRENT_TIMESTAMP,'$_MONITORED[login_q]','$_DATA[tcha1]','$thread_nick','$topic_hash')");      if($post_submission){


if(isset($_SPIN['poll_question'],$_SPIN['choice_addition'],$_SPIN['choice_selection'])){    //check if a poll was set
$topic_search = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,2");
$search_dt = mysqli_fetch_assoc($topic_search);
mysqli_query($db_main, "INSERT INTO polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[poll_question]','question')");

mysqli_query($db_main, "INSERT into polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[choice_selection]','choice_selection');");

mysqli_query($db_main, "INSERT into polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[choice_addition]','choice_addition');");

foreach($_DATA as $key => $value){
if(preg_match("#^poll_choice([0-9]+)#",$key)){
mysqli_query($db_main,"INSERT INTO polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$value','poll_choice')");
}}

}                   

       
         }else{    echo mysqli_error($db_main);  }     


}  

}      

if(isset($_SPIN['parent_comment'])){
$tree_roots = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$_SPIN[parent_comment]'");
$piece = mysqli_fetch_assoc($tree_roots);      //get parent of post. Just to recheck, ya know. That's right! For the settings! My goodness I work like a turtle.
if($piece['settings'] > 4){  $_SESSION['error' .rand(56,1515)] = extraurl();mysqli_free_result($tree_roots);/*  */ redir_process("Location:index.php"); /*  */ }

$post_async = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,10");
$async_dt = mysqli_fetch_assoc($post_async); //get latest post for whatever reference you must.


$post_nip = mysqli_query($db_main, "INSERT INTO posts(content,cnttype,forwhom,parent,postid,stamptime,bywhom,title,thread_nick,topic_hash,thread_id) 
VALUES('$_SPIN[tcha2]','2','n-a','$piece[postid]','0',CURRENT_TIMESTAMP,'$_MONITORED[login_q]','$_SPIN[tcha1]','$thread_nick','$topic_hash','$_DATA[thread_id]');");
if($post_nip){mysqli_free_result($tree_roots);redir_process("Location:index.php?phase=2"); /*  */ 


}else{

echo mysqli_error($db_main); 

}
} 
 /*  */ redir_process("Location:index.php?phase=2"); /*  */  
}else{                                 $_SESSION['error' .rand(56,1515)] = "Failed to recognize snowglobe/reply parent at ". extraurl();
 /*  */ redir_process("Location:index.php"); /*  */ 
}

break; //end post submissions
}


if(isset($_GET['verify']) && compare_dz($_GET['verify'],$_SESSION['temp_n'])){ //check for session hash, if necessary 



if($_SERVER["REQUEST_METHOD"] == "POST" && $_GET['direct'] == "login"){ //session hash required



$mas1 = mysqli_query($db_main, "SELECT * FROM users WHERE username='$_DATA[usernorm]'"); //call it
$mas2 = mysqli_fetch_assoc($mas1);
foreach($mas2 as $keyn => $valuen){
$mn[$keyn] = $valuen;
}      

$nick = hash('sha512',$mn['salt'] . $_SPIN['pwrdnorm']);
$gravy = substr($nick, 0, 40);  //make a nice meal 

/*criteria to stop XSS and brute force attacks:
- Stop consequent logins at X
- filter characters

in this case I am going to have a reset of all login_attempt logs in the database each refresh after an hour from the last login attempt. I should probably set it to where you could only have one login attempt per hour on an account if you failed logging in more than 5 times within an hour. That's a little paranoid though
*/    
 //reset login attempts
   
$difference = (time() - strtotime($mas2['login_att_last']));
$dialdown = round($difference / 3600);
if($difference >= 18000) {$dialdown = 0; } 
mysqli_query($db_main, "UPDATE users SET login_attempts='$dialdown' WHERE username='$mas2[username]'");     

                

if($mas2['login_attempts'] < 5){   
if(compare_dz($gravy,$mn['password'])){ //successful log in    
$_SESSION['login_q'] = $_SPIN['usernorm'];
$_SESSION['salt_q'] = $mn['password'];
$_SESSION['db_query'] = "user login";
setcookie("limbooo[0]", "k", time()+1);
/*  */ redir_process("Location: index.php"); /*  */ 
}else{

if($mas1){ //login attempts for valid usernames     
$mas3 = ($mas2['login_attempts'] == "0") ? "1" : $mas2['login_attempts']+1;
$mas4 = mysqli_real_escape_string($db_main, $mas3);

$ns = mysqli_query($db_main, "UPDATE users SET login_attempts=".$mas4.",login_att_last=now() WHERE username='$mas2[username]'"); // for some weird reason login_attempts is getting edited too  
 
if(!$ns){
$_SESSION['que_em'] = mysqli_error($db_main);
} 
$_SESSION['log_num'] = $mas3; 
setcookie("inc_ombination", "Incorrect user/password combination", time()+1);       
}

 $_SESSION['error' .rand(56,1515)] = extraurl(); 
}
    

}else{setcookie("inc_ombination", "This account is temporarily locked. Please wait no more than an hour to log in again.", time()+1); 

/*  */ redir_process("Location: index.php"); /*  */ 
$_SESSION['error' .rand(56,1515)] = extraurl();      //Don't want to get it further than that. Such lazy
}

 mysqli_free_result($mas1);
}

          

}else{if(isset($_GET['verify']) && $_GET['verify'] !== $_SESSION['temp_n']
){  $_SESSION['error' .rand(56,1515)] = "Failed session hash at ".extraurl(); 
 /*  */ redir_process("Location:index.php"); /*  */  
}}    

//if not, then it's just direct
if($_GET['direct'] == "signup"){
  //signup page    
echo '<span class="signup"><!-- color changer, because i\'m procrastinating --><div class="contentbox">'.$nx[5].'<div class="optionbox tos_1"><input type="checkbox" id="check"> I agree to the Terms and Conditions presented above. <em>You must agree to this</em></div></div>';  
                                      
//clear all session variables
                                      
if($_SERVER['REQUEST_METHOD'] == "POST"){                                        

$mns = mysqli_query($sync, "SELECT * FROM users WHERE username='".$_SPIN['username2']."'"); 
//data validity check on the server side
if(mysqli_num_rows($mns) < 1 && preg_match("#^[A-Za-z0-9-_]{4,16}$#", $_SPIN['username2']) && preg_match("#^(.){10,50}$#", $_SPIN['pwrd2']) //password
&& preg_match("#^([-_A-Za-z0-9]){1,30}[@](([-_A-Za-z0-9]){1,100}[.])+([-_A-Za-z0-9]){1,100}[.]*(([-_A-Za-z0-9]){1,100})+$#", $_SPIN['email2'])
&& preg_match("#^([A-Za-z-]{2,})+[ ]([A-Za-z-]{2,}[ ]){0,2}([A-Za-z-]{2,})+$#", $_SPIN['fullname2']) 
&& ((preg_match("#^([1-9]|([1-2][0-9])|[3][0-1])$#", $_SPIN['day2']) && preg_match("#^(1|3|5|7|8|10|12)$#", $_SPIN['month2'])) || (preg_match("#^([1-9]|([1-2][0-9])|[3]0)$#", $_SPIN['day2']) && preg_match("#^(4|6|9|11)$#", $_SPIN['month2'])) || //31 and 30-day months 
(preg_match("#^([1-9]|([1][0-9])|[2][0-8])$#", $_SPIN['day2']) && preg_match("#^(2)$#", $_SPIN['month2'])))  //February. too lazy to make the leap year extra condition                                     //match the right months

){
for($xn = 0;$xn <= count($_SPIN);$xn++){
$_SESSION['reg_dt' . $xn] = $clone[$xn];
}
$_SESSION['reg_dt-clip'] = "true";   
setcookie("limbooo[0]", "Successfully registered.", time()+1);
setcookie("limbooo[1]", "You have been successfully registered as a user.", time()+1);
$_SESSION['db_query'] = "user registration";

 /*  */ redir_process("Location: index.php?phase=1"); /*  */ 

}else{echo "<div class='notice'><h3>Notice</h3><p>Please correct some incorrect data.</p></div>";}

//All data checks. Too lazy to correct individualy
// $mns = mysqli_query($sync, "SELECT FROM users WHERE username REGEXP'^".$molded[1]."$'");                                                                           if(((is_bool($mns) && preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1])) || (preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1]))) && ) }
}



//signup page HTML
echo '<span id="chops"></span><div class="contentbox" id="part_one"><form action="index.php?direct=signup" method="POST">      <table><tr><td width="50%"><h3>Signup form. </h3>          <p class="optionbox">All forms below are required to be filled out</p>                       <p>
<input type="text" name="username2" for="username" value="'.$nx[6].'" class="largeform flick">
<input class="largeform flick"  for="password" type="text" name="pwrd2" value="'.$nx[7].'">
<input type="text" name="email2"  for="email" value="'.$nx[8].'" class="largeform flick">  </p>
<p>
<input type="text" name="fullname2"  for="fullname" value="'.$nx[9].'" class="largeform flick"></p>      <h4 class="x1">'.$nx[10].'</h4>
<p class="optionbox">'.$dobordate.'</p> 
<p><input type="submit" value="Register" class="largeform"></p>      
';                                           

echo "</td><td class='rightside'>";    
//notification checks
echo '   
<h3>Miscellaneous options</h3>
<p class="optionbox"><input type="checkbox" checked="checked" name="admin_notifs">Get notifications of site updates in your email</p>

</td>';
echo '</tr></table></form></div></span>';     
}}

/*if($_SERVER['REQUEST_METHOD'] !== "POST"){   //session set clearing for post session variables                
//the cookie will be set on a successful data entry, and then I will rightfully redirect the page to a dummy page
//I did this so there will be a time frame to have the sessions cleared right after the data entry is successful.
//again: $_post-ed data is posted to the server, cloned as sessions, cookie is set, a redirect to a dummy page to actually submit the data to the database and clear the cookie, then redirect to a different dummy page so the cookie's actually gone, then back to the normal page to say the data entry is successful. If you don't need to make a successful data entry message, skip the second to last part.
//all in the name of preventing form resubmissions. sigh
     //session set clearing 1

foreach($_SESSION as $nkey){
if(preg_match("#^reg_dt#", $nkey)){
unset($_SESSION[$nkey]);
} } 
unset($_SESSION['db_query']);
         */             
               
                    /*  username2 = nolvoritea       1
pwrd2 = sangra99asdasasda                     2
email2 = askdajskdaksdka@asdaKASDKA.CASK        3
fullname2 = Hans Marcon                     4
day2 = 16                                  5
month2 = 12                                6
year2 = 1998                               7
admin_notifs = on                           8*/

    
                                                                                                                ?>