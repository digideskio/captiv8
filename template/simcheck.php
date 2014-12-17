<?php              //AJAX calls page
//this is the hotline center, bitchessssss     \

session_start();

$sync = mysqli_connect("localhost","root","","captiv8");  

require_once("vars.php");

function hack_free(&$data,$start = "0"){           global $sync; $child_count = $start;
   
  if(is_array($data)){  //check if it's array
  foreach($data as $i => $value){     //then loop for each data
  //why was I using for to reiterate each value instead of foreach again

  if(is_array($data[$i])){   //check for more kids
  for($j = 0;$j <= count($data[$i])-1;$j++){
  hack_free($value2[$i][$j],$child_count++);  
  }
  }else{    
                              $array_view = [];  

     for($i = 0;$i <= count($data)-1;$i++){ 
      $data[$i] = trim($data[$i]);
  $data[$i] = stripslashes($data[$i]);
  $data[$i] = htmlspecialchars($data[$i]);       /*le filters*/
    $data[$i] = mysqli_real_escape_string($sync,$data[$i]);
    
    if(count($array_view) > 0){ $array_view = array_merge(array($i => $data[$i]), $array_view);}else{ $array_view = array($i => $data[$i]);  }
 }
 return $array_view; 
  }
  }
  }else{
  
   $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
     $data = mysqli_real_escape_string($sync,$data);  
  return $data;  }
}

function compare_dz($a, $b) {
    if (strlen($a) !== strlen($b)) {
        return false;
    }
    $result = 0;
    for ($i = 0; $i < strlen($a); $i++) {
        $result |= ord($a[$i]) ^ ord($b[$i]);
    }
    return $result == 0;
}
foreach($_GET as $mkey => $mvalue){
$_FILTERED[$mkey] = hack_free($mvalue);
}
foreach($_SESSION as $mkey => $mvalue){
$_MONITORED[$mkey] = hack_free($mvalue);
}

//end security measures.....



  

if(isset($_GET['availability'])){
$filter = hack_free($_GET['availability']);
$mns = mysqli_query($sync, "SELECT * FROM users WHERE username='$filter'");
if(mysqli_num_rows($mns) > 0 ){echo "taken";}
mysqli_free_result($mns);
}


if(isset($_SESSION['login_q'])){  //logged in? This is for all the AJAX functions when you're logged in


$salt_check = mysqli_query($sync, "SELECT * FROM users WHERE username='$_SESSION[login_q]'");
$salt = mysqli_fetch_assoc($salt_check);

if(compare_dz($salt['password'],$_SESSION['salt_q'])){      //extra measures man

//and we're in                                                                               

if(isset($_GET['friend_status'])){
//who should we look up first
//oh right
//well it doesn't really matter

//all the friends actions
$check_2 = mysqli_query($sync, "SELECT * FROM users WHERE username='".$_FILTERED['friend_status'][0]."'");
$check_3 = mysqli_fetch_assoc($check_2);
//first check for null, then check for values
if($salt['userid'] !== $check_3['userid']){    //not the same account, duh
//check for snowglobe permissions
$sea_rchin = mysqli_query($sync,"SELECT * FROM sg_permissions WHERE access_type='friend snowglobe' AND towhom='$_MONITORED[login_q]' AND granted_by='$check_3[username]'");
if(mysqli_num_rows($sea_rchin) < 1){
if(!preg_match("#".$salt['userid']."#",$check_3['friends']) && !isset($_GET['action'])){ 
echo "<a href='add-friend' class='prompt button_samp rad'>Follow ".$check_3['username']."'s snowglobe</a>";
}else{         //not friends, and decided to give a friend request, and requestee's snowglobe is private
//this seems too much like facebook. eugh
//I want to change it to something else
//More like a twitter/IG kinda thing. Technically i'm still copying, but still

//get snowglobe settings
$snowglobe_check[0] = mysqli_query($sync, "SELECT * FROM sg_settings WHERE id='user_".$check_3['userid']."'");
$snowglobe_check[1] = mysqli_fetch_assoc($snowglobe_check[0]);

//a1_check is to see if people can follow/see the posted content of the snowglobe

if($snowglobe_check[1]['a1_check'] == "all"){    //public profile
 //later i'll have an option where a user could have a person following him follow the person who followed first
 unset($_SESSION['content_pool']);
$ng = mysqli_query($sync, "INSERT INTO sg_permissions(access_type,towhom,date_g,granted_by) VALUES('friend snowglobe','$_MONITORED[login_q]',now(),'$check_3[username]')");
if($ng){
echo "<a href='add-friend' class='prompt button_samp rad greened'>Followed.</a>";  }
}

}
 mysqli_free_result($snowglobe_check[0]);
}else{
echo "<a href='add-friend' class='prompt button_samp rad greened'>Followed.</a>"; 
}

}
 mysqli_free_result($check_2);
}

if(isset($_GET['post_que'])){

if(isset($_GET['poll_vote'])){  //live polling
//get which id they voted on and check to see that it's a valid poll entry
$poll_settings = mysqli_query($sync, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND define_set != 'poll_choice'");
while($settings_dt = mysqli_fetch_assoc($poll_settings)){
$p_nats[$settings_dt['define_set']] = $settings_dt['value'];
}
$get_poll = mysqli_query($sync, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND data_id=$_FILTERED[poll_vote] AND define_set='poll_choice'");  //more like, the poll vote data
$poll_choice_zen = mysqli_fetch_assoc($get_poll);

if($p_nats['choice_selection'] == 0){  //check if you can vote on more than one option

if(mysqli_num_rows($get_poll) > 0){
$poll_vote_check = mysqli_query($sync, "SELECT * FROM pollvotes_q WHERE bywhom='$_MONITORED[login_q]' AND which_poll='$_FILTERED[post_que]'");



 //check if they've already voted
 if(mysqli_num_rows($poll_vote_check) < 1){
$poll_vote_q[1] = mysqli_query($sync, "INSERT INTO pollvotes_q(bywhom,timeof,choice_id,which_poll) VALUES('$_MONITORED[login_q]',now(),'$_FILTERED[poll_vote]','$_FILTERED[post_que]')");      
$update = $poll_choice_zen['votes'] + 1;
$poll_vote_q[2] = mysqli_query($sync, "UPDATE polls SET votes='$update' WHERE data_id='$poll_choice_zen[data_id]'");  
if($poll_vote_q[1] && $poll_vote_q[2]){

}     else{echo $error;}
}
//or not
}


}
//show poll results
$poll_disp = mysqli_query($sync, "SELECT * FROM polls WHERE post_id_root=$_FILTERED[post_que] AND define_set = 'poll_choice' ORDER BY data_id DESC");  $i = 0;
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
$vote_q = mysqli_query($sync, "SELECT * FROM votes_q WHERE bywhom='".$_MONITORED['login_q']."' AND which_post='$_FILTERED[post_que]'");
$post_check = mysqli_query($sync, "SELECT * FROM posts WHERE postid=$_FILTERED[post_que]");
$post_dt = mysqli_fetch_assoc($post_check);
$residual = ($vote == "1") ? array($post_dt['upvotes']+1,$post_dt['downvotes']-1,1) : array($post_dt['upvotes']-1,$post_dt['downvotes']+1,0); //changed his mind, therefore upvotes should be 1 higher and downvotes 1 lower, and vice versa depending on how he voted.
if(mysqli_num_rows($vote_q) > 0){
$vote_dt = mysqli_fetch_assoc($vote_q);

if($vote_dt['vote'] == $vote){//trying to unvote where you vote
$vote_a = mysqli_query($sync, "DELETE FROM votes_q WHERE which_post='$_FILTERED[post_que]' AND bywhom='$_MONITORED[login_q]'");
if($vote_a){


$msgs = array("notice" => "Unvoted!"); 
}
}else{


$vote_a = mysqli_multi_query($sync, "UPDATE votes_q SET timeof=now(),vote='$vote' WHERE which_post='$_FILTERED[post_que]';UPDATE posts SET upvotes=$residual[0],downvotes=$residual[1] WHERE postid=$post_dt[postid]");
if($vote_a){

$msgs = array("notice" => "Changed your mind and ".$_FILTERED['vote_action'] . "voted!");          
}else{echo mysqli_error($sync);}}


}else{//but if not
$vote_a = mysqli_multi_query($sync, "INSERT INTO votes_q(bywhom,timeof,which_post,vote) VALUES('$_MONITORED[login_q]',now(),'".$_GET['post_que']."','$vote');UPDATE posts SET ".$_FILTERED['vote_action']."votes='$residual[2]' WHERE postid=".$post_dt['postid']."");    //in here we only need the first result
if($vote_a){$msgs = array("notice" => $_FILTERED['vote_action'] . "voted!");

$msgs = array("notice" => $_FILTERED['vote_action'] . "voted!");}else{echo mysqli_error($sync);}     
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
$mns = mysqli_query($sync, "SELECT * FROM users WHERE username='".$molded[1]."'");
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

$sync2 = mysqli_query($sync, "SELECT * FROM users WHERE username REGEXP '^" . $f_name [1]. "$'");
if(mysqli_num_rows($sync2) < 1){  //no users signed up. Wasn't necessary to code for but i'm training
if(preg_match("/^[A-Za-z0-9-_]{4,16}$/", $f_name['1'])){echo "This username is available.";}

else{       echo "Remember, letters, numbers, a hyphen and an underscore only and must be between 4-16 characters";

}

}else{echo "asda";}
}

if($_GET['id'] == "2"){ 
echo "Time will be shown as " . date($_REQUEST['search_2'], $_SERVER['REQUEST_TIME']);
}
  exit();   */      
?>