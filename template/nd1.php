<link rel="stylesheet" type="text/css" href="template/css.css">      <script src="template/jquery-.js" type="text/javascript"></script>
<style type="text/css">   /*internal helper*/
#session_list{opacity:.3;font:11px "lucida sans unicode",arial,"sans serif";border-radius:2px;color:#000;background:#fff;width:300px;padding:5px;position:fixed;bottom:10px;right:10px;text-shadow:none;text-align:left}
#session_list h3{text-align:center}
#session_list:hover{opacity:1}

</style>
<script src="template/jquery-ui.js" type="text/javascript"></script>

<?php


/*html start*/
echo "<title>";

if(isset($_GET['query']) && count($_GET) == 1 && compare_dz($logged_dt['password'],$_SESSION['salt_q'])){
echo "Editing Profile and Settings";
}

if(isset($_GET['direct']) || preg_match("#index.php([\072]([0-9]){0,15})*$#", extraurl())){

if(isset($_GET['direct'])){if($_GET['direct'] == "signup"){
echo "Sign up at Captivate";
}

  } else{echo "Captivate - Varied Social Media";} 
}
if(isset($_GET['profile'])){
echo "Captivate - ". $_FILTERED['profile']."'s snowglobe";
}

if(isset($_GET['thread_view'])){
$snip = (isset($_GET['comment'])) ? $nx['26'] : "";
echo preg_replace("#[\x26][a-z0-9]+[;]#","",$thread_data['title']) . $snip . "";
}

echo "</title>";      /*html end*/    include("js.php");
/*function effic($snipe,$variable,$test_value,$functionar){//for annoying isset checks
if(!isset($snipe)){return false;  //won't show PHP errors, I think
}
}else{if(isset($variable)){
if($test_value == $variable){$functionar();}
else{return false;}
}
else{$functionar();}
}       poor substitution for isset() checks, but i'll keep it for later reference anyway */
 ?>


