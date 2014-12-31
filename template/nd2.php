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
$notifs_grab = mysqli_query($db_main, "SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]' LIMIT 0,10");
if(mysqli_num_rows($notifs_grab) > 0){
 while($notifs_iterate = mysqli_fetch_assoc($notifs_grab)){
echo "<a href='". $notifs_iterate['url'] ."'> <div class='notifs'>". preg_replace('#^<a href(.+)>(.+)<(.+)>(.+)$#','<span>$2</span> $4',$notifs_iterate['content']) ."</div></a>";
}

}else{echo "<div class='bar_1'>You have no new notifications</div>";

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

require_once("template/actions.php");

require_once("template/redirects.php");

echo "</td></tr>";
echo "</table>";   

// scripts that belong at the bottom of the page?

require_once("template/extra_bottom_content.php");
?>