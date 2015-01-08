<?php
  
?>
<style type="text/css">   /*internal helper*/
#session_list{opacity:.3;font:11px "lucida sans unicode",arial,"sans serif";
border-radius:2px;color:#000;background:#fff;width:300px;padding:5px;
position:fixed;<?php echo (isset($_SESSION['xpos'])) ? "top" : "bottom" ?>:<?php echo (isset($_SESSION['ypos'])) ? $_SESSION['ypos'] : "10" ?>px;
<?php echo (isset($_SESSION['xpos'])) ? "left" : "right" ?>:<?php echo (isset($_SESSION['xpos'])) ? $_SESSION['xpos'] : "10" ?>px;text-shadow:none;text-align:left;line-height:15px;<?php echo (isset($_SESSION['hide'])) ? "display:none;" : ""; ?>}
#session_list h3{text-align:center}
#session_list:hover{opacity:1}
#session_list *{cursor:default}
#session_list h3,#session_list{cursor:move;}
                                                                  
</style>
<?php      
if((count($_SESSION) > 0 || count($_COOKIE) > 0) && isset($_SESSION['login_q'])){if(compare_dz($logged_zen['password'],$_SESSION['salt_q']) && $logged_dt['userid'] == 1){//root admin view, ish
                                    //okay, just made it draggable
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

</div>";       }   } 

?>
<script type="text/javascript"> 

$.get("template/simcheck.php",{"action":"drag_box","screen_max":[screen.availWidth,screen.availHeight]}); 

$("#session_list").draggable().on('drag',function(event){
positions = [$("#session_list").offset().top,$("#session_list").offset().left];

$(this).css("bottom","inherit");


         
}).on('dragstop',function(){$.get("template/simcheck.php",{"action":"drag_box","offsets":[positions[1],positions[0]]});  });

</script>