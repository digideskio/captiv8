<?php      session_start();       

/*

NOTICE: if you want to modify files in here, here's the file tree in terms of file inclusions(that's been require()d) with in the each's respective source codes, and also what is contained inside it

index.php
nd1.php - everything inside <head>
 -js.php - Javascript files
nd2.php - everything inside <body>
 -idx_1.php - profile view, post view, etc
 -idx_2.php - 

*/              
  
/*db configurations*/   
$db_main = mysqli_connect("localhost","root","","captiv8");     
// mysqli_query($db_main,"");
/* $x = mysqli_query($db_main, "ALTER TABLE users ADD COLUMN joindate TIMESTAMP"); 
  //users
$y = mysqli_query($db_main, "CREATE TABLE posts(content MEDIUMTEXT,cnttype INT NOT NULL,msgtype char(20),forwhom INT,parent INT NOT NULL,postid INT NOT NULL AUTO_INCREMENT,PRIMARY KEY(postid),stamptime TIMESTAMP)");    if(!$y){echo mysqli_error($db_main);}   // 1 for normal post, 2 for vid, 3 for anything else?   as for parent, for comments it'll be numbers if it's an actual post then it'll be 0. That'll be reserved - forwhom is for PM's       */
// it's needed for a bunch of things
/*html header, etc*/
require_once("template/vars.php"); // text template    
require_once("template/internal.php"); // form actions, database registering, etc cetera, also site configurations -- the main hub, I guess

echo "<!DOCTYPE html><html>";
echo "<head>";
require_once("template/nd1.php");              if(preg_match("#index.php([\072]([0-9]){0,15})?$#",extraurl()) && !isset($_SESSION["login_q"])){$_SESSION['welcome']="a";}
if(!preg_match("#index.php((([\072])+([0-9]){0,15})*)$#",extraurl()) || isset($_SESSION["login_q"])){if(isset($_SESSION['welcome'])){unset($_SESSION['welcome']);}}     //is it really necessary to require_once server ports>
echo "</head>";
/*end html header, start actual content*/
echo "<body>";

require_once("template/nd2.php");

// I'm gonna make an internal menu
if(count($_SESSION) > 0 || count($_COOKIE) > 0){  echo "<div id='session_list'><h3>List of currently open session/cookie variables, among other things</h3><p>";
foreach($_SESSION as $key => $chest){
if(is_array($chest)){}else{
echo "<u>". $key ."</u> - ". $chest . "<br>"; }
}
foreach($_COOKIE as $key2 => $chest2){
if(is_array($_COOKIE[$key2])){             $y = 0;
foreach($_COOKIE[$key2] as $subkey => $subchest){ $y++;
echo "<u>" . $key2 . " [ ".$y." ] </u> - " . $subchest . "<br>";
}
}else{echo "<u>". $key2 ."</u> - ". $chest2 . "<br>";}
} //next, number of array rows under certain arrays
echo "<br><strong>Next in the sequence under \$nx:</strong> " . count($nx);
echo "</p></div>";} 

echo "</body>";
echo "</html>";     
/*end actual content*/     //session_unset();

if(isset($_SESSION['login_q']) && isset($_SESSION['salt_q'])){mysqli_free_result($logged_query);}

?>