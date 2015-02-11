<?php              //AJAX calls page
//this is the hotline center, bitchessssss     \

session_start();      

date_default_timezone_set('America/Chicago');

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



if(isset($_GET['action'])){

switch($_GET['action']){

case "sql_q":   //first, test to check if it has a delete or drop statement
echo "<br>";
if(!preg_match("#[;]?[ ]{0,}(DELETE|DROP|delete|drop) #",$_POST['sql_q'])){

if(preg_match("#[;]?[ ]{0,}SELECT#",$_POST['sql_q'])){

$_POST['sql_q'] = (preg_match("#LIMIT[ ]+[0-9]+([,][ ][0-9]+)?[ ]{0,}[;]?[ ]{0,}$#",$_POST['sql_q'])) ? $_POST['sql_q'] : preg_replace("#^(.+)([;]?)[ ]{0,}$#","$1 LIMIT 0,100$2",$_POST['sql_q']) ;
}

$test_query = mysqli_query($db_main, $_POST['sql_q']);
if($test_query){  //successful SQL query?          
if(!preg_match("#^[ ]{0,}SELECT #",$_POST['sql_q'])){
echo "The query \"" . $_SPIN['sql_q'] . "\" was successful.";    }else{ //display rows!
//$get_rows = mysqli_fetch_assoc($test_query);
/*foreach($get_rows as $keys => $values){
$rows = isset($rows) ? array_merge([$keys],$rows) : [$keys];
} */  
echo "<table id='results'>";  

while($get_data = mysqli_fetch_assoc($test_query)){
$get_rows[] = $get_data;
foreach($get_data as $keys => $values){
$key_dump = (isset($key_dump) && array_search($keys,$key_dump) === false) ? array_merge($key_dump,[$keys]) : [$keys];  //all possible keys
}
}
    echo "<tr>";  echo "<th>#</th>";
foreach($key_dump as $field_names){
echo "<th>".$field_names."</th>";
}          
  echo "</tr>";   
foreach($get_rows as $get_rows2){  $x = isset($x) ? $x + 1 : 1; $y = (isset($y) && $y < 2) ? $y + 1 : 1;
echo "<tr>"; echo "<th>".$x."</th>";
foreach($get_rows2 as $keys => $values){  $z = (isset($z) && $z < 2) ? $z + 1 : 1;
$values = (strlen($values) > 250) ? preg_replace("#^(.+){247}(.+)$#","$1...",$values) : $values;
echo "<td class='a$y$z'>" . $values . "</td>";
}  unset($z); echo "</tr>";

} unset($y);
echo "</table><br>";  unset($x);
unset($key_dump); unset($get_rows);
mysqli_free_result($test_query);
}
}else{
echo "<div class='admin_notice'><strong>SQL error:</strong> ". mysqli_error($db_main) ." </div>";
}

}
break;

case "sg_url_avail":   
$sg_url_search = mysqli_query($db_main,"SELECT * FROM snowglobes WHERE sg_url='$_FILTERED[test]'");
if(mysqli_num_rows($sg_url_search) > 0){
echo "<div class='notice'>Unfortunately, this URL is not available.</div>";
}else{
echo "<div class='notice green'>This URL is available</div>";
}
break;

case "css_edit":
if(preg_match("#[.]css$#",$_POST['file'])){//nice try kids

$_POST['file'] = preg_replace("#^".$main_dir."(template[/])?(.+)$#","$2",$_POST['file']);

$file_opener = fopen($_POST['file'],"w+");
//convert the file strings back
//$_POST['data'] = preg_replace("#template[\057]#","",$_POST['data']);
//no longer a need for above as i've replaced the trim with the full url
$z = fwrite($file_opener, $_POST['data']);

if($z){echo json_encode(array("notice" => "success","bash" => "two"),JSON_UNESCAPED_SLASHES);       } 

}
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

//$.post("template/simcheck.php",{"action":"submit-chat-msg","towhom":$(this).parent().parent().attr("ref"),"message":$(this).parent().find(".chat_panel textarea").val()},function(message){

case "submit-chat-msg":      
  $chat_perms_check = mysqli_query($db_main, "SELECT a.towhom,a.granted_by FROM sg_permissions a, sg_permissions b WHERE a.towhom = b.granted_by AND a.granted_by = b.towhom AND a.access_type='friend snowglobe' AND b.access_type='friend snowglobe' AND a.towhom != a.granted_by AND b.granted_by !=b.towhom AND a.towhom = '$_MONITORED[login_q]' AND a.granted_by = '$_SPIN[towhom]' LIMIT 5");
  
  if(mysqli_num_rows($chat_perms_check) == 1){ 
$submit_post = mysqli_query($db_main, "INSERT INTO posts(content,cnttype,forwhom,bywhom,settings,is_read) VALUES('$_SPIN[message]','3','$_SPIN[towhom]','$_MONITORED[login_q]','2','0')"); //i'll use the settings column somehow for something in the future lol, probably privacy-related
echo (!$submit_post) ? mysqli_error($db_main) : "Successfully posted!";
}
mysqli_free_result($chat_perms_check);
break;

case "school_search":   

$select_school = mysqli_query($db_main,"SELECT * FROM school WHERE name LIKE '%$_FILTERED[search_q]%' AND ed_level='$_FILTERED[criteria]' ORDER BY name ASC LIMIT 0,5");

if($select_school && mysqli_num_rows($select_school) > 0){    echo "<div id='school_search'>";

while($properties = mysqli_fetch_assoc($select_school)){
    

?>
            <div class="school_shell">
<a href="confirm_school" class="school_box rad prompt name_only" name="<?php echo $properties['name'] ?>"><h3><?php echo $properties['name'] ?>      
                                                                                             <span>

<?php


      echo (isset($properties['established'])) ? " &middot; Established " . $properties['established'] : "";
      echo "</span></h3></a>";
      

}

echo "</div>";          

} else{


 if(preg_match("#([-A-Za-z]+)[ ]#",$_FILTERED['search_q'])){  

echo "<a href='index.php?query=".$_MONITORED['login_q']."&find=new_school' class='add-new rad'>". $nx[33] ."</a>";

}

}      

mysqli_free_result($select_school);

  break;
  
  case "chat_with_user":
  
  //find whether they're able to actually chat with the user whom they're trying to engage with

   
        if(isset($_GET['user'])){   //no idea why I set this for a conditional, figured it would help with validations and such
                                 
    if((isset($_GET['box_action']) && $_GET["box_action"] == "open") || isset($_GET['is_read'])){    
  $chat_perms_check = mysqli_query($db_main, "SELECT a.towhom,a.granted_by FROM sg_permissions a, sg_permissions b WHERE a.towhom = b.granted_by AND a.granted_by = b.towhom AND a.access_type='friend snowglobe' AND b.access_type='friend snowglobe' AND a.towhom != a.granted_by AND b.granted_by !=b.towhom AND a.towhom = '$_MONITORED[login_q]' AND a.granted_by = '$_FILTERED[user]' LIMIT 5");
  
  if(mysqli_num_rows($chat_perms_check) == 1){
  $search_for_posts = mysqli_query($db_main,"SELECT * FROM posts WHERE bywhom='$_MONITORED[login_q]' AND forwhom='$_FILTERED[user]' AND cnttype = '3' UNION SELECT * FROM posts WHERE bywhom='$_FILTERED[user]' AND forwhom='$_MONITORED[login_q]' AND cnttype = '3' ORDER BY stamptime DESC LIMIT 0,36");       
   while($zen = mysqli_fetch_assoc($search_for_posts)){
   foreach($zen as $key => $value){
   if($zen[$key] == null){unset($zen[$key]);}
   }
   $post_list[] = $zen;}
  $search_cha = (mysqli_num_rows($search_for_posts) > 0) ? array_reverse($post_list) : $nx['41'];

  echo json_encode(["message"=>"success","user"=>$_FILTERED['user'],"messages"=>$search_cha],JSON_UNESCAPED_SLASHES);
  }
     }
 if(isset($_GET["box_action"])){
switch($_GET["box_action"]){
                                                      
     case "open":
     chat_list_q("open",$_FILTERED['user']); //saves chat box to be open for reference to next page load(s)
     break;
     
     case "close":
     chat_list_q("close",$_FILTERED['user']); //deletes the other user's name from the array
     break;
}
}    
     
     }
     

         
if(isset($_GET['format'])){
switch($_GET['format']){    
     case "sync_in":
     $select_unreads = mysqli_query($db_main, "SELECT bywhom FROM posts WHERE forwhom='$_MONITORED[login_q]' AND is_read='0' AND cnttype='3' ORDER BY stamptime DESC LIMIT 0,99");
     if(mysqli_num_rows($select_unreads) > 0){
     while($zx = mysqli_fetch_assoc($select_unreads)){ //only the 5 most recent users among 100 latest replies, append duplicate names
     $new_replies_num = isset($new_replies_num) ? $new_replies_num + 1 : 1;
     $new_messages = (isset($row) && array_search($zx['bywhom'],$row) !== false) ? array_merge($row, $zx['bywhom']): [$zx['bywhom']];  
     }
     }
     echo json_encode(["new_messages" => (isset($new_messages)) ? $new_replies_num : 0,"senders" => (isset($new_replies_num) && $new_replies_num > 0) ? $new_messages : "none"]);
      unset($new_messages);        unset($new_replies_num);   
          
     break;  

}         }






if(isset($_GET['is_read'])){ //will be accessed upon the other user reading the messages
  $mark_as_read = mysqli_query($db_main, "UPDATE posts SET is_read = '1' WHERE cnttype='3' AND forwhom='$_MONITORED[login_q]' AND bywhom='$_FILTERED[user]'");
}
  
    unset($post_list);
  break;    //end chat search 
case "wikipedia_search":
            include("wikipedia_search.php");   
break;

case "confirm_school":
if(isset($_GET['data'])){
$strings = json_decode($_GET['data'],true); //rawwwwww
}else{$strings['name'] = $_GET['name'];}
//we gotta run a bunch of tests to determine the authenticity of this data mine

//check to see if the school's already in the database


$check_in_sys = mysqli_query($db_main, "SELECT * FROM school WHERE name ='".hack_free($strings['name'])."'");

if(mysqli_num_rows($check_in_sys) < 1){

if(preg_match("#high[ ]school#",strtolower($strings['name']))){
$school_level = "1";
}
if(preg_match("#(school (of)? )?(med([^ ]+)|law)( school)?|university|college#",strtolower($strings['name']))){
$school_level = "2";
}

if(!isset($school_level)){
//if not named either high school or university in the school's name    

//you're gonna have to reconfirm this list with a wikipedia entry

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
                   case "1":
                     $properties['ed_level'] = "High School";  
                   break;
                   case "2":
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
 $new_lines = mysqli_query($db_main, "ALTER TABLE school ADD COLUMN `".hack_free($nougatey)."` varchar(50)");
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


  $school_data = mysqli_query($db_main, "INSERT INTO school($trims[0]) VALUES(".hack_free($trims[1]).")");
  if($school_data){
  $fill_details = "yes";
  }
  
    



   unset($school_level);      unset($adjoiner);           }
   

}}  } else{
$fill_details = "yes";
$zen = mysqli_fetch_assoc($check_in_sys);
foreach($zen as $key => $value){
if($zen[$key] !== NULL){
$properties[$key] = $value;
}
}
}


$z = (isset($z)) ? $z + 1 : $z;          

                                             $znip = "i";
if(isset($fill_details) && !isset($_SESSION[$znip])):   
 $znip = preg_replace("#[^A-Za-z]#","",strtolower($properties['ed_level']));
$_SESSION[$znip] = "yes";     //start form
?>
<form class="zenith">
    <br>
<div class="contentbox fill_details"> <h3>Fill details</h3>        
 
<table><tr><th class="marginals" style="width:200px">School Name</th><td>
<input type="text" name="school" value="<?php echo $strings['name'] ?>" class="largeform <?php echo 'a' . $z; ?>" disabled="disabled" name="school_name" style="opacity:.5">          </td>
</tr>
<tr><th>Started:</th><td><input type="text" name="year_s" class="largeform flick <?php echo 'a' . $z; ?>" value="Input the year that you started going to this school."></td></tr>
<tr><th>Finished:</th><td><select class="largeform <?php echo 'a' . $z; ?>"  name="current_status"><option class="current <?php echo 'a' . $z; ?>" value="current" selected="selected">Currently Attending</option><option value="did_finish" value="finished">I finished attending this school.</option></select><input type="text" class="largeform flick inline <?php echo 'a' . $z; ?>" value="Insert Year Here..." name="year_finished" disabled="disabled">   <input type="text" style="display:none" name="edu_type" class="a1" value="<?php echo $properties['ed_level']; ?>">
<input type="submit" value="Complete Details" class="prompt" id="<?php echo 'a' . $z; ?>">
</td></tr>
<?php if(isset($school_level)){ switch($school_level){ case "1": ?> 
                                                                              
<tr><th>Degree/Major</th><td><input type="text" class="largeform flick <?php echo 'a' . $z; ?>" value="Separate by comma if more than one..." name="degrees"></td></tr>

<?php break; case "2": ?>



<?php break; ?>







<?php } ?>
</table>
</div>
</form>




<?php   }   
endif;   //end submission form
        unset($properties);     unset($fill_details);   unset($_SESSION[$znip]);
        unset($znip);

break; //end case "confirm_school"


case "complete_details":
                               
foreach($_GET['data'] as $q_k => $q_v){

$zing = preg_split("#[ ]:[ ]#",$q_v);
$zing[0] = preg_replace("#[ ]#","",$zing[0]);
$zing[1] = preg_replace("#^(.+)$#","$1",$zing[1]);

$parse[$zing[0]] = hack_free($zing[1]);

}

//test for validity

//school : Nettleton High School (Arkansas),year_s : 2012,current_status : did_finish,undefined : current,year_finished : 201


if(isset($parse['school']) && isset($parse['year_s']) && isset($parse['current_status']) && isset($parse['year_finished']) && isset($parse['edu_type'])){     //first


//check to see that they haven't registered their education for that school yet
$parse['school'] = preg_replace("#;#","",$parse['school']);
$edu_search= mysqli_query($db_main,"SELECT * FROM education WHERE school_name='$parse[school]' AND username='$_MONITORED[login_q]'");
if(mysqli_num_rows($edu_search) > 0){
                                                                                       
$school_confirm = mysqli_query($db_main, "SELECT * FROM school WHERE name='$parse[school]' AND ed_level='". hack_free($parse['edu_type'])."'");



if(mysqli_num_rows($school_confirm) > 0){  //second
if($parse['current_status'] == "current"){
$parse['year_finished'] = 0;
}
$opt_degree = ($parse['edu_type'] == "College") ? ",degree" : "";

$degrees = (isset($parse['degrees'])) ? "'".hack_free($parse['degrees']) . "'," : "";
$status = ($parse['current_status'] == "did_finish") ? "true" : "false";

$submit_results = mysqli_query($db_main, "INSERT INTO education(school_name".$opt_degree.",started,finished,is_current,forwhom) VALUES('$parse[school]',".$degrees."'$parse[year_s]','$parse[year_finished]','$status','$_MONITORED[login_q]')");

if($submit_results){
echo $nx['38'];
}
else{
echo mysqli_error($db_main); //echo $nx['39'];
}

}

mysqli_free_result($school_confirm);
}
        }

//submit to education

unset($parse);

break;  //end case "complete_details"
  

}//end $_GET['action'] switch loose comparison             

}//end $_GET['action'] conditional
                                                 

if(isset($_GET['nm_time'])){              
switch($_GET['nm_time']){
case "notifs":
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

}   //end "notifs" switch conditional




break;  

  }//end switch statement


}  //end $nm_time conditional

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