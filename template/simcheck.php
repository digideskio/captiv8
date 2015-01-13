<?php              //AJAX calls page
//this is the hotline center, bitchessssss     \

session_start();

$db_main = mysqli_connect("localhost","root","","captiv8");  

require_once("vars.php");

require_once("auxiliary.php");

  

if(isset($_GET['availability'])){
$filter = hack_free($_GET['availability']);
$mns = mysqli_query($db_main, "SELECT * FROM users WHERE username='$filter'");
if(mysqli_num_rows($mns) > 0 ){echo "taken";}
mysqli_free_result($mns);
}




if(isset($_SESSION['login_q'])){  //logged in? This is for all the AJAX functions when you're logged in


$salt_check = mysqli_query($db_main, "SELECT * FROM users WHERE username='$_SESSION[login_q]'");
$salt = mysqli_fetch_assoc($salt_check);

if(compare_dz($salt['password'],$_SESSION['salt_q'])){      //extra measures man



if(isset($_GET['action']))    {

switch($_GET['action']){

case "css_edit":
if(preg_match("#[.]css$#",$_POST['file'])){//nice try kids

$file_opener = fopen("../".$_POST['file'],"w+");
fwrite($file_opener, $_POST['data']);

echo json_encode(array("notice" => "success","bash" => "two"),JSON_UNESCAPED_SLASHES);        }
break;

case "drag_box":   
if(isset($_GET['screen_max'])){
if(isset($_SESSION['xpos'])){
if((intval($_GET['screen_max'][0]) - $_GET['screen_max'][2] < $_SESSION['xpos']) || (intval($_GET['screen_max'][1]) - $_GET['screen_max'][3] < $_SESSION['ypos'])){unset($_SESSION['xpos'],$_SESSION['ypos']);}
}
}
if(isset($_GET['offsets'])){ 
$_SESSION['xpos'] = intval($_GET['offsets'][0]);
$_SESSION['ypos'] = intval($_GET['offsets'][1]);
}


break;

case "change_panels":

if(isset($_SESSION['current_view'])){
if($_GET['view'] == isset($_SESSION['current_view'])){unset($_SESSION['current_view']);}else{
$_SESSION['current_view'] = $_GET['view'];
}
}else{
if($_GET['view'] == "v_sess"){}else{$_SESSION['current_view'] = $_GET['view'];}
}

break;

case "school_search":   

$select_school = mysqli_query($db_main,"SELECT * FROM school WHERE name LIKE='$_FILTERED[search_q]' and type='$_FILTERED[criteria]'");

if($select_school && mysqli_num_rows($select_school) > 0){} else{


 if(preg_match("#([-A-Za-z]+)[ ]#",$_FILTERED['search_q'])){  

echo "<a href='index.php?query=".$_MONITORED['login_q']."&dispos=new_school' class='add-new rad'>". $nx[33] ."</a>";

}

} 

  break;
  
case "wikipedia_search":
            include("wikipedia_search.php");  
  
break;

case "confirm_school":
$strings = json_decode($_GET['data'],true); //rawwwwww
//we gotta run a bunch of tests to determine the authenticity of this data mine

//check to see if the school's already in the database


$check_in_sys = mysqli_query($db_main, "SELECT * FROM school WHERE name LIKE '".hack_free($strings['name'])."'");

if(preg_match("#high[ ]school#",strtolower($strings['name']))){
$school_level = "1";
}
if(preg_match("#(school (of)? )?(med([^ ]+)|law)( school)?|university|college#",strtolower($strings['name']))){
$school_level = "2";
}

if(!isset($school_level)){
//if not named either high school or university in the school's name    

$recheck = file_get_html($strings['link'])->find("#mw-content-text table.infobox",0);
foreach($recheck->find("tr") as $data_set){
 $data_screened = str_get_html($data_set->innertext)->find("th[!colspan],td[!colspan]");

 
 foreach($data_screened as $sheet){
 if(preg_match("#^<th#",$sheet)){$name = strtolower(preg_replace("#[^A-Za-z]#","",$sheet->plaintext));
             //criteria evaluation

 }
 else{$value = $sheet->plaintext;
 //i'm lazy so i'll do all the modifying for this later
 }     
 
 if(isset($name)){$properties[$name] = isset($value) ? preg_replace("#([\133](.+)[\135][ ]+)$#","",$value) : "";  }
 
 }   
}

if(preg_match("#[-]12$#",$properties['grades'])){
$school_level = "1";
}
        
 
$recheck->clear();                        
}else{
$properties = $strings;
}
if($school_level){
             switch($school_level){
                   case 1:
                     $properties['ed_level'] = "High School";  
                   break;
                   case 2:
                     $properties['ed_level'] = "College";  
                   break;
             }
                                 
if(mysqli_num_rows($check_in_sys) < 1){
                                                   
if(isset($strings['link']) && preg_match("#en[.]wikipedia[.]org#",$strings['link'])){      
//check to see the validity of the link

//now check whether it's a high school or a college           
                                                              

                     
 //finally, submit the school to the school list and show the education completion form  
               $properties['link'] = $strings['link'];  //link for later reference  
          $properties['name'] = $strings['name'];
          

 
 foreach($properties as $nougatey => $nougats){ //oh boy
 $datafield_check = mysqli_query($db_main, "SHOW COLUMNS FROM school WHERE `$nougatey`");
 if(!$datafield_check){  //column doesn't exist
 $new_lines = mysqli_query($db_main, "ALTER TABLE school ADD COLUMN `$nougatey` varchar(50)");
 if($new_lines){}
 }
 
 //but either way
 
 //prepend column names and respective values
 

 $adjoiner = !isset($adjoiner) ? [$nougatey . ", ","'".$nougats . "', "] : [$nougatey.", " .$adjoiner[0],"'".hack_free($nougats). "', " . $adjoiner[1]] ;
 $trims = [preg_replace("#(.+)[,][ ]$#","$1",$adjoiner[0]),preg_replace("#(.+)[,][ ]$#","$1",$adjoiner[1])];
 $clear = $datafield_check ? mysqli_free_result($datafield_check) : "";
 }
 //put them in one SQL statement!
  //actually...


  $school_data = mysqli_query($db_main, "INSERT INTO school($trims[0]) VALUES($trims[1])");
  if($school_data){
  $fill_details = "yes";
  }
  
    



   unset($school_level);      unset($adjoiner);           }
   

}}else{
$fill_details = "yes";
}


if(isset($fill_details) && !isset($_SESSION['school_fill'])):   $_SESSION['school_fill'] = "yes";
?>
    <br>
<div class="contentbox fill_details"> <h3>Fill details</h3>
<table><tr><th class="marginals" style="width:200px">School Name</th><td>
<input type="text" value="<?php echo $strings['name'] ?>" class="largeform" disabled="disabled" name="school_name" style="opacity:.5">          </td>
</tr>
<tr><th>Started:</th><td><input type="text" class="largeform flick" value="Input the year that you started going to this school."></td></tr>
<tr><th>Finished:</th><td><select><option id="current">Currently Attending</option><option id="did_finish">I finished attending this school.</option></select></td></tr>
<?php if(isset($school_level)){ if($school_level == "1"){ ?> 

<tr><th>Degree/Major</th><td><input type="text" value="Separate by comma if more than one..." name="degres"></td></tr>

<?php }else{ ?>




<?php } } ?>
</table>
</div>




<?php      unset($properties);  
endif;


break;
  

}             }
                                                 

if(isset($_GET['nm_time'])){              
if($_GET['nm_time'] == "notifs"){
$notifs_grab = mysqli_query($db_main, "SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,10");
if(mysqli_num_rows($notifs_grab) > 0){

//$("#notifications .spacer").html().append("<a href='"+ data.notifs[i]['url'] +"'><div class='notifs'>"+ data.notifs[i]['content'] +"</div></a>");      
$x= -1;
while($notifs_zen = mysqli_fetch_assoc($notifs_grab)){    $x++;
$pawn[$x] = $notifs_zen;
$pawn[$x]['stamptime'] = time_rounds($pawn[$x]['stamptime']); //convert to time-rounds format
}


if(!isset($_GET['action'])){

$search_new = mysqli_query($db_main, "SELECT * FROM notifications WHERE status=0 AND towhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,10");

echo json_encode(array("result" => "new","unread" => mysqli_num_rows($search_new),"notifs" => $pawn),JSON_UNESCAPED_SLASHES);}

else{       //clear notifications
//10 at a time
//but delay it

//1 is read, 0 is unread

//delay it for the same amount of time as it would get refreshed, or maybe a little less

switch($_GET['action']){    //user profile actions

case "clearnotifs":
$clear_last_10 = mysqli_query($db_main, "UPDATE notifications SET status=1 WHERE towhom IN (SELECT towhom FROM(SELECT towhom FROM notifications WHERE towhom='$_MONITORED[login_q]' ORDER BY stamptime DESC LIMIT 0,10)tmp)");

if($clear_last_10){

$search_new = mysqli_query($db_main, "SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]' AND status=0 ORDER BY stamptime DESC LIMIT 0,10");



echo json_encode(array("result" => "completed","notifs_left" => mysqli_num_rows($search_new)),JSON_UNESCAPED_SLASHES);

}
break;


//we have to disable error displays here because timeout issues
//if the school's name was never listed before in the education database, we have to send the data to the school table, but first have the user clear up details for himself
//if a data name was never entered before as a column, alter the education table to make an entry for it
//then set the user's education to the respective recently posted school(s)



}
  

}

mysqli_free_result($search_new);    


/*
$.each(data.notifs,function(i,v){
$("#notifications .spacer").html().append("<a href='"+ data.notifs[i]['url'] +"'><div class='notifs'>"+ data.notifs[i]['content'] +"</div></a>");
});    */

}else{

$msgs = array("result" => "nonew");
echo json_encode($msgs);

}
}}

//and we're in                                                                               

if(isset($_GET['friend_status'])){
//who should we look up first
//oh right
//well it doesn't really matter

//all the friends actions


$check_2 = mysqli_query($db_main, "SELECT * FROM users WHERE username='".$_FILTERED['friend_status'][0]."'");
$check_3 = mysqli_fetch_assoc($check_2);
//first check for null, then check for values
if($salt['userid'] !== $check_3['userid']){    //not the same account, duh
//check for snowglobe permissions
$sea_rchin = mysqli_query($db_main,"SELECT * FROM sg_permissions WHERE access_type='friend snowglobe' AND towhom='$_MONITORED[login_q]' AND granted_by='$check_3[username]'");
if(mysqli_num_rows($sea_rchin) < 1){
if(!isset($_GET['action'])){ 
echo "<a href='add-friend' class='prompt button_samp rad'>Follow ".$check_3['username']."'s snowglobe</a>";
}else{         //not friends, and decided to give a friend request, and requestee's snowglobe is private
//this seems too much like facebook. eugh
//I want to change it to something else
//More like a twitter/IG kinda thing. Technically i'm still copying, but still

//get snowglobe settings
$snowglobe_check[0] = mysqli_query($db_main, "SELECT * FROM sg_settings WHERE id='user_".$check_3['userid']."'") or die($error);
$snowglobe_check[1] = mysqli_fetch_assoc($snowglobe_check[0]);

//a1_check is to see if people can follow/see the posted content of the snowglobe

if($snowglobe_check[1]['a1_check'] == "all"){    //public profile
 //later i'll have an option where a user could have a person following him follow the person who followed first
 unset($_SESSION['content_pool']);
$ng = mysqli_query($db_main, "INSERT INTO sg_permissions(access_type,towhom,date_g,granted_by) VALUES('friend snowglobe','$_MONITORED[login_q]',now(),'$check_3[username]')");
if($ng){
echo "<a href='add-friend' class='prompt button_samp rad greened'>Followed.</a>";  }
}

}

}else{
echo "<a href='add-friend' class='prompt button_samp rad greened'>Followed.</a>"; 
}

}
 mysqli_free_result($check_2);
}

if(isset($_GET['post_que'])){

if(isset($_GET['poll_vote'])){  //live polling
//get which id they voted on and check to see that it's a valid poll entry
$poll_settings = mysqli_query($db_main, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND define_set != 'poll_choice'");
while($settings_dt = mysqli_fetch_assoc($poll_settings)){
$p_nats[$settings_dt['define_set']] = $settings_dt['value'];
}
$get_poll = mysqli_query($db_main, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND data_id=$_FILTERED[poll_vote] AND define_set='poll_choice'");  //more like, the poll vote data
$poll_choice_zen = mysqli_fetch_assoc($get_poll);

if($p_nats['choice_selection'] == 0){  //check if you can vote on more than one option

if(mysqli_num_rows($get_poll) > 0){
$poll_vote_check = mysqli_query($db_main, "SELECT * FROM pollvotes_q WHERE bywhom='$_MONITORED[login_q]' AND which_poll='$_FILTERED[post_que]'");



 //check if they've already voted
 if(mysqli_num_rows($poll_vote_check) < 1){
$poll_vote_q[1] = mysqli_query($db_main, "INSERT INTO pollvotes_q(bywhom,timeof,choice_id,which_poll) VALUES('$_MONITORED[login_q]',now(),'$_FILTERED[poll_vote]','$_FILTERED[post_que]')");      
$update = $poll_choice_zen['votes'] + 1;
$poll_vote_q[2] = mysqli_query($db_main, "UPDATE polls SET votes='$update' WHERE data_id='$poll_choice_zen[data_id]'");  
if($poll_vote_q[1] && $poll_vote_q[2]){

}     else{echo $error;}
}
//or not
}


}
//show poll results
$poll_disp = mysqli_query($db_main, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND define_set = 'poll_choice' ORDER BY data_id DESC");  $i = 0;
while($pchoi_dt = mysqli_fetch_assoc($poll_disp)){     $i++;     //get total
$total = ($i < 2) ? $pchoi_dt['votes'] : $pchoi_dt['votes'] + $total;
$pdisp_dt[$i] = $pchoi_dt;   
}
for($j = 1;$j <= count($pdisp_dt);$j++){           $pct = ($pdisp_dt[$j]['votes']/$total)*100;
echo "<div class='optionbox results'>" . $pdisp_dt[$j]['value'] . " (".$pct."%)</div>";
}

mysqli_free_result($poll_disp);
mysqli_free_result($get_poll);
mysqli_free_result($poll_vote_check);
mysqli_free_result($poll_settings);

}     

//votes
if(isset($_GET['vote_action'])){
$vote = ($_GET['vote_action'] == "up") ? "1" : "0";



//check to see if the user's already voted
$vote_q = mysqli_query($db_main, "SELECT * FROM votes_q WHERE bywhom='".$_MONITORED['login_q']."' AND which_post='$_FILTERED[post_que]'");
$post_check = mysqli_query($db_main, "SELECT * FROM posts WHERE postid=$_FILTERED[post_que]");
$post_dt = mysqli_fetch_assoc($post_check);
$residual = ($vote == "1") ? array($post_dt['upvotes']+1,$post_dt['downvotes']-1,1) : array($post_dt['upvotes']-1,$post_dt['downvotes']+1,0); //changed his mind, therefore upvotes should be 1 higher and downvotes 1 lower, and vice versa depending on how he voted.
if(mysqli_num_rows($vote_q) > 0){
$vote_dt = mysqli_fetch_assoc($vote_q);

if($vote_dt['vote'] == $vote){//trying to unvote where you vote
$vote_a = mysqli_query($db_main, "DELETE FROM votes_q WHERE which_post='$_FILTERED[post_que]' AND bywhom='$_MONITORED[login_q]'");
if($vote_a){


$msgs = array("notice" => "Unvoted!"); 
}
}else{


$vote_a = mysqli_query($db_main, "UPDATE votes_q SET timeof=now(),vote='$vote' WHERE which_post='$_FILTERED[post_que]';");
$vote_b = mysqli_query($db_main, "UPDATE posts SET upvotes=$residual[0],downvotes=$residual[1] WHERE postid=$post_dt[postid]");
if($vote_a && $vote_b){

$msgs = array("notice" => "Changed your mind and ".$_FILTERED['vote_action'] . "voted!");          
}else{echo mysqli_error($db_main);}}




}else{



//but if not
$vote_a = mysqli_query($db_main, "INSERT INTO votes_q(bywhom,timeof,which_post,vote) VALUES('$_MONITORED[login_q]',now(),'".$_GET['post_que']."','$vote');"); 
   //in here we only need the first result
   $residual_2 = ($vote == "1") ? intval($post_dt['upvotes'])+1 : intval($post_dt['downvotes'])+1;       
$vote_b = mysqli_query($db_main, "UPDATE posts SET ".$_FILTERED['vote_action']."votes='$residual_2' WHERE postid=$post_dt[postid] AND bywhom='$post_dt[bywhom]'");
if($vote_a && $vote_b){$msgs = array("notice" => $_FILTERED['vote_action'] . "voted!");

$msgs = array("notice" => $_FILTERED['vote_action'] . "voted!");}else{echo mysqli_error($db_main);}     
}
echo json_encode($msgs);
mysqli_free_result($vote_q);  mysqli_free_result($post_check);
}

}    }
mysqli_free_result($salt_check);
}



if(isset($_REQUEST['search_1'])){
    
if(is_array($_REQUEST['search_1'])){
for($z = 0; $z <= count($_REQUEST['search_1'])-1;$z++){
if(!$_REQUEST['search_1'][$z]){$_REQUEST['search_1'][$z] = "";}
$molded[$z] = htmlspecialchars($_REQUEST['search_1'][$z]);
} //my goodness

}    //$(molded)[1] or later will always be the outputs
else{return false;}                                            

if(preg_match("#^username2$#",$molded[0])){ //username check     
$mns = mysqli_query($db_main, "SELECT * FROM users WHERE username='".$molded[1]."'");
if(preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1]) && mysqli_num_rows($mns) < 1){ //no usernames registered? and also the usual limits
echo "<u>" .$molded[1] . "</u> has not been registered yet, and can be registered. &#10004";

}else{if(preg_match("#^[A-Za-z0-9-_]{4,16}$#", $molded[1])){ //priority 1 is checking to see if it fits the username criteria
if(mysqli_num_rows($mns) > 0){echo "This username is already taken, unfortunately. If you've already signed up and forgot your password, please go to the forgotten password page.";
//then if it's still available
}else{echo "<u>" .$molded[1] . "</u> has not been registered yet, and can be registered. &#10004";}}else{echo "Must be between 4-16 characters, numbers, letters and hyphens only (also an underscore)";}

}

mysqli_free_result($mns);

}


if(preg_match("#^pwrd2$#",$molded[0])){   //password
if(preg_match("#^(.){10,50}$#", $molded[1])){
echo "Valid password. &#10004";
}  else{echo "Password too short/too long. 10-50 characters";}
                                                                          
} 
if(preg_match("#^email2$#",$molded[0])){ //you know which one this is
if(preg_match("#^([-_A-Za-z0-9]){1,30}[@](([-_A-Za-z0-9]){1,100}[.])+([-_A-Za-z0-9]){1,100}[.]*(([-_A-Za-z0-9]){1,100})+$#", $molded[1])){echo "Well that's a valid email address. &#10004<br> To get the full features of Captivate, you must confirm your email address.";}else{echo "You did not enter a valid email address.";}              // email validation regexes don't usually account for subdomains, I feel like
} 
if(preg_match("#^fullname2$#",$molded[0])){
if(preg_match("#^([A-Za-z-]{2,})+[ ]([A-Za-z-]{2,}[ ]){0,2}([A-Za-z-]{2,})+$#",$molded[1])){
echo "Successfully registered your full name. &#10004";
}    else {echo "We just need a first and a last name."; }
}     }

     /*                              if($_GET['id'] == "1"){ //username search

$db_main2 = mysqli_query($db_main, "SELECT * FROM users WHERE username REGEXP '^" . $f_name [1]. "$'");
if(mysqli_num_rows($db_main2) < 1){  //no users signed up. Wasn't necessary to code for but i'm training
if(preg_match("/^[A-Za-z0-9-_]{4,16}$/", $f_name['1'])){echo "This username is available.";}

else{       echo "Remember, letters, numbers, a hyphen and an underscore only and must be between 4-16 characters";

}

}else{echo "asda";}
}

if($_GET['id'] == "2"){ 
echo "Time will be shown as " . date($_REQUEST['search_2'], $_SERVER['REQUEST_TIME']);
}
  */      exit();                  
?>