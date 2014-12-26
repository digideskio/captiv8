<?php     
//lesson 1: there is no shame in starting over. at all
//lesson 2: try to plan first.
//try a method that you think is most likely to be effective instead of being creative, if you're new

      
echo "<span class='clear' id='nook'></span><div id='header'><a href='index.php' id='logo'><img src='".$dir."2.png'></a><div id='panel'>";       
if(!isset($_SESSION['login_q'])){       //not logged in to a user account, essentially. Should probably make this more elaborate too                       

echo "<form action='index.php?verify=". $_SESSION['temp_n'] ."&direct=login' id='login' method='post'><input type='text' value='".$nx[0]."' name='usernorm' class='flick'><input type='password' name='pwrdnorm' value='".$nx[1]."' class='flick'><input type='submit' value='".$nx[2]."' class='dt1space'>
<a href='index.php?direct=signup' class='signup-a'>".$nx[3]."</a>";
if(isset($_COOKIE['inc_ombination'])){
echo '<div class="notice left glow">'.$_COOKIE["inc_ombination"].'</div>';
setcookie("inc_ombination","yeah",time()-1);
}
echo "</form>";   
echo "</div></div>"  ;               }else{  //actually logged in. I know, such a fancy method for determining right, just a single session. I will probably change this. Preferably a session hash that's been salted. Was going to do it yesterday but had no time, now I don't feel like working on them

//menu
echo "<div id='user_menu'>
                                                  
<span class='drop'><div class='left uplink'>".$nx[11].", <a class='username' href='index.php?profile=". $_MONITORED['login_q'] ."'>". $_MONITORED['login_q'] ."</a>.  </div><div class='dropdown_content rad'><span class='quick_links'><a href='index.php?find=usedservices&query=". $_MONITORED['login_q'] ."'>".$nx[12]."</a><a href='index.php?query=". $_MONITORED['login_q'] ."'>".$nx[13]."</a></span></div></span>";
//Notifications
echo "<span class='drop'><div class='left uplink' id='notifs_bar'><a href='index.php?query=nolvorite&notifs=all'>Notifications</a> </div>";
echo "<div class='dropdown_content rad' id='notifications'>";
$notifs_grab = mysqli_query($db_main, "SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]'");
if(mysqli_num_rows($notifs_grab) > 0){}else{echo "<div class='bar_1'>You have no new notifications</div>";

}
mysqli_free_result($notifs_grab);
echo"</div>";
echo"</span>";

//right side


echo"
</div>";}            

// welcome note                                                                            
if(isset($_SESSION['welcome'])){echo "<div class='welcome_note' id='first1'>".$nx[4]."</div>";} 

echo "</div><table><tr><td id='left1'>";
                  
if(index_page_check && logged_in_check){echo $nx['29'];}
//if(preg_match()){}\

      echo "<div class='box space1'></div>";
echo "</td><td width='99%' id='vc2'>";

//edit profile action, and all the other actions for query= [ ]
if(isset($_GET['query'])){
if(count($_GET) == 1 && compare_dz($logged_dt['password'],$_SESSION['salt_q'])){
$edu_find = mysqli_query($db_main, "SELECT * FROM education where forwhom='$_MONITORED[login_q]'");

//edit profile
echo "<form action='index.php?verify=". $_SESSION['temp_n'] ."' method='POST'>";
echo "<div class='contentbox' id='profile_edit'>";
echo "<h3>" . $nx[32] ."</h3>";     

echo "<table class='dashed'>";
echo"<tr>";
 echo "<td width='50%'>"; 
echo "<input type='text' class='largeform flick' name='fullname' value='Full name'>"; echo "</td><td class='nam'><strong>Currently:</strong> ".$logged_dt['fullname']." </td>";
echo "</tr>";
echo"<tr>";
 echo "<td width='50%' id='dob-edit'>" . $dobordate; 
 echo "</td><td class='nam'>Date of Birth</td>";
echo "</tr>";                                             


echo "</table>";                                                   





echo "<span id='edu_fill'>";   echo "<h3>Education</h3>";     
echo "<table class='dashed'>";

echo "<tr><td>";

//create the form


      echo "<br>";
if(mysqli_num_rows($edu_find) < 1){                                
echo "<p class='notice center'>You have not made any education entries.</p>";
echo "<div class='panel rad'><table><tr><td width='25%' class='left_side'>College</td><td>";
     //le education fields           
     echo "<input class='largeform flick school_search' value='College entered/currently entering...'>";

echo "</td></tr></table></div>";

echo "<div class='panel rad'><table><tr><td width='25%' class='left_side'>High School</td><td>";
     echo "<input class='largeform flick school_search' value='High school entered/currently entering...'>";
echo "</td></tr></table></div>";

}else{
}
     echo "<br>";
echo "</tr></td>";  

echo "</table>";

echo "</span>";


echo "</div>";
}
}

require_once("template/idx_1.php");
require_once("template/news_feed.php");
  
          
//main body
// .rightside gives extra tweaks, and is the right side of the sub-table, not the main dividing table. That's #vc2
//#left1 is the main left side
//when making a tooltip that is based on the internal tooltip function as opposed to just getting a title, make sure to have the title attribute with a value of " " on the object that's getting it 
//direct has all the main functions
//$_COOKIE['limbo'] has the welcome message


if(isset($_COOKIE['glimpse'])){
echo "<div class='contentbox'><h3>". $_COOKIE['limbooo'][0] ."</h3><p>". $_COOKIE['limbooo'][1] ."</p></div>";

setcookie("glimpse","asd",time()-1);
}




//i'm gonna need all these for later reference
//main $_GET cases = direct, profile (user profile), find(search for posts)
//query is the search data for any database search on a post or a user. probably gonna need more than one in a lot of cases 
//data you get under usedservices under find should be only for the user's owner to see
//each profile has their own snowglobe, which is their own profile page essentially, but I don't want to call it a profile page. It's too cliche. With the snowglobe, it's going to be less about you(not that it ought to be), but rather it's more about your world. Which I would think is actually a greater representation of yourself than something called a "profile". While "profiles" are just mere summations, your snowglobe is a manifestation of yourself for crying out loud. Yeah
// verify, signup are all under direct
//i'm probably gonna need to create a snowglobe page editor. Shouldn't be too bad, just a ton of dragging and ajax
//for now i'm gonna make the default snowglobe
if(isset($_GET['direct'])){ //all actions


if(isset($_GET['verify']) && compare_dz($_GET['verify'],$_SESSION['temp_n'])){ //check for session hash 

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
header("Location: index.php?phase=2"); 
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

header("Location: index.php"); 
$_SESSION['error' .rand(56,1515)] = extraurl();      //Don't want to get it further than that. Such lazy
}

 mysqli_free_result($mas1);
}

if($_SERVER["REQUEST_METHOD"] == "POST" && $_GET['direct'] == "new_post"){ //actual posts

foreach($_SPIN as $key => $value){             //check for all the snowglobes they want to post in
$matched[$key] = preg_replace("/^([a-z]+[_])([\d])$/","$2",$key);
if(preg_match("#^sg[_]#",$key)){

if($_SPIN[$key] == "on"){ 

if(!isset($snowglobes)){$snowglobes = $matched[$key];}else{$snowglobes = $snowglobes . "," . $matched[$key];}}                                       
                        
}
}

//snowglobe settings are by default for each individual snowglobe's setting, snowglobe permissions are custom and set by its admin or moderators.
//has to be a valid post. At least one snowglobe, and not match the default text or be empty. If it's a reply, i'll set it accordingly
//access_type under snowglobe permissions will be matched with id under snowglobe settings 

if(isset($snowglobes) || isset($_SPIN['parent_comment'])){  //check to see if it's either a new thread or a comment
// $pass_check = mysqli_query($db_main, "SELECT * FROM ")

$thread_nick = mysqli_real_escape_string($db_main,substr(preg_replace("#[^-A-Za-z0-9]#","_",$_DATA['tcha1']), 0, 50));
$topic_hash = mysqli_real_escape_string($db_main,substr(sha1(microtime()),0,10));

if(isset($snowglobes)){//if posting a new thread
//check sg_settings first
//for each one

foreach($matched as $key => $value){ 

if($value == "1"){  
  
 //users posting into their own snowglobe

if((preg_match("#^(.){3,150}$#", $_SPIN['tcha1']) === 0) || strlen($_SPIN['tcha2']) > 65335 || ($_POST['tcha1'] == $nx['17']) || $_POST['tcha2'] == $nx['18']){header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}


  
$post_submission = mysqli_query($db_main, "INSERT INTO posts(content,cnttype,forwhom,parent,postid,stamptime,bywhom,title,thread_nick,topic_hash) VALUES('$_DATA[tcha2]','1','self','0','0',CURRENT_TIMESTAMP,'$_MICRORFID[login_q]','$_DATA[tcha1]','$thread_nick','$topic_hash')");      if($post_submission){

if(isset($_SPIN['poll_question'],$_SPIN['choice_addition'],$_SPIN['choice_selection'])){    //check if a poll was set
$topic_search = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom='$_MICRORFID[login_q]' ORDER BY stamptime DESC LIMIT 0,2");
$search_dt = mysqli_fetch_assoc($topic_search);
mysqli_query($db_main, "INSERT INTO polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[poll_question]','question')");

mysqli_query($db_main, "INSERT into polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[choice_selection]','choice_selection');");

mysqli_query($db_main, "INSERT into polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$_DATA[choice_addition]','choice_addition');");

foreach($_DATA as $key => $value){
if(preg_match("#^poll_choice([0-9]+)#",$key)){
mysqli_query($db_main,"INSERT INTO polls(post_id_root,value,define_set) VALUES($search_dt[postid],'$value','poll_choice')");
}}

}                   

       
         }else{    echo $error;  }     
}

}  $_SESSION['db_query'] = "posted content-anything"; setcookie("limbooo[0]", "k", time()+1);  

}      

if(isset($_SPIN['parent_comment'])){
$tree_roots = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$_SPIN[parent_comment]'");
$piece = mysqli_fetch_assoc($tree_roots);      //get parent of post. Just to recheck, ya know. That's right! For the settings! My goodness I work like a turtle.
if($piece['settings'] > 4){header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();mysqli_free_result($tree_roots);}

$post_async = mysqli_query($sync, "SELECT * FROM posts WHERE bywhom='$MICRORFID[login_q]' ORDER BY stamptime DESC LIMIT 0,10");
$async_dt = mysqli_fetch_assoc($post_async); //get latest post for whatever reference you must.


$post_nip = mysqli_query($db_main, "INSERT INTO posts(content,cnttype,forwhom,parent,postid,stamptime,bywhom,title,thread_nick,topic_hash,thread_id) 
VALUES('$_DATA[tcha2]','2','n-a','$piece[postid]','0',CURRENT_TIMESTAMP,'$_MONITORED[login_q]','$_DATA[tcha1]','$thread_nick','$topic_hash','$_DATA[thread_id]');");
if($post_nip){header("Location:index.php?phase=2");
$_SESSION['db_query'] = "posted content-anything";
setcookie("limbooo[0]", "k", time()+1);
mysqli_free_result($tree_roots);
}else{

echo $error; 

}
} 
header("Location:index.php?phase=2"); 
}else{
header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();
}

}else{
header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();

}

}else{if(isset($_GET['verify']) && $_GET['verify'] !== $_SESSION['temp_n']){
header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();
}}

//if not, then it's just direct
if($_GET['direct'] == "signup"){
  //signup page    
echo '<span class="signup"><!-- color changer, because i\'m procrastinating --><div class="contentbox">'.$nx[5].'<div class="optionbox tos_1"><input type="checkbox" id="check"> I agree to the Terms and Conditions presented above. <em>You must agree to this</em></div></div>';  
                                      
//clear all session variables
                                      
if($_SERVER['REQUEST_METHOD'] == "POST"){
/* mysqli_query($db_main, "ALTER TABLE users ADD (month2 INT(5), day2 INT(5), year2 INT(4))")


/^[A-Za-z0-9-_]{4,16}$/.test($("span.signup input[name=username2]").val())
&& /^(.){10,50}$/.test($("span.signup input[name=pwrd2]").val() )  
&& /^([A-Za-z0-9-_])+[@]((([A-Za-z0-9_-])+[.]([A-Za-z0-9_-])+)+)$/.test($("span.signup input[name=email2]").val() ) 
&& /^([A-Za-z-]{2,})+[ ]([A-Za-z-]{2,}[ ]){0,2}([A-Za-z-]{2,})+$/.test($("span.signup input[name=fullname2]").val() ) 
&& $("span.signup input[name=fullname2]").val() != $("span.signup input[name=fullname2]").prop("defaultValue") 
&& $("select[name=day2]").val() != "0" && $("select[name=month2]").val() != "0" && $("select[name=year2]").val() != "0" && $("button#axe1check").hasClass("a2")

if(preg_match("#^[A-Za-z0-9-_]{4,16}$#", htmlspecialchars($_POST['']))){}

if(preg_match("#^username2$#",$molded[0])){ //username check     
$mns = mysqli_query($sync, "SELECT FROM users WHERE username REGEXP'^".$molded[1]."$'");
if((is_bool($mns) && preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1]))){ //no usernames registered? and also the usual limits
echo "<u>" .$molded[1] . "</u> has not been registered yet, and can be registered. &#10004";

}else{if(preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1])){ //priority 1 is checking to see if it fits the username criteria
if(mysqli_num_rows($mns) > 0){echo "This username is already taken.";
//then if it's still available
}else{echo $molded[1] . " has not been registered yet, and can be registered. &#10004";}}else{echo "Must be between 4-16 characters, numbers, letters and hyphens only";}

}

}  
 username2 = nolvoritea       1
pwrd2 = sangra99asdasasda                     2
email2 = askdajskdaksdka@asdaKASDKA.CASK        3
fullname2 = Hans Marcon                     4
day2 = 16                                  5
month2 = 12                                6
year2 = 1998                               6
admin_notifs = on                           7
*/
         // post submission
                                        

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

header("Location: index.php?phase=1");

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
}

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

}     if(isset($_GET['phase'])){
if(isset($_COOKIE['limbooo'][0])){
  if($_GET['phase'] == "1"){
  if($_SESSION['db_query'] = "user registration"){
  
  //saltin'
  $salt = substr(sha1(md5(base64_encode(microtime() - mt_rand(1,microtime())*mt_rand(-1,1)))),0,20);      //pendulum
  $kripke = substr(hash('sha512', $salt . $_SESSION['reg_dt2']), 0, 40);
  
  $sn = mysqli_query($db_main, "INSERT INTO users(username,password,email,joindate,fullname,admin_notifs,month2,day2,year2,salt) 
  VALUES('$_MONITORED[reg_dt1]','$kripke','$_MONITORED[reg_dt3]',now(),'$_MONITORED[reg_dt4]','$_MONITORED[reg_dt8]','$_MONITORED[reg_dt6]','$_MONITORED[reg_dt5]','$_MONITORED[reg_dt7]','$salt');");  
  mysqli_query($db_main, "INSERT INTO sg_settings(id,a1_check,a2_check,a3_check,a4_check,a5_check) VALUES('user_".$_MONITORED['login_q']."','all','all','all','self','self')");
  mysqli_query($db_main, "INSERT INTO sg_permissions(access_type,towhom,granted_by) VALUES('friend snowglobe','$_MONITORED[reg_dt1]','$_MONITORED[reg_dt1]')");
  foreach($_MONITORED as $nkey => $nvalue){
if(preg_match("#^reg[_]dt[\055\1370-9a-z]+#", $nkey)){
unset($_SESSION[$nkey]);
} } 

  if(!$sn){echo "<div class='contentbox'> <h3>SQL error</h3><p>" .mysqli_error($db_main) . "</p></div>";

  }else{
  

  header("Location:index.php?phase=2");
  } }
  
  }else{
  header("Location:index.php?phase=2");}
  if($_GET['phase'] == "2"){   //inquire for successful data entry messages  
  if(isset($_COOKIE['limbooo'][1])){ 
  setcookie("glimpse","yuo",time()+1);
  }    
  if(!isset($_SESSION['login_q'])){setcookie('incorrect_password_notice','incorrect',time()+1);}
  clear_array($_SESSION,"free_sess_");
  
  if($_SESSION['db_query'] == "posted content-anything"){
  $latest = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom = '".$_MICRORFID['login_q']."' ORDER BY stamptime DESC");
  $actual = mysqli_fetch_assoc($latest);
  
  $clasp_tip = ($actual['parent'] !== 0) ? $actual['parent'] : $actual['postid'];   //check to see if it's a thread to refer for a notification
  
  $parent_clasp = mysqli_query($db_main, "SELECT * FROM posts WHERE postid=$clasp_tip ORDER BY stamptime DESC"); $_SESSION['abc'] = mysqli_num_rows($parent_clasp);  $parent_call = mysqli_fetch_assoc($parent_clasp);
  if(mysqli_num_rows($parent_clasp) > 0 && compare_dz($parent_call['forwhom'],"self") !== 0){  //check if it's either a reply to a comment, or not a thread to your own snowglobe, so that it wouldn't be
  //a redundant notification               
  //i'm getting the most recent comment with $parent_call
  $url_nu = ($actual['cnttype'] == "1") ? "thread_view=" . $actual['thread_nick'] . "_" . $actual['topic_hash'] : "comment=" . $actual['topic_hash'];      
  $parent_type = ($parent_call['cnttype'] == "2") ? ["thread",substr(hack_free($parent_call['title']),0,30),"index.php?" .$url_nu] : ["comment",substr(hack_free($parent_call['content']),0,30),"index.php?comment=" . $actual['topic_hash']];

  $notif_add = mysqli_query($db_main, "INSERT INTO notifications(content,url,towhom) VALUES('<a href=\'index.php?profile=".$_MONITORED['login_q']."\'>".$_MONITORED['login_q']."</a> replied to your ".$parent_type[0].": ".$parent_type[1]."','$parent_type[2]','$parent_call[bywhom]')");    
  if(!$notif_add){$_SESSION['sql_error'] = mysqli_error($db_main);} 
  }
  mysqli_query($db_main,"INSERT INTO votes_q(bywhom,timeof,which_post,vote) VALUES('$_MICRORFID[login_q]',CURRENT_TIMESTAMP,'$actual[postid]',1)");
  if($actual['cnttype'] == "1"){
header("Location:index.php?thread_view=". $actual['thread_nick'] . "_" . $actual['topic_hash']);
  }
  
  if($actual['cnttype'] == "2"){
  $tree_roots = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$actual[thread_id]' ORDER BY stamptime DESC");
  $piece = mysqli_fetch_assoc($tree_roots);


 header("Location:index.php?thread_view=".$piece['thread_nick']."_".$piece['topic_hash']);
  mysqli_free_result($tree_roots);
  }
  
     mysqli_free_result($parent_clasp);
  mysqli_free_result($latest); 
  }
  unset($_SESSION['db_query']);

  }  
  }else{header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}
}



echo "</td></tr>";
echo "</table>";   

// scripts that belong at the bottom of the page?

require_once("template/extra_bottom_content.php");
?>