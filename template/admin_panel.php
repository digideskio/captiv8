<?php 
     
if(isset($_SESSION['login_q']) && compare_dz($logged_zen['salt'],$_SESSION['salt_q']) && $logged_dt['userid'] == 1):

?>

<style type="text/css">   /*internal helper*/                             
#admin_panel{opacity:.3;box-shadow:0 3px 5px #292E35;font:11px "lucida sans unicode",arial,"sans serif"; text-align:left;
border-radius:2px;color:#000;background:#fff;width:450px;padding:5px;
position:fixed;<?php echo (isset($_SESSION['admin_panel']['xpos'])) ? "top" : "bottom" ?>:<?php echo (isset($_SESSION['admin_panel']['ypos'])) ? $_SESSION['admin_panel']['ypos'] : "10" ?>px;
<?php echo (isset($_SESSION['admin_panel']['xpos'])) ? "left" : "right" ?>:<?php echo (isset($_SESSION['admin_panel']['xpos'])) ? $_SESSION['admin_panel']['xpos'] : "10" ?>px;text-shadow:none;text-align:left;line-height:15px;word-wrap:break-word;z-index:2934923492}
#admin_panel a{color:#000;cursor:pointer}
#admin_panel h3{text-align:center;margin-bottom:4px;font-size:15px;}
#admin_panel:hover{opacity:1}
#admin_panel *{cursor:default}
#wrap_2 div[id]{display:none;}
#admin_panel div[id=panelcd],#admin_panel div[id].open,#admin_panel div[id=wrap_2],#wrap_2 div[id] div{display:block}
#panelcd{margin-top:4px;padding-top:4px;min-width:150px;width:150px;max-width:250px;}                                    
#panelcd a{color:#404040;cursor:pointer;margin:4px;display:block;padding:3px 8px 5px;text-decoration:none;background:#c0c0c0;box-shadow:0 -2px 2px #d0d0d0;border-top:1px solid #b8b8b8;}
#panelcd a:hover{background:#404040;color:#c0c0c0;border-top:1px solid #303030;box-shadow:0 -2px 2px #a0a0a0;text-shadow: 0 1px 0 #000}
#admin_panel textarea{width:100%;padding:6px;background:#e8e8e8;border:1px solid #e0e0e0;color:#000;text-shadow:0 0;box-shadow: 0 0;font:12px monospace;cursor:auto;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;}        
#admin_panel textarea:focus{border:1px solid #79A8C8}
div#v_sess{text-align:left}
#panelcd a.selected_link{background:#202020;border-top-color:#101010;color:#fff;cursor:default}
#panelcd a.selected_link:hover{box-shadow:0 -2px 2px #d0d0d0!important;}
a.link_view{display:block;background:#c0c0c0;margin: 0 5px 3px 0;padding:5px 10px;text-decoration:none}
a.link_view2{background:#d4d4d4;}
a.link_view2:hover{padding:4px 9px;border:1px dashed #808080;background:#f0f0f0;}

#admin_panel a.selected2{background:#333;color:#fff;cursor:default}
#admin_panel a.prompt.submit{background:#000;color:#fff;text-decoration:none;padding:4px 7px;display:inline-block;margin:5px 0}
#admin_panel h1{text-align:center;display:block;font-size:22px}
#t_wrap{max-width:100%;overflow:auto;max-height:400px;text-align:left}
#t_wrap table#results td,#t_wrap table#results th{padding:4px 6px;max-width:300px;}
#t_wrap table#results th{background:#000;color:#fff;}
td.a12,td.a21{background:#e8e8e8;}
td.a22{background:#d8d8d8}
#panels{padding:5px}
#admin_panel[currently_open=v_sess]{width:450px}
#admin_panel[currently_open=v_css],#admin_panel[currently_open=v_sql]{width:650px;}
#admin_panel[currently_open=v_post_settings]{width:750px;}
a.finish_button{display:inline-block;margin-bottom:0}          
.open{width:100%}                        
#admin_panel div[id=panel_opts]{display:block;text-align:right}
#panel_opts a{display:inline-block;padding:4px 8px;margin-left:3px;text-decoration:none;background:#e0e0e0;color:#333;border:1px solid transparent}
#panel_opts a:hover{background:#333;color:#e0e0e0}   
#admin_panel[minimized]{background:transparent;box-shadow: 0 0 0 transparent;padding:0;opacity:1}
#admin_panel[minimized][currently_open]{width:150px;}
#admin_panel[minimized] #wrap_2{display:none}
#admin_panel[minimized] #panel_opts{padding:0;margin:0;}
#admin_panel[minimized] #panel_opts a{display:none;background:#fff;color:#000;font-weight:bold;box-shadow: 0 0 10px #fff;}
#admin_panel[minimized] #panel_opts a[href='opts:minimize']{display:block;text-align:center;margin:0}  
#admin_panel input,#admin_panel select,#admin_panel option,#admin_panel button{font-size:11px;padding:2px 4px;background:#e0e0e0;color:#333;border:0;text-shadow: 0 0;border:1px solid #c0c0c0;cursor:auto}
#admin_panel input[type=text]:focus{box-shadow: 0 0;border:1px solid #79a8c8;}
#admin_panel option{border:0}       
#v_post_dt{max-height:500px;overflow-y:auto}
#v_post_dt th{padding:4px 12px 4px 6px;text-align:right}    
#v_post_dt td{padding:4px 6px}  
#admin_panel th[colspan]{font-size:14px;text-align:left;padding-right:6px}        
.pt_dt th{width:25%;}           
.pah{border:2px solid #000;}
.pah th{color:#fff;background:#000;padding:3px;text-align:center;}
.pah td{padding:3px}     
#admin_panel button{margin:3px 0;cursor:pointer;padding:4px 7px;font-family:"Tahoma","Sans-Serif";font-weight:bold}
#admin_panel button:focus,a.link_view2:focus,#panel_opts .selected_plink,#panel_opts a.selected_plink:hover{background:#79A8C8 url('<?php echo $main_dir; ?>template/img/white.png') repeat-x;color:#fff;border:1px solid #658EAE;box-shadow: 0 0;text-shadow:0 1px 0 #658EAE}
.link_view.link_view2:focus{color:#fff!important;padding:4px 10px;}
#admin_panel .fill_in input[type=text],#admin_panel .fill_in textarea{padding:5px;font:11px "Tahoma","Sans Serif";border:1px solid #c0c0c0}
#admin_panel .fill_in input[type=text]:focus,#admin_panel .fill_in textarea:focus{border:1px solid #79a8c8;}
.draggy h3{cursor:drag}                                  
#panel_opts .selected_plink,#panel_opts a.selected_plink:hover,a.link_view2:focus{background-position:bottom left;font-weight:normal;box-shadow:0 0 8px  #79a8c8}
#admin_panel .flick{color:#606060;font-style:italic}
#admin_panel .flick:focus,#admin_panel .named{color:#000;font-style:normal}
.open.not_yet *{display:none!important;}
.auto-bound{height:auto;max-height:300px;overflow-y:auto;}
.pah{border-collapse:collapse;border-spacing:0}
.pah td{border-bottom:1px dashed #c0c0c0}
.pah th{border-bottom:1px dashed #fff}
.pah th[colspan]{border:0}
.sql_q{font:12px monospace}
</style>


<?php

//root admin(s) view, ish
//okay, just made it draggable
                                    
function selected_class($text = null, $is_link = null){
if(!isset($text) && !isset($is_link)){
return isset($_SESSION['admin_panel']['current_view']) ? $_SESSION['admin_panel']['current_view'] : "v_sess";
}

if(isset($_SESSION['admin_panel']['current_view'])){
if($text == $_SESSION['admin_panel']['current_view']){
if(isset($is_link)){return " selected_link";}else{
return " class='open'";   }
}
}else{if($text == "v_sess"){
if(isset($is_link)){return " selected_link";}else{
return " class='open'"; }
}}
}                      //this(#admin_panel) will be open by default

$minimized_opt = (isset($_SESSION['admin_panel']['minimized'])) ? ' minimized="a"' : '';

echo "<div id='admin_panel' currently_open='".selected_class()."'".$minimized_opt.">
<div id='wrap_2'>
<h1>Admin Panel</h1>";  

?>  <table><tr>
<td id="panelcd" width="1%">
<a href="v_sess" class="prompt<?php echo selected_class("v_sess", true)?>">Environment Variables</a>
<a href="v_css" class="prompt<?php echo selected_class("v_css", true)?>">View CSS</a>
<a href="v_sql" class="prompt<?php echo selected_class("v_sql", true)?>">SQL Panel</a>
<a href="v_post_settings" class="prompt<?php echo selected_class("v_post_settings", true)?>">Threads/Replies</a>

</td>
  <td id="panels">
<?php  

echo "<div id='v_sess'".selected_class('v_sess').">
<h3>List of currently open session/cookie variables, among other things</h3><p>";
foreach($_SESSION as $key => $chest){
if(is_array($chest)){
foreach($_SESSION[$key] as $key2 => $value2){  //I'll stop at the first level
echo "<u>" . $key . " [ ".$key2." ]</u> - ";
echo (isset($value2) && is_array($value2)) ? '<em>array</em>' : $value2 ;
echo "<br>";
}
}else{
echo "<u>". $key ."</u> - ". $chest . "<br>"; }
}
foreach($_COOKIE as $key2 => $chest2){
if(is_array($_COOKIE[$key2])){             $y = 0;
foreach($_COOKIE[$key2] as $subkey => $subchest){ 
echo "<u>" . $key2 . " [ ".$subkey." ] </u> - " . $subchest . "<br>";
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
  
  
  <div id="v_sql"<?php echo selected_class('v_sql') ?>> <h3>SQL Query Panel</h3><div id="t_wrap"></div>
  <div class="box"><textarea class="flick" id="sql_query">Type your SQL query here... Any SQL query that will drop a table, or delete a row will require a password.</textarea>
  <a href="submit_sql" class="prompt submit rad" refer="sql_query">Submit Query</a>
  </div></div>

  <div id="v_post_settings"<?php echo selected_class('v_post_settings') ?>>   <h3>Threads/Replies Settings</h3>
  <form id="v_post_dt" method="POST">
  
  <table>
  <tr><th colspan="2" name="t_r_view">Thread/Reply View</th></tr>
  <tr>
  <th width="50%">Number of replies to be shown per thread</th>
  <td>
  <select>
  <?php for($i = 1;$i <= 19;$i++){ $incr = isset($incr) ? $incr + 5 : 10;   ?>
  <option value="<?php echo $incr; ?>"><?php echo $incr; ?></option>
  <?php } ?>  
  </select>
  </td>
  </tr>
  </table>
  <table>                                                      
  <tr id="post_types"><th colspan="2" name="post_types">Thread Types</th></tr>
  <tr><td colspan="2" style="text-align:center">Loading...</td></tr> 
  </table>
  
  </div>

  </td></tr></table>

 </div> 
  <div id="panel_opts"><a href="opts:minimize" class="prompt rad"><?php echo (isset($_SESSION['admin_panel']['minimized'])) ? "Maximize" : "Minimize"; ?> Panel</a><a href="opts:drag" class="prompt rad">Enable Drag</a></div>

</div> 


<script type="text/javascript"> 
$("body").on('keyup','#jones',function(){  
$("style[title='"+$(this).attr('title')+"']").html($(this).val());
});
//if($(".selected_link").attr("href") == "v_css" || $(".selected_link").attr("href") == "v_sql" ){   $("#admin_panel").css({"width":"650px"}); 

if(typeof $("#admin_panel").attr("minimized") === "undefined"){    
$(".open").hide();
true_width = $("#panels").outerWidth() -10;
$(".open").attr('style',"width:"+true_width+"px");
}

$.get("<?php echo $main_dir; ?>template/simcheck.php",{"fetch":"post_type_panel"},function(html_content){
$("#post_types").next("tr").remove().end().after(html_content);
});                                                                          

$("link[rel=stylesheet]").each(function(){  
$("#v_links").prepend("<a href='edit:"+$(this).attr("href")+"' class='prompt link_view rad'>"+$(this).attr("href")+"</a>");
});

$.get("<?php echo $main_dir; ?>template/simcheck.php",{"action":"drag_box","screen_max":[screen.availWidth,screen.availHeight,$("#admin_panel").width(),$("#admin_panel").height()]}); 
$("#admin_panel").draggable().on('drag',function(event){
positions = [$("#admin_panel").offset().top,$("#admin_panel").offset().left];

$(this).css("bottom","inherit");


         
}).on('dragstop',function(){$.get("<?php echo $main_dir; ?>template/simcheck.php",{"action":"drag_box","offsets":[positions[1],positions[0]]});  });

$("#admin_panel").draggable("disable");
</script>



<?php endif; ?>
