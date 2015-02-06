<?php

class reply_format { //first time doing classes
//hm
//better clock in
public function show(&$array_name){  global $reply_wrap,$logged_dt;
//get the reply template

//going to load the reply template from vars.php
//$array_name will be the array that's called from the for/while loop that'll be getting all the replies
//you can find it at vars.php

echo $reply_wrap[0]. "<h4><a href='/profile/".$array_name['bywhom']."'>".$array_name['bywhom']."</a></h4>".$reply_wrap[1].$array_name['content']. " ". $reply_wrap[2] ." <a href='/thread/".$_GET['thread_view']."/comment/".$array_name['topic_hash'] ."'>". date(dflt_date_f, strtotime($array_name['stamptime'])) . $reply_wrap[3]; 

if(isset($_SESSION['login_q']) && compare_dz($logged_dt['password'],$_SESSION['salt_q'])){
echo $reply_wrap[4] . " alt='".$array_name['postid']."'>";

echo "<a href='#' class='comment_opts rad comment_q-u' id='post_".$array_name['postid']."' name='post_".$array_name['postid']."'>Reply</a>";
//admin rights, mod rights, and then user's rights to their own posts
if($logged_dt['userid'] == 1){
echo "<a href='#' class='comment_opts rad edit' id='edit_".$array_name['postid']."'>Edit</a>";
}

echo $reply_wrap[5];

} echo $reply_wrap[6];
}

}
     

require_once("lib/simple_html_dom.php");


function chat_list_q($status,$user){ //get list of users
//search for a user's current tabbed users
global $db_main,$_MONITORED;
$logged_dt_again = mysqli_query($db_main,"SELECT tabbed_users FROM users WHERE username='$_MONITORED[login_q]'");
$logged_dt_c = mysqli_fetch_assoc($logged_dt_again);
$logged_dt_c = ($logged_dt_c['tabbed_users'] !== "[]") ? json_decode($logged_dt_c['tabbed_users']) : "";
//json_decode it



switch($status){
case "open": 
//update it
if(count($logged_dt_c) < 5){       //check if it's empty and that there's less than 5 of it in
$logged_dt_c = (is_array($logged_dt_c) && array_search($user,$logged_dt_c) === false) ? array_merge($logged_dt_c,[$user]) : [$user]; //the latter condition is there to prevent name duplicates
}
break;
case "close": 
unset($logged_dt_c[array_search($user,$logged_dt_c)]);  //i'm very lazy
break;
}
$logged_dt_c = json_encode($logged_dt_c);

//json_encode it back, and reupload to server the new information  
$update_q = mysqli_query($db_main, "UPDATE users SET tabbed_users='$logged_dt_c' WHERE username='$_MONITORED[login_q]'");

mysqli_free_result($logged_dt_again);

}

if(isset($_GET['error_reporting']) && $_GET['error_reporting'] == "false"){      //This would be helpful for all get
error_reporting(~E_ALL);
}

function extraurl(){
if(strlen($_SERVER['QUERY_STRING']) > 0){$snp = $_SERVER['PHP_SELF'] ."?". $_SERVER['QUERY_STRING'];}else{$snp = $_SERVER['PHP_SELF'];}
return $snp;
}
$dir = "template/img/";  
$error = "<div class='contentbox'> <h3>SQL error</h3><p>" .mysqli_error($db_main) . "</p></div>";



$server_mash = "http://" . $_SERVER['SERVER_NAME'] .$_SERVER['PHP_SELF'];

$main_dir = preg_replace("#(index[.]php|template[/](.+)[.]php)[/]?#","",$server_mash) ;
$image_dir = $main_dir . $dir;






function redir_process($url){ global $allow_redirs;
if($allow_redirs == true){header($url);      }
}

$time = [
'now' => time()


];
 

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
function hack_free(&$data,$start = "0"){           global $db_main,$sync; $child_count = $start;
   
  if(is_array($data)){  //check if it's array
  foreach($data as $i => $value){     //then loop for each data
  //why was I using for to reiterate each value instead of foreach again

  if(is_array($data[$i])){   //check for more kids
  foreach($data[$i] as $j => $value2){
  hack_free($value2[$i][$j],$child_count++);  
  }
  }else{    
                              $array_view = [];  

     for($i = 0;$i <= count($data)-1;$i++){       $data[$i] = mysqli_real_escape_string($db_main,$data[$i]);
      $data[$i] = trim($data[$i]);
  $data[$i] = stripslashes($data[$i]);
  $data[$i] = htmlspecialchars($data[$i]);       /*le filters*/

    
    if(count($array_view) > 0){ $array_view = array_merge(array($i => $data[$i]), $array_view);}else{ $array_view = array($i => $data[$i]);  }
 }
 return $array_view; 
  }
  }
  }else{
        $data = mysqli_real_escape_string($db_main,$data);  
   $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);

  return $data;  }
}function clear_array(&$listof, $search = "", $value_search = ""){
if(is_array($listof)){
foreach($listof as $key => $value){
if(strlen($search) > 0 || strlen($value_search) > 0){

if(preg_match("#^".$search."#",$key)){unset($listof[$key]);} 
}}
}}
if($_SERVER['REQUEST_METHOD'] == "POST"){foreach($_POST as $key => $room){ $z = isset($z) ? $z + 1 : 0;
$copy = $_POST[$key];
$_SPIN[$key] = mysqli_real_escape_string($db_main,preg_replace("/[\x27]/","&#39;",preg_replace("#[\n]#","<br>",htmlspecialchars($copy)))); //so mysqli_real_escape string doesnt do its job correctly no
$_DATA[$key] = $_SPIN[$key];
$clone[$z] = $_SPIN[$key];             //increment array key
                   //lol spin and data are essentially the same thing
   }
                                                          
   
}
foreach($_SESSION as $mkey => $mvalue){ //reiterate each session and array 
$_MONITORED[$mkey] = hack_free($mvalue);
$_MICRORFID[$mkey] = mysqli_real_escape_string($db_main, $_MONITORED[$mkey]);
}
foreach($_GET as $mkey => $mvalue){
$_FILTERED[$mkey] = hack_free($mvalue);
} 
 function rpd($string){
 return preg_replace("/(.{1})(.{2})(.{1})(.{2})(.{1})(.{2})(.{0,5})(.{0,2})(.{0,3})(.{0,4})(.{0,5})(.{0,2})(.{0,3})(.{0,4})(.{0,5})(.{0,2})(.{0,3})(.{0,4})/","$8$5$7$6$18$1$12$6$13$5$2$9$4$17$12$8$5$7$6$18$1$12$6$13$5$2$9$4$17$12$5$2$9$3$10$8$11$16$12$14$7$11$4$5$7$4$3$5$6$1$8$7$6$7$2$9$11$5$6",$string);
}   //scrambled eggs


 function master_hash($string,$limit = "1029401241242"){
 $string2 = substr(hash('sha512', $string),0, $limit);
 return $string2;
 }
 
 function time_rounds($date){
$diff = time() - strtotime($date);
if($diff < 60){

$date2 = "Less than a minute ago";
}    
if($diff < 3600 && $diff > 59){     $scheck = plural(floor($diff/(3600*24)));
$date2 = floor($diff/(60)) . " minute".plural(floor($diff/(60)))." ago";                                  
}
if($diff < 3600*24 && $diff > 3599){   $scheck = plural(floor($diff/(3600*24)));
$date2 = floor($diff/(3600)) . " hour".plural(floor($diff/(3600)))." ago";                                  
}
if($diff < 3600*24*7 && $diff > (3600*24)-1){
$scheck = plural(floor($diff/(3600*24)));
$date2 = floor($diff/(3600*24)) . " day".$scheck." ago";                                  
}
if($diff < 3600*24*30.46 && $diff > (3600*24*7)-1){   $scheck = plural(floor($diff/(3600*24*7)));
$date2 = floor($diff/(3600*24*7)) . " week".$scheck." ago";                                  
}
if($diff < 3600*24*7*365 && $diff > (3600*24*30.46)-1){  $scheck = plural(floor($diff/(3600*24*30)));
$date2 = floor($diff/(3600*24*30)) . " month".$scheck." ago";                                  
}
if($diff > (3600*24*7*365)-1){ $scheck = plural(floor($diff/(3600*24)));
$date2 = floor($diff/(3600*24*7*365)) . " year".$scheck." ago";                                  
}
return $date2;
}                        function plural($s){
if($s > 1){return "s";}
}
$z = 0;
function mlmt($snipe,$nd = "28"){
substr($snipe,$nd);
}

?>