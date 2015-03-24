<?php
  
?>

<?php      
if(isset($_SESSION['login_q']) && (count($_SESSION) > 0 || count($_COOKIE) > 0)): 
if(compare_dz($logged_zen['password'],$_SESSION['salt_q']) && $logged_dt['userid'] == 1):

?>

<style type="text/css">   /*internal helper*/
#session_list{opacity:.3;box-shadow:0 3px 5px #292E35;font:11px "lucida sans unicode",arial,"sans serif"; text-align:left;
border-radius:2px;color:#000;background:#fff;width:350px;padding:5px;
position:fixed;<?php echo (isset($_SESSION['xpos'])) ? "top" : "bottom" ?>:<?php echo (isset($_SESSION['ypos'])) ? $_SESSION['ypos'] : "10" ?>px;
<?php echo (isset($_SESSION['xpos'])) ? "left" : "right" ?>:<?php echo (isset($_SESSION['xpos'])) ? $_SESSION['xpos'] : "10" ?>px;text-shadow:none;text-align:left;line-height:15px;word-wrap:break-word;<?php echo (isset($_SESSION['hide'])) ? "display:none;" : ""; ?> z-index:2934923492}
#session_list a{color:#000;cursor:pointer}
#session_list h3{text-align:center;}
#session_list:hover{opacity:1}
#session_list *{cursor:default}
#session_list h3,#session_list{cursor:move;}
#session_list div[id]{display:none;}
#session_list div[id] div{display:block}
#session_list div[id].open{display:block;}
#session_list div[id=panelcd]{display:block} 
#panelcd{margin-top:4px;padding-top:4px;}                                    
#panelcd a{color:#404040;cursor:pointer;margin:4px;display:inline-block;padding:3px 8px 5px;text-decoration:none;background:#c0c0c0;box-shadow:0 -2px 2px #d0d0d0;border-top:1px solid #b8b8b8}
#panelcd a:hover{background:#404040;color:#c0c0c0;border-top:1px solid #303030;box-shadow:0 -2px 2px #a0a0a0}
#session_list textarea{width:100%;padding:6px;background:#e8e8e8;border:1px solid #e0e0e0;color:#000;text-shadow:0 0;box-shadow: 0 0;font:12px monospace;cursor:auto;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}        
#session_list textarea:focus{border:1px solid #79A8C8}
div#v_sess{text-align:left}

#panelcd a.selected_link{background:#202020;border-top-color:#101010;color:#fff;cursor:default}
a.link_view{display:inline-block; background:#c0c0c0;margin-right:5px;padding:5px 10px;text-decoration:none}
a.link_view2{background:#d4d4d4;}
a.link_view2:hover{padding:4px 9px;border:1px dashed #808080;background:#f0f0f0;}
a.link_view2:focus{background:#79A8C8;color:#fff;border:1px solid #79a8c8;}
#session_list a.selected2{background:#333;color:#fff;cursor:default}
#session_list a.prompt.submit{background:#000;color:#fff;text-decoration:none;padding:4px 7px;display:inline-block;margin:5px 0}

#t_wrap{max-width:100%;overflow:auto;max-height:400px;text-align:left}
#t_wrap table#results td,#t_wrap table#results th{padding:4px 6px;max-width:300px;}
#t_wrap table#results th{background:#000;color:#fff;}
td.a12,td.a21{background:#e8e8e8;}
td.a22{background:#e0e0e0}

                                                                  
</style>


<?php


//root admin(s) view, ish
                                    //okay, just made it draggable
                                    
function selected_class($text, $is_link = NULL){
if(isset($_SESSION['current_view'])){
if($text == $_SESSION['current_view']){
if(isset($is_link)){return " selected_link";}else{
return " class='open'";   }
}
}else{if($text == "v_sess"){if(isset($is_link)){return " selected_link";}else{
return " class='open'";   }}}
}                      //this(#session_list) will be open by default

echo "<div id='session_list'><h3>Admin Panel</h3>";   

echo "<div id='v_sess'".selected_class('v_sess').">
<h3>List of currently open session/cookie variables, among other things</h3><p>";
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
echo "</p> </div>

";
       //switching styles
  ?>
  <div id="v_css"<?php echo selected_class('v_css') ?>>   <h3>CSS Files</h3>
  <div id="v_links"></div>
  

  </div>
  <div id="v_sql"<?php echo selected_class('v_sql') ?>> <h3>SQL Queries</h3><div id="t_wrap"></div>
  <div class="box"><textarea class="flick" id="sql_query">Type your SQL query here... Any SQL query that will drop a table, or delete a row will require a password.</textarea>
  <a href="submit_sql" class="prompt submit rad" refer="sql_query">Submit Query</a>
  </div></div>
  

<div id="panelcd">
<a href="v_sess" class="prompt<?php echo selected_class("v_sess", true)?>">Environment Variables</a>
<a href="v_css" class="prompt<?php echo selected_class("v_css", true)?>">View CSS</a>
<a href="v_sql" class="prompt<?php echo selected_class("v_sql", true)?>">SQL Panel</a>
</div>



<?php

echo"</div>";    
?>

<script type="text/javascript"> 
$("body").on('keyup','#jones',function(){  
$("style[title='"+$(this).attr('title')+"']").html($(this).val());
});
if($(".selected_link").attr("href") == "v_css" || $(".selected_link").attr("href") == "v_sql" ){
$("#session_list").css({"width":"650px"});
}

$("link[rel=stylesheet]").each(function(){  
$("#v_links").prepend("<a href='edit:"+$(this).attr("href")+"' class='prompt link_view rad'>"+$(this).attr("href")+"</a>");
});

$.get("template/simcheck.php",{"action":"drag_box","screen_max":[screen.availWidth,screen.availHeight,$("#session_list").width(),$("#session_list").height()]}); 

$("#session_list").draggable().on('drag',function(event){
positions = [$("#session_list").offset().top,$("#session_list").offset().left];

$(this).css("bottom","inherit");


         
}).on('dragstop',function(){$.get("<?php echo $main_dir; ?>template/simcheck.php",{"action":"drag_box","offsets":[positions[1],positions[0]]});  });

if($(".selected_link").attr("href") == "v_sql"){
$("#session_list").draggable("disable");
}


</script>



<?php


   endif;endif;
?>
