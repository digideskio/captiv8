<?php    
//if((count($_SESSION) > 0 || count($_COOKIE) > 0) && isset($_SESSION['login_q']) ){if(compare_dz($logged_zen['password'],$_SESSION['salt_q'])){
include("template/admin_djs.php");

echo "<div id='session_list'><h3>List of currently open session/cookie variables, among other things</h3><p>";
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
echo "</p>
<p><textarea class='flick' style='width:100%;' id='sql_parse'>Run any SQL queries here, as you wish... Press ENTER to submit it</textarea><span id='sql_results'></span></p>

</div>";    //   }   } 

?>