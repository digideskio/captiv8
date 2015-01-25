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
echo "<span class='drop' id='notifs_drop'><div class='left uplink' id='notifs_bar'><a href='index.php?query=nolvorite&notifs=all'>Notifications</a> </div>";
echo "<div class='dropdown_content rad' id='notifications'>";
$notifs_grab = mysqli_query($db_main, "SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,10");
if(mysqli_num_rows($notifs_grab) > 0){
 while($notifs_iterate = mysqli_fetch_assoc($notifs_grab)){
 $notifs_iterate['stamptime'] = time_rounds($notifs_iterate['stamptime']);
echo "<a href='". $notifs_iterate['url'] ."'> <div class='notifs'>". preg_replace('#^<a href(.+)>(.+)<(.+)>(.+)$#','<span>$2</span> $4',$notifs_iterate['content']) ."<br><em>".$notifs_iterate['stamptime']."</em></div></a>";
}

}
mysqli_free_result($notifs_grab);
echo"</div>";
echo"</span>";

//right side


echo"
</div>";}  echo "</div>";          

// welcome note                                                                            
if(isset($_SESSION['welcome'])){echo "<div class='welcome_note' id='first1'>".$nx[4]."</div>";} 

echo "</div><table><tr><td id='left1'>";
                 
if(logged_in_check){if(index_page_check){echo $nx['29'];

//this is gonna be a fun SQL statement. Oh boy

$find_users_to_chat_with = mysqli_query($db_main, "SELECT a.towhom,a.granted_by FROM sg_permissions a, sg_permissions b WHERE a.towhom = b.granted_by AND a.granted_by = b.towhom AND a.access_type='friend snowglobe' AND b.access_type='friend snowglobe' AND a.towhom != a.granted_by AND b.granted_by !=b.towhom AND a.towhom = '$_MONITORED[login_q]' LIMIT 100");

echo "<div class='box' id='chat_list'><h3>Online Users</h3><p>Users will show up here if you both follow each other. Of course you can send a message regardless, but it will be shown somewhere less exposed.</p>";

if(mysqli_num_rows($find_users_to_chat_with) > 0){

while($fetch_chat = mysqli_fetch_assoc($find_users_to_chat_with)){  //   $fetch_chat['granted_by'] has the user whom you could chat with
?>  

<a href="chat-with-user:<?php echo $fetch_chat['granted_by']; ?>" class="prompt chat-option"><?php echo $fetch_chat['granted_by']; ?></a>

<?php
}
}

echo '</div>';

} }
//if(preg_match()){}\

      echo "<div class='box space1'></div>";
echo "</td><td width='99%' id='vc2'>";




//edit profile action, and all the other actions for query= [ ]
if(isset($_GET['query'])){   $check_entry = mysqli_query($db_main,"SELECT * FROM users WHERE username='$_MONITORED[login_q]' AND password='$_MONITORED[salt_q]'");
if(mysqli_num_rows($check_entry) == 1){ 
if(count($_GET) == 1){
$edu_find = mysqli_query($db_main, "SELECT * FROM education where forwhom='$_MONITORED[login_q]'");

//editing your own profile
echo "<form action='index.php?verify=". $_SESSION['temp_n'] ."&action=edit_profile' method='POST'>";
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


echo "</div>";   } else{
switch($_GET['dispos']){
case "new_school":
//time to switch up my coding style
//I need to get into objects, as it just seems intuitive
?>

<div class="contentbox visc">
<h3 class="dashes bottom"><?php echo $nx['34']; //Add a school here
?></h3>
<h4>Details - <span><?php echo $nx['35']; ?></span></h4>
<p>
<input class="flick largeform" type="text" value="School Name">
<input class="flick largeform" type="text" value="Type your city's name to narrow down the search...">
<input type="submit" value="SEARCH SCHOOL" class="prompt">
</p>
</div>

<?php

break;
}
}
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


if(isset($_COOKIE['limbooo'][1])){
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

require_once("template/actions.php");

require_once("template/redirects.php");

echo "</td></tr>";
echo "</table>";   

// scripts that belong at the bottom of the page?

require_once("template/extra_bottom_content.php");
?>