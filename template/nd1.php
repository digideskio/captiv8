<link rel="stylesheet" type="text/css" href="template/css.css">      <script src="template/jquery-.js" type="text/javascript"></script>

<script src="template/jquery-ui.js" type="text/javascript"></script>

<?php


/*html start*/
echo "<title>";

if(isset($_GET['query']) && compare_dz($logged_dt['password'],$_SESSION['salt_q'])){
switch(count($_GET)){
case 1: echo "Editing Profile and Settings";        break;
case 2: 
switch($_GET['dispos']){
case "new_school": 
echo "Captivate - Adding unlisted school"; 
break;
}

}
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


