<?php     
      
echo "<span class='clear' id='nook'></span>

<table><tr><td width='1%'><a href='".$main_dir."' id='logo'><img src='".$image_dir."2.png'></a></td><td>";       
if(!isset($_SESSION['login_q'])){       //not logged in to a user account, essentially. Should probably make this more elaborate too       

              

echo "<form action='".$main_dir."index.php?verify=". $_SESSION['temp_n'] ."&direct=login' id='login' method='post'><input type='text' value='".$nx[0]."' name='usernorm' class='flick'><input type='password' name='pwrdnorm' value='".$nx[1]."' class='flick'><input type='submit' value='".$nx[2]."' class='dt1space'>
<a href='".$main_dir."signup' class='signup-a'>".$nx[3]."</a>";
if(isset($_COOKIE['inc_ombination'])){
echo '<div class="notice left glow">'.$_COOKIE["inc_ombination"].'</div>';
setcookie("inc_ombination","yeah",time()-1);
}
echo "</form>";   
echo "</div></div>"  ;               }else{  //actually logged in. I know, such a fancy method for determining right, just a single session. I will probably change this. Preferably a session hash that's been salted. Was going to do it yesterday but had no time, now I don't feel like working on them

$profile_link = $main_dir . "profile/" . $_MONITORED['login_q']; 
//menu
echo "<div id='user_menu'>
                                                  
<span class='drop'><div class='left uplink'>".$nx[11].", <a class='username' href='$profile_link'>". $_MONITORED['login_q'] ."</a>.  </div><div class='dropdown_content rad'><span class='quick_links'><a href='".$main_dir."profile_nuise/". $_MONITORED['login_q'] ."/find/usedservices'>".$nx[12]."</a><a href='".$main_dir."profile_nuise/". $_MONITORED['login_q'] ."'>".$nx[13]."</a><a href='".$main_dir."logout/".$_MONITORED['temp_n']."'>".$nx[53]."</a></span></div></span>";


//Notifications
echo "<span class='drop' id='notifs_drop'><div class='left uplink' id='notifs_bar'><a href='".$main_dir."profile_nuise/".$_MONITORED['login_q']."/notifs'>Notifications</a> </div>";
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
</div>";}  echo "</td></tr></table>";          

// welcome note                                                                            
if(isset($_SESSION['welcome'])){echo "<div class='welcome_note' id='first1'>".$nx[4]."</div>";} 

echo "<table><tr><td id='left1'>" ; 

                 
if(logged_in_check){

echo "<div id='left_menu'> <h3>Main Menu</h3>
<a href='$profile_link'>Your Profile</a>
<a href='".$main_dir."profile_nuise/". $_MONITORED['login_q'] ."/find/snowglobes'>Your Snowglobes</a>
<a href='".$main_dir."profile_nuise/". $_MONITORED['login_q'] ."/find/settings'>Display Settings</a>
<a href='message_panel' class='prompt'>Messages</a>
<a href='misc_opts' class='prompt'>Miscellaneous</a>
</div>";  

       
} 

if(isset($_GET['snowglobe'])){
    $fill_data->sg_sidebar($sg_details); 
}

if(logged_in_check){ if(index_page_check){  //promotion for our school lecture snowglobe feature
//Originally I had planned to call it "lecture notes" but it seems kind of ambiguous at this point

if(mysqli_num_rows($edu_select) > 0):

$find_followed_class_snowglobes = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE towhom='$_MONITORED[login_q]' AND granted_by REGEXP '[/05B]sc[/05C]$' AND EXISTS(SELECT * FROM education WHERE forwhom='$_MONITORED[login_q]' AND is_current='true')");

if(mysqli_num_rows($find_followed_class_snowglobes) > 0){
?>

<div class="box notice2">
<h3>School Classes</h3>

<?php 
      $get_school_regs = mysqli_fetch_assoc($find_followed_class_snowglobes);
      while($regs_dt = mysqli_fetch_assoc($get_school_regs)){
      merge($regs,preg_replace("#^([0-9]+)#","$1",$regs_dt['granted_by']));
      }
      $regs = preg_replace("#[^,0-9]#","",json_encode($regs)); //so tacky
      var_dump($regs);
     //if(){
?>


<?php// }   ?>  

</div>

<?php }else{ ?>

<?php echo $nx['56']; ?>

<?php } endif;                                             
echo $nx['29'];    // posting tips


$find_users_to_chat_with = mysqli_query($db_main, "SELECT a.towhom,a.granted_by FROM sg_permissions a, sg_permissions b WHERE a.towhom = b.granted_by AND a.granted_by = b.towhom AND a.access_type='friend snowglobe' AND b.access_type='friend snowglobe' AND a.towhom != a.granted_by AND b.granted_by !=b.towhom AND a.towhom = '$_MONITORED[login_q]' LIMIT 100");

//get list of tabbed users                      

foreach(json_decode($logged_dt['tabbed_users']) as $num => $value){  

echo "<div class='box chat-b' ref='" . $value . "' preloaded='true'>
    <h3>". $nx['40'] . $value . "</h3>
    <div class='chat_box'>
        <div class='loading_text'>$nx[60]</div>
    </div>
    <div class='chat_panel'>
        <textarea></textarea>
    </div>
    <a class='prompt button_samp rad chat-buttons greened' href='submit-chat-msg'>SUBMIT</a>   <a class='prompt button_samp rad chat-buttons' href='close-chat'>Close</a>
</div>";

}

echo "<div class='box' id='chat_list'><h3>Online Users</h3><p>$nx[66]</p>";

if(mysqli_num_rows($find_users_to_chat_with) > 0){
    while($fetch_chat = mysqli_fetch_assoc($find_users_to_chat_with)){  //   $fetch_chat['granted_by'] has the user whom you could chat with
        ?>  
            <a href="chat-with-user:<?php echo $fetch_chat['granted_by']; ?>" class="prompt chat-option"><?php echo $fetch_chat['granted_by']; ?></a>
        <?php
    }
}
echo '</div>';
}
else{
    if(isset($_GET['thread_view']) && is_array($thread_data)){
        $sidebar = ($thread_data['forwhom'] === "self") ? 
        "SELECT * FROM users WHERE username='$thread_data[bywhom]'" :
        "SELECT * FROM snowglobes WHERE sg_url='$thread_data[forwhom]'";
        $sidebar = mysqli_query($db_main,$sidebar);
        $sidebar_dt = mysqli_fetch_assoc($sidebar);
        if($thread_data['forwhom'] === "self"){
            $fill_data->about_poster_sidebar($sidebar_dt);
        }
        else{
            $fill_data->sg_sidebar($sidebar_dt,true);
        }
    }
} 

}
//if(preg_match()){}\

      echo "<div class='box space1'></div>";
echo "</td><td width='99%' id='vc2'>";        



//edit profile action, and all the other actions for query= [ ]
if(isset($_GET['query']) && logged_in_check){   
if(count($_GET) == 1){

//editing your own profile
echo "<form action='".$main_dir."index.php?verify=". $_SESSION['temp_n'] ."&action=edit_profile' method='POST'>";
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
echo '<div class="edu_listing">';
while($edu_list = mysqli_fetch_assoc($edu_find)){

$nt = isset($nt) ? $nt . ", " .$edu_list['school_type'] : $edu_list['school_type'];   

$class_sg_check = mysqli_query($db_main, "SELECT * FROM snowglobes WHERE special_settings='school' AND reference_num='$edu_list[s_id]'");
?>
<div class="contentbox hide" s_id="<?php echo $edu_list['s_id']; ?>">
<h3>Classes on <em><?php echo $edu_list['name']; ?></em> <a href="close-window" class="button_samp rad greened prompt" return_to="#vc2">Close Panel</a></h3> 


<div id="new_snowglobe"> <table>
<tr class="h4_row"><td><?php echo $nx['71']; ?></td><td><?php echo $nx['72']; ?></td></tr>

<tr class="message"><td width="50%" class="notice2<?php if(mysqli_num_rows($class_sg_check) > 0){ echo " top_off"; }?>">


<?php if(mysqli_num_rows($class_sg_check) > 0){ 
//has classes in school or none
?>

<div class="search_box"><input class="largeform flick chop" type="text" value="<?php echo $nx['74']; ?>"></div> 

<div class="load_classes" school_id="<?php echo $edu_list['s_id'];?>"></div>  

<?php } else { ?>

<?php echo $nx['55']; ?>

<?php } ?>    </td>

<td class="form_cobble" valign="top">

<p><?php echo $nx['73']; ?></p>
 
<!-- <input type="text" value="" name="" class="flick largeform" validation="{new_sg:x}">  -->
<input type="text" value="Name of class/subject, or teacher's name, or both." name="sg_name" class="flick largeform">
<input type="text" value="<?php echo $edu_list['name'];?>" name="sg_schoolforwhich" disabled class="largeform">
<input type="hidden" name="sg_school_id" value="<?php echo $edu_list['s_id'];?>">
<textarea name="sg_desc" class="flick largeform" validation="new_sg:desc">
Describe the class, insert useful material, etc.
</textarea>

<button class="right q_submit" submit="new_class_sg" submit_call="sg_">Start classroom discussions!</button>

</td> </tr></table>    
</div>

</div>
     <!-- <h3><?php echo $edu_list['school_name']; ?></h3>



<?php echo $edu_list['']; ?> -->   

<div class="box">                      
<h3 class='inline_block'><?php echo $edu_list['name']; ?></h3><a href="find-classes" class="school_menu spec rad prompt full_glow" school_id="<?php echo $edu_list['s_id']?>"><span>&#10004;</span> Find Your Classes!</a>
<a href="delete_record:<?php echo $edu_list['e_id']; ?>" class="school_menu spec rad prompt">Delete Education Entry</a>
<a href="other_options" class="school_menu spec rad prompt">Other Options</a>
<h4 class='noselect'>History</h4>    
<table>
<tr>
<th class="left_side">Year Started</th>
<td><?php echo $edu_list['started']; ?></td>
</tr>
<tr>
<th class="left_side">Year Finished</th>
<td><?php echo ($edu_list['is_current'] == "true") ? $nx['54'] : $edu_list['finished']; ?></td>
</tr>

</table>
<h4 class='noselect'>School Details</h4>
<table><tr>
<th class="left_side">Link</th>  
<td><a href='<?php echo $edu_list['link']; ?>'><?php echo $edu_list['link']; ?></a></td>
</tr></table>
</div> 

<?php }

if(count($nt) < 2){

if(!preg_match("#College#",$nt)){

echo "<div class='panel rad'><table><tr><td width='25%' class='left_side'>College</td><td>";
     //le education fields           
     echo "<input class='largeform flick school_search' value='College entered/currently entering...'>";

echo "</td></tr></table></div>";

}

if(!preg_match("#High School#",$nt)){

echo "<div class='panel rad'><table><tr><td width='25%' class='left_side'>High School</td><td>";
     echo "<input class='largeform flick school_search' value='High school entered/currently entering...'>";
echo "</td></tr></table></div>";

}



}


  echo "</div>";

}
echo "</td></tr>";  

echo "</table>";

echo "</span>";


echo "</div>";   


}else{


if(isset($_GET['find'])){
switch($_GET['find']){
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
case "snowglobes":      //snowglobe

//find other snowglobes by user

$sg_search = mysqli_query($db_main,"SELECT * FROM snowglobes WHERE root_admin_id='$logged_dt[userid]' ORDER BY sg_id DESC") or die(mysqli_error($db_main));

?>

<div class="contentbox new_sg">
<h3 class="dashes bottom"><?php echo $nx['43']; //Snowglobes. Obviously we're going to have the person's profile at least
?></h3><h4><?php echo $nx['45'];?></h4>

<p>
<?php echo $nx['44'];
//input creation date
//input privacy
//check to see if it was finished being modified
//Description

?>
</p>
<h4><?php echo $nx['46'];?></h4>
<p><strong>Link:</strong> <a href="<?php echo $profile_link; ?>"><?php echo $profile_link; ?></a></p>
<h4>Other Snowglobes</h4>
<?php if(mysqli_num_rows($sg_search) > 0){?>
<div id="snowglobe_list">
<?php while($sg_snipe = mysqli_fetch_assoc($sg_search)){ ?>



<div class="box snowglobe_div"><h4><a href="<?php echo $main_dir. "sg/" .$sg_snipe['sg_url']; ?>"><?php echo $sg_snipe['sg_name']; ?></a> created  <?php echo time_rounds($sg_snipe['creation_date']); ?></h4>

<p class="desc"><?php echo (empty($sg_snipe['description'])) ? $nx['48'] : $sg_snipe['description']; ?></p>   
<p class="misc"><?php echo $sg_snipe['followers']; ?> subscriber<?php echo ($sg_snipe['followers'] > 1) ? "s" : ""; ?> &middot; <?php echo $sg_snipe['no_threads'] . " threads, " .$sg_snipe['no_replies'] . " replies" ?></p>

<?php if($sg_snipe['is_finished_being_modified'] == 0): ?>
<p class="misc"><?php echo "(Unfinished Editing) <a href='edit_snowglobe:".$sg_snipe['sg_url']."' class='button_samp prompt rad'>FINISH EDITING</a>"; ?></p> 
<?php endif; ?>                         
</div>



<?php } ?>

</div><?php }else{  //
 ?>

<?php } ?>
</div>

<div class="contentbox new_sg">
<h3 class="dashes bottom"><?php echo $nx['47']; //Snowglobes. Obviously we're going to have the person's profile at least
?></h3>
<div class="space">
<form action="<?php echo $main_dir."profile_nuise/". $_MONITORED['login_q'] ."/find/snowglobes/submit"; ?>" method="POST">
<table>
<!-- <tr><td width="25%"></td><td></td></tr> -->
<tr><td width="25%">Snowglobe name</td><td><input type="text" class="largeform flick" value="Name must be at least 4 characters." name="sg_name"></td></tr>
<tr><td width="25%">Snowglobe URL</td><td><input type="text" class="largeform flick" value="Will be accessed via http://url.url/sg/{your input here}. Must be at least 4 characters." name="sg_url"></td></tr>

<tr><td width="25%">Snowglobe description</td><td><textarea class="largeform flick" name="sg_desc">(Can be left blank)</textarea></td></tr>
<tr><td width="25%">Privacy settings</td><td><input type="radio" name="sg_privacy" value="private" checked> Make this snowglobe only accessible to people who are invited in <input type="radio" name="sg_privacy" value="public"> Make the snowglobe accessible to everyone </td></tr>
</table>
<p class="right"><input type="submit" value="CREATE A NEW SNOWGLOBE!"> </p>
</form>
</div>

</div>


<?php    

break;
}
}

}     
}

require_once("template/idx_1.php");

if(index_page_check){
    echo "<span id='nf_encapsulated'>";
    require_once("template/news_feed.php");
    echo "</span>";
}

  
          
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