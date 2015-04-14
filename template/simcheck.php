<?php              
//AJAX calls page
//this is the hotline center, bitchessssss 

//made that comment months ago, I just gotta say: what an obscure metaphor.

//I should get appropriate headers here to prevent DDOS's later.

session_start();      

date_default_timezone_set('America/Chicago');

$db_main = mysqli_connect("localhost","root","","captiv8");  

require_once("vars.php");

require_once("auxiliary.php");


if(isset($_GET['availability'])){
$filter = hack_free($_GET['availability']);
$mns = mysqli_query($db_main, "SELECT username FROM users WHERE username='$filter'");
if(mysqli_num_rows($mns) > 0 ){echo "taken";}
mysqli_free_result($mns);
}

if(isset($_SESSION['login_q'])){  //Inside this conditional are all the server requests from a page that requires a user to be logged in

if(compare_dz($logged_dt['salt'],$_SESSION['salt_q'])){      //extra measures
//probably unnecessary, but maybe not

if(isset($_GET['action'])){

switch($_GET['action']){

case "sync_all":

$sync_in = 
[
[mysqli_query($db_main,"SELECT * FROM notifications WHERE towhom='$_MONITORED[login_q]' AND status='0' ORDER BY stamptime DESC"),"notifs"]
 ,
[mysqli_query($db_main, "SELECT * FROM posts WHERE forwhom='$_MONITORED[login_q]' AND is_read='0' AND cnttype='3'"),"chat"]
];

for($i = 0; $i <= count($sync_in) -1;$i++){  $shill = [$sync_in[$i][1] => mysqli_num_rows($sync_in[$i][0])];
merge($new_unreads,$shill);

if(mysqli_num_rows($sync_in[$i][0]) > 0){
mysqli_free_result($sync_in[$i][0]);
}
}


echo json_encode($new_unreads);

unset($new_unreads);


break;

case "sg_scha":

if(isset($_GET['sg'])){
    $sg_call_and_pass = [mysqli_query($db_main,"SELECT * FROM snowglobes WHERE sg_name='$_FILTERED[sg]'"),
    mysqli_query($db_main,"SELECT * FROM sg_permissions WHERE granted_by='$_FILTERED[sg]' AND towhom='$_MONITORED[login_q]'")];
    
    if($sg_call_and_pass[0] && $sg_call_and_pass[1] && mysqli_num_rows($sg_call_and_pass[0]) > 0){
    //if a user's banned from posting, then he'll have "none" on his posting rights
    //if a user unsubscribes and he has no posting rights, we're not going to delete that data field, but rather just have it as "unsubscribed"
        if(mysqli_num_rows($sg_call_and_pass[1]) > 0){  
            //you've done something in this snowglobe before, or got banned from it somehow lol
            $sgp_data_parse = mysqli_fetch_assoc($sg_call_and_pass[1]);
            if($sgp_data_parse['access_type'] !== "blocked"){
                if($sgp_data_parse['posting_rights'] == "none"){ //check if they're banned
                //then check if they're subscribed or unsubscribed
                    if($sgp_data_parse['access_type'] !== "snowglobe follow"){ 
                        $update_sg = [mysqli_query($db_main, "UPDATE sg_permissions SET access_type='snowglobe follow' 
                        WHERE granted_by='$_FILTERED[sg]' AND towhom='$_MONITORED[login_q]'"),"followed and banned"]; 
                    }
                    else{
                        $update_sg = [mysqli_query($db_main, "UPDATE sg_permissions SET access_type='unfollowed but banned' 
                        WHERE granted_by='$_FILTERED[sg]' AND towhom='$_MONITORED[login_q]'"),"unfollowed and banned"]; 
                    }
                }
                else{
                    $update_sg = [mysqli_query($db_main, "DELETE * FROM sg_permissions WHERE granted_by='$_FILTERED[sg]' 
                    AND towhom='$_MONITORED[login_q]'"),"unfollowed normally"]; 
                }
            }             
        }
        else{ //first time following/subcribing/etc
            $update_sg = [mysqli_query($db_main, "INSERT INTO sg_permissions(access_type,towhom,date_g,granted_by,posting_rights) 
            VALUES('snowglobe follow','$_MONITORED[login_q]',now(),'$_FILTERED[sg]','both')"),"newly subscribed"]; 
        }
        if(!$update_sg[0]){  //SQL error somehow
            echo mysqli_error($db_main);
        }
        switch($update_sg[1]){
            case "followed and banned":
                echo "Followed! Unfortunately, you have no posting rights.";
            break;
            case "unfollowed and banned":
            case "unfollowed normally":
                echo "Unfollowed.";
            break;
            case "newly subscribed":
                echo "Successfully followed.";
            break;
        }
    }
}
break;
//  {"action":"sg_view_save","pt_id":$(this).attr("id"),"number_type":$(this).parent().parent().attr("id")},
//   <a href="select_of_p_type" class="promptif(isset($_SESSION['saved_pt_views'][$sg_details['sg_id']][$p_type['pt_id']])):  pt_toggle" id=" echo $p_type['pt_id'];"><span>echo $p_type['call_name']; </span>
case "sg_view_save":    
    $_GET['sg_id'] = intval($_GET['sg_id']);   
    $_GET['pt_id'] = intval($_GET['pt_id']);                           
    if(!isset($_SESSION['saved_pt_views'][$_GET['sg_id']][$_GET['pt_id']]) && $_GET['pt_id'] !== 0){
        $_SESSION['saved_pt_views'][$_GET['sg_id']][$_GET['pt_id']] = true;   echo "in!";
    }
    else{
        if($_GET['pt_id'] !== 0){
            unset($_SESSION['saved_pt_views'][$_GET['sg_id']][$_GET['pt_id']]);     echo "out!";
        }
        else{
            unset($_SESSION['saved_pt_views'][$_GET['sg_id']]);  echo "back to default!";
        }
    } 
break;

case "get_sg_follow_status":
//make a new column under sg_permissions, and it'll define posting rights. It's going to be none, topics, posts, or both with default being both and none for people who are banned from posting.

if(isset($_GET['name'])){
$sg_caps = mysqli_query($db_main, "SELECT * FROM snowglobes WHERE sg_url='$_FILTERED[name]'");  $sg_parse = mysqli_fetch_assoc($sg_caps);
if(mysqli_num_rows($sg_caps) > 0){  //check if snowglobe exists and you can in fact follow it
//private snowglobes 
$sg_perm_check = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE granted_by = '$_FILTERED[name]' AND towhom='$_MONITORED[login_q]'");
if(mysqli_num_rows($sg_perm_check) > 0){  //then check if you've already been either banned or already followed/a mod/owner/etc
//if you're a mod/admin, you automatically have the snowglobe followed.
$spc_data = mysqli_fetch_assoc($sg_perm_check);
if($spc_data['access_type'] !== "blocked"){ //admins/mods lose their rights if they click the unfollow button when they're currently mods for that site
echo "<a href='sg_scha' class='prompt button_samp rad' sg='".$_FILTERED['name']."'>Unfollow</a>";
}
}else{

 if($sg_parse['sg_privacy'] == "public"){
echo "<a href='sg_scha' class='prompt button_samp rad greened' sg='".$_FILTERED['name']."'>Follow</a>";
}
}

 }  }
break;  //end snowglobe follow status

case "sql_q":   //first, test to check if it has a delete or drop statement
echo "<br>";
if(!preg_match("#[;]?[ ]{0,}(DELETE|DROP|delete|drop) #",$_POST['sql_q'])){

if(preg_match("#^[ ]{0,}(SELECT|select)#",$_POST['sql_q'])){

$_POST['sql_q'] = (preg_match("#LIMIT[ ]+[0-9]+([,][ ]{0,}[0-9]+)?[ ]{0,}[;]?[ ]{0,}$#",$_POST['sql_q'])) ? $_POST['sql_q'] : preg_replace("#^(.+)([;]?)[ ]{0,}$#","$1 LIMIT 0,100$2",$_POST['sql_q']) ;
$type = "row fetch";
}

@$test_query = mysqli_query($db_main, $_POST['sql_q']);
if($test_query){  //successful SQL query?          
if(!preg_match("#^[ ]{0,}SELECT #",$_POST['sql_q'])){
echo "The query \"" . $_SPIN['sql_q'] . "\" was successful.";    }else{ //display rows!
//$get_rows = mysqli_fetch_assoc($test_query);
/*foreach($get_rows as $keys => $values){
$rows = isset($rows) ? array_merge([$keys],$rows) : [$keys];
} */  

if(mysqli_num_rows($test_query) == 0) {
echo "No rows returned. Your SQL syntax is valid, but maybe your search criteria is wrong.";
}

if(mysqli_num_rows($test_query) !== null && mysqli_num_rows($test_query) > 0){
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
foreach($get_rows2 as $keys => $values){  $z = (isset($z) && $z < 2) ? $z + 1 : 1;       //let's get stylish
$values = (strlen($values) > 250) ? preg_replace("#^(.+){247}(.+)$#","$1...",$values) : $values;
echo "<td class='a$y$z'>" . $values . "</td>";
}  unset($z); echo "</tr>";

} unset($y);
echo "</table><br>";  unset($x);
unset($key_dump); unset($get_rows);
mysqli_free_result($test_query);
}
}
}else{
echo !preg_match("#^[ ]{0,}$#",$_POST['sql_q']) ? "<div class='admin_notice'><strong>SQL error:</strong> ". mysqli_error($db_main) ." </div>" : "You left the SQL query empty. Please input something.";
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

//admin panel stuff

case "drag_box":   
if(isset($_GET['screen_max'])){
if(isset($_SESSION['admin_panel']['xpos'])){
if((intval($_GET['screen_max'][0]) - $_GET['screen_max'][2] < $_SESSION['admin_panel']['xpos']) || (intval($_GET['screen_max'][1]) - $_GET['screen_max'][3] < $_SESSION['admin_panel']['ypos'])){unset($_SESSION['admin_panel']['xpos'],$_SESSION['admin_panel']['ypos']);}
}
}
if(isset($_GET['offsets'])){ 
$_SESSION['admin_panel']['xpos'] = intval($_GET['offsets'][0]);
$_SESSION['admin_panel']['ypos'] = intval($_GET['offsets'][1]);
}


break;

case "change_panels":
unset($_SESSION['admin_panel']['current_view']);

if($_GET['view'] !== "v_sess"){$_SESSION['admin_panel']['current_view'] = $_GET['view'];}

//no idea why I had so much code there previously

break;

case "admin_opts":
if(isset($_GET['req'])){
switch($_GET['req']){
case "minimize":    
//unsetting and setting sessions with ternary operators... kinda tacky?
//lol doesn't work
if(isset($_SESSION['admin_panel']['minimized'])){

unset($_SESSION['admin_panel']['minimized']);

}else{ 
  
$_SESSION['admin_panel']['minimized'] = "set";

}

break;
}
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

$select_school = mysqli_query($db_main,"SELECT * FROM school WHERE name LIKE '%$_FILTERED[search_q]%' AND school_type = '$_FILTERED[criteria]' ORDER BY name ASC LIMIT 0,5");

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
 mysqli_free_result($select_school);
}else{

if(preg_match("#([-A-Za-z]+)[ ]#",$_FILTERED['search_q'])){  

echo "<a href='".$main_dir."profile_nuise/".$_MONITORED['login_q']."/find/new_school' class='add-new rad'>". $nx[33] ."</a>";

}

}      



break;
case "submit_dt":  //quick AJAX POST request submissions

if(isset($_GET['dt'])){

$initial_validation_message = "Please correct the following information:";
$initial_search_test = "SELECT * FROM users WHERE username='$_MONITORED[login_q]'"; //if there's no initial data checks needed. What a tacky loophole right      
$successful_entry_msg = "";
$redir = "none";



//check for the a certain data field's availability



    /*     
    quick documentation for this. eugh
    necessary parameters:
    $table_name: table name to search
    $data_fields: data fields for submission to the DB
    $field_values: respective field values for data fields
    $message and $type (on success): to differentiate on JSON output

    optional parameters:
    $checks: each array value will be a sub-array containing the following field values based on index--created this
    for string comparisons/regex tests
         1st: regular expression test for data name
         2nd: message output on JSON if regex test fails
         3rd: field name of checked input
         4th (optional): if set, will compare with string input and if equivalent, will either 
         set it to the 5th value or set data on 3rd to be an empty string     
         5th (optional): if 4th is true, then it will be set to this value instead of blank.
    $misc_sql_queries = SQL queries to be processed.
         structure:
             if it's just a string, then it'll be processed after the first SQL query is processed and succeeded. Being processed after the first SQL query's succes is default.
             if it's an array, then all strings inside it will be recognized and processed with the default method.
                 all the sub-arrays' first string(which would be the SQL query) will be processed depending on the second string value 
                 depending on which one they are below
                     "before": will be processed before the first SQL query
                     "before data checks": will be processed before data checks
                     "after data checks": ...and after
                     "after": default method
    */ 
    
    //maybe later I should remove all these nasty--er, numerous variables with the properties/data and have it all be inputted into one class function, with constants from that same class returning the values to be processed
     

   require_once("dt_list.php");   



//begin data submission process

if(isset($misc_sql_queries)){ 
    $misc_query_list = is_array($misc_sql_queries) ? 
    [
        filter_sql_queries($misc_sql_queries,"before"),
        filter_sql_queries($misc_sql_queries,"after")
    ] :
    $misc_sql_queries;
    if(is_array($misc_sql_queries)){
        foreach($misc_query_list[0] as $query){
            $misc_q_exec = mysqli_query($db_main, $query);
            if(!$misc_q_exec){
                $message .= "\n(SQL error: " . mysqli_error($db_main) . ")";
            }
        }    
    }
} //return a string if it's not an array, otherwise separate them into their orders

$valid_search = mysqli_query($db_main, $initial_search_test);
if(mysqli_num_rows($valid_search) < 1){
    if(isset($checks)){
        foreach($checks as $testing_values){ if($testing_values[0] === 0){ $error_d = "c"; } 
            //convert it to empty string or if a 4th string in the array is set, then switch to that value if it was left untouched 
            //with placeholder as value back in client-side
            if(isset($testing_values[3]) && ($testing_values[3] == $_DATA[$testing_values[2]])){
                $_DATA[$testing_values[2]] = isset($testing_values[4]) ? $testing_values[4] : "";
            }
        }
    }
    //check for data validity
    if(!isset($error_d)){
        $insert_in = mysqli_query($db_main, "INSERT INTO ".$table_name."($data_fields) VALUES($field_values)");
        if($insert_in){
            if(isset($misc_sql_queries)){
                //default place of miscellaneous SQL queries, therefore has strings if it's only one
                if(is_array($misc_sql_queries) && $misc_sql_queries[1]){
                    foreach($misc_sql_queries[1] as $query){
                        $misc_q_exec = mysqli_query($db_main, $misc_sql_queries);
                        if(!$misc_q_exec){
                            $message .= "\n(SQL error: " . mysqli_error($db_main) . ")";
                        }
                    }
                }
                else{
                    $misc_q_exec = mysqli_query($db_main, $misc_sql_queries);
                    if(!$misc_q_exec){
                            $message .= "\n(SQL error: " . mysqli_error($db_main) . ")";
                    }       
                }    
            }
            $message = $successful_entry_msg;
            $type = "success";
        }
        else{
            $message = "SQL query failed--" . mysqli_error($db_main);
            $type = "fail";
        }
    }
    else{
        $message = $initial_validation_message;
        foreach($checks as $validations){   
            if($validations[0] !== 1){ 
                $x = isset($x) ? $x + 1 : 1;
                $message .= "\n".$x.". ". $validations[1];
            }
        }
        unset($x,$error_d);
    }
}

echo @json_encode(["type" => $type, "message" => $message,"redir" => $redir],JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE );
}
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
   if($key == "stamptime"){$zen[$key] = strtolower(time_rounds($zen[$key]));}
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
     echo "ahh";
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
 //i'm lazy so i'll do all the modifying for this later                      E
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
if(isset($school_level)){
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
          
  //March 7, 2015 edit: I'm going to limit the data queries to only the name, location, and number of students, and the kind of school that it is.
  //I guess i'm going to start dating my comments now
  //I originally intended the location to be the city name, but I haven't found a search method for cities that is consistent in all wikipedia entries
  
  $school_data = 
  [
  "name" => $properties['name'],
  "location" => isset($properties['coordinates']) ? $properties['coordinates'] : '',
  "enrollment" => $properties["numberofstudents"],
  "school_type"=> $properties["ed_level"],
  "link" => $properties["link"] 
  ]; //all that work and it turns out we only need those five data values...
  
  array_map("sql_filter",$school_data);

  $school_data = mysqli_query($db_main, "INSERT INTO school(name,location,enrollment_no,school_type,link) VALUES('$school_data[name]','$school_data[location]','$school_data[enrollment]','$school_data[school_type]','$school_data[link]')") or die(mysqli_error($db_main));
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
$ed_level = isset($properties['school_type']) ? $properties['school_type'] : $properties['ed_level'];

 $znip = preg_replace("#[^A-Za-z]#","",strtolower($ed_level));

?>

<?php if(!isset($_SESSION[$znip])): ?>    
<form class="zenith">
    <br>
<div class="contentbox fill_details"> <h3>Fill details</h3>        
 
<table><tr><th class="marginals" style="width:200px">School Name</th><td>
<input type="text" name="school" value="<?php echo $strings['name'] ?>" class="largeform <?php echo 'a' . $z; ?>" disabled="disabled" name="school_name" style="opacity:.5">          </td>
</tr>
<?php if($properties['school_type'] == "College"): ?>
<tr><th>Degrees:</th><td><input type="text" name="degree_s" class="largeform flick <?php echo 'a' . $z; ?>" value="Degrees/Majors pursued (separate with a comma if it's more than one)"></td></tr> <?php endif; ?>
<tr><th>Started:</th><td><input type="text" name="year_s" class="largeform flick <?php echo 'a' . $z; ?>" value="Input the year that you started going to this school."></td></tr>
<tr><th>Finished:</th><td>
<select class="largeform <?php echo 'a' . $z; ?>"  name="current_status"><option class="current <?php echo 'a' . $z; ?>" value="current" selected="selected">Currently Attending</option>
<option value="did_finish" value="finished">I finished attending this school.</option></select>
<input type="text" class="largeform flick inline <?php echo 'a' . $z; ?>" value="Insert Year Here..." name="year_finished" disabled="disabled">  
 <input type="hidden" name="edu_type" class="a1" value="<?php echo $ed_level; ?>"> 
<input type="submit" value="Complete Details" class="prompt" id="<?php echo 'a' . $z; ?>">
</td></tr>
</table>
</div>
</form>  

<?php  $_SESSION[$znip] = "yes";   

endif; ?>


<?php      
endif;   //end submission form                    
unset($properties);     unset($fill_details);           unset($znip);

break; //end case "confirm_school"              
//for now let's set the maximum image size to 3 MB. I know kind of large, but i'll find a way to compress it somehow in the future


case "file_test": //image uploads
//for now i'll just limit each new post to one image upload
@$image_data = getimagesize($_FILES['file_upload']['tmp_name']);

//if the file is an image, then instantiating a variable with getimagesize to call the file name turns it into an array, so yeah
//no need to check for file extensions heeh

$json_message = ["message" => "","result" => ""];
if(isset($_POST) && is_array($image_data) && is_uploaded_file($_FILES['file_upload']['tmp_name']) && !isset($_SESSION['posted_an_image'])){

$size=$_FILES['file_upload']['size'];  
$max_size = isset($max_size) ? $max_size : 3000000;     
$name_for_ref = preg_replace("#(.+)[.].+$#","$1",$_FILES['file_upload']['name']);    

if($size < $max_size){   
$image_content = addslashes(file_get_contents($_FILES['file_upload']['tmp_name']));
$file_type = preg_replace("#image/(.+)$#","$1",$_FILES['file_upload']['type']);

$hash = substr(hash('sha512',sqrt(microtime(true))), 0, 25);
$check_duplicates = mysqli_query($db_main, "SELECT img_name,url_hash FROM images WHERE img_name='$name_for_ref' AND url_hash='$hash'");

if(mysqli_num_rows($check_duplicates) > 0){$hash_clone = strrev($hash_clone);}

$technically_uploading = mysqli_query($db_main, "INSERT INTO images(img_name,url_hash,image_blob,type,size,dimensions,uploaded_by,under_post) VALUES('$name_for_ref','$hash','$image_content','$file_type','$size','".$image_data[0]."x".$image_data[1]."','$_MONITORED[login_q]','0')");

if($technically_uploading){

$json_message['message'] = "File successfully uploaded!";
$json_message['result'] = "success";
$json_message['hash'] = $hash;
$json_message['file_type'] = $file_type;

mysqli_query($db_main, "UPDATE users SET image_in_limbo='".microtime(true)."' WHERE username='$_MONITORED[login_q]'");
}  else{echo mysqli_error($db_main);}


}else{
$json_message['message'] = "File too large. Please use another file.";
$json_message['result'] = "fail";
}

}else{
$json_message['message'] = "Only images are allowed to be uplaoded";
$json_message['result'] = "fail";
}

echo json_encode($json_message);
break;

case "complete_details":
                               
foreach($_GET['data'] as $q_k => $q_v){

$zing = preg_split("#:#",$q_v);

for($i = 0;$i <= count($zing) - 1; $i++){
$zing[$i] = preg_replace("#^[ ]+|[ ]+$#","",$zing[$i]);
}

$parse[$zing[0]] = hack_free($zing[1]);

}

//test for validity
//school : Nettleton High School (Arkansas),year_s : 2012,current_status : did_finish,undefined : current,year_finished : 201

if(isset($parse['school']) && isset($parse['year_s']) && isset($parse['current_status']) && isset($parse['year_finished']) && isset($parse['edu_type'])){     //first


//check to see that they haven't registered their education for that school yet
$parse['school'] = sql_filter($parse['school']);
$x = "SELECT * FROM education e, school s WHERE s.name='$parse[school]' AND e.school_id = s.s_id AND e.forwhom='$_MONITORED[login_q]'";  
//only one education entry per school per person
$edu_search= mysqli_query($db_main,$x) or die(mysqli_error($db_main));
if(mysqli_num_rows($edu_search) < 1){ 
                                                                                       
$school_confirm = mysqli_query($db_main, "SELECT * FROM school WHERE name='$parse[school]'");



if(mysqli_num_rows($school_confirm) > 0){  //second
//just to get some extra details

$get_deets = mysqli_fetch_assoc($school_confirm);

if($parse['current_status'] == "current"){
$parse['year_finished'] = 0;
}
$opt_degree = ($parse['edu_type'] == "College") ? "degree," : "";

$degrees = (isset($parse['degrees'])) ? "'".hack_free($parse['degrees']) . "'," : "";
$status = ($parse['current_status'] !== "did_finish") ? "true" : "false";

$submit_results = mysqli_query($db_main, "INSERT INTO education(".$opt_degree."started,finished,is_current,forwhom,school_id) VALUES(".$degrees."'$parse[year_s]','$parse[year_finished]','$status','$_MONITORED[login_q]','$get_deets[s_id]')") or die(mysqli_error($db_main));

if($submit_results){   
echo $nx['38'];
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


if(isset($_GET['fetch'])){ //display data

if(isset($_SESSION['login_q'])){

$get_admin_status = mysqli_query($db_main, "SELECT * FROM users WHERE username='$_MONITORED[login_q]' AND userid='1'");
//really need to make a way to classify an account as being "admin"
if(mysqli_num_rows($get_admin_status) == 1){  

switch($_GET['fetch']){

case "class_sg":
    if(isset($_GET['school_id'])):
        $search_all_sg = mysqli_query($db_main, "SELECT * FROM snowglobes WHERE special_settings='school' 
        AND reference_num='$_FILTERED[school_id]' LIMIT 0,25");
        if(mysqli_num_rows($search_all_sg) > 0):
            while($c_sg_dt = mysqli_fetch_assoc($search_all_sg)):
?>
                <!--  <?php echo $c_sg_dt['']; ?>   -->
                <div class="sgc">
                <h4><a href="<?php echo $main_dir; ?>sg/<?php echo $c_sg_dt['sg_url']; ?>"><?php echo $c_sg_dt['sg_name']; ?></a></h4>
                <div class="sg_desc"><?php echo $c_sg_dt['description']; ?></div> 
                <p>Created <?php echo time_rounds($c_sg_dt['creation_date']); ?></p> 
                </div>
<?php
            endwhile;
        endif;
    endif;
break;

case "post_type_panel":

$get_post_types = mysqli_query($db_main, "SELECT * FROM post_types ORDER BY pt_id DESC");
?>

<tr class="pt_dt"><th>Default Listing</th><td>

<?php if(mysqli_num_rows($get_post_types) > 0): ?>
<div class="auto-bound">
<?php
while($pt_dt = mysqli_fetch_assoc($get_post_types)):
if($pt_dt['for_which_sg'] == 0){
$pt_dt['for_which_sg'] = "All Snowglobes";
}else{
if($pt_dt['for_which_sg'] == 1){
$pt_dt['for_which_sg'] = "School Snowglobes";
}else{
$pt_dt['for_which_sg'] = "<a href='".$main_dir."sg/".$pt_dt['for_which_sg']."'>A Snowglobe</a>";
}

}
?>

<table class="pah"><tr>
<th colspan="2"><?php echo $pt_dt['call_name']; ?></th>
</tr>
<tr>
<th>Description</th><td><?php echo $pt_dt['description']; ?></td> </tr><tr>
<th>Applies to</th><td><?php echo $pt_dt['for_which_sg']; ?></td>
</tr>
</table><br>

<?php  endwhile;
      else: ?>

There are currently no post_types. Feel free to make one in the fill-in form below!   

</div>   
      
<?php endif; ?>

</td></tr>
<tr class="fill_in">
<th>Fill-In Form</th>
<td><input type="text" class="flick largeform" value="Name" name="pt_name">
<textarea name="pt_desc" class="flick largeform"><?php echo $nx['58'];?></textarea>       

<input type="text" class="flick largeform" value="<?php echo $nx['57'];?>" name="pt_sg_apply">
<button submit="new_thread_type" submit_call="pt_">Add New Post Type!</button>
</td>
</tr>

<?php

break;

}

}   

}}
                                                 

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
$check_2 = mysqli_query($db_main, "SELECT * FROM users WHERE username='".$_FILTERED['friend_status'][1]."'");
$check_3 = mysqli_fetch_assoc($check_2);
//first check for null, then check for values
if($logged_dt['userid'] !== $check_3['userid']){    //not the same account, duh
//check for snowglobe permissions
$sea_rchin = mysqli_query($db_main,"SELECT * FROM sg_permissions WHERE access_type='friend snowglobe' AND towhom='$_MONITORED[login_q]' AND granted_by='$check_3[username]'");
if(mysqli_num_rows($sea_rchin) < 1){
if(!isset($_GET['action'])){ 
echo "<a href='add-friend' class='prompt button_samp rad'>Follow ".$check_3['username']."'s snowglobe</a>";
}else{         

//not friends, and decided to give a friend request, and requestee's snowglobe is private
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


      exit();                  
?>