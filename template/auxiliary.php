<?php

function extraurl(){
if(strlen($_SERVER['QUERY_STRING']) > 0){$snp = $_SERVER['PHP_SELF'] ."?". $_SERVER['QUERY_STRING'];}else{$snp = $_SERVER['PHP_SELF'];}
return $snp;
}
$dir = "template/img/";  
$error = "<div class='contentbox'> <h3>SQL error</h3><p>" .mysqli_error($db_main) . "</p></div>";
 

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

     for($i = 0;$i <= count($data)-1;$i++){ 
      $data[$i] = trim($data[$i]);
  $data[$i] = stripslashes($data[$i]);
  $data[$i] = htmlspecialchars($data[$i]);       /*le filters*/
    $data[$i] = mysqli_real_escape_string($db_main,$data[$i]);
    
    if(count($array_view) > 0){ $array_view = array_merge(array($i => $data[$i]), $array_view);}else{ $array_view = array($i => $data[$i]);  }
 }
 return $array_view; 
  }
  }
  }else{
  
   $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
     $data = mysqli_real_escape_string($db_main,$data);  
  return $data;  }
}function clear_array(&$listof, $search = "", $value_search = ""){
if(is_array($listof)){
foreach($listof as $key => $value){
if(strlen($search) > 0 || strlen($value_search) > 0){

if(preg_match("#^".$search."#",$key)){unset($listof[$key]);}
}}
}}
if($_SERVER['REQUEST_METHOD'] == "POST"){foreach($_POST as $key => $room){ $z++;
$_SPIN[$key] = preg_replace("/[\n]/","<br>",$_POST[$key]); 
$_DATA[$key] = $_SPIN[$key];
$_SESSION['free_sess_' . $key] =  $_SPIN[$key]; //post name array key, filtered and also a free session!
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
if($diff < 3600*24*7*30 && $diff > (3600*24*7)-1){   $scheck = plural(floor($diff/(3600*24*7)));
$date2 = floor($diff/(3600*24*7)) . " week".$scheck." ago";                                  
}
if($diff < 3600*24*7*365 && $diff > (3600*24*7*30)-1){  $scheck = plural(floor($diff/(3600*24*30)));
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