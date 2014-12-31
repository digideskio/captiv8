<?php   if(isset($_GET['phase'])){
if(isset($_COOKIE['limbooo'][0])){
  if($_GET['phase'] == "1"){
  if($_SESSION['db_query'] = "user registration"){
  
  //saltin'
  $salt = substr(sha1(md5(base64_encode(microtime() - mt_rand(1,microtime())*mt_rand(-1,1)))),0,20);      //pendulum
  $kripke = substr(hash('sha512', $salt . $_SESSION['reg_dt2']), 0, 40);
  
  $sn = mysqli_query($db_main, "INSERT INTO users(username,password,email,joindate,fullname,admin_notifs,month2,day2,year2,salt) 
  VALUES('$_MONITORED[reg_dt1]','$kripke','$_MONITORED[reg_dt3]',now(),'$_MONITORED[reg_dt4]','$_MONITORED[reg_dt8]','$_MONITORED[reg_dt6]','$_MONITORED[reg_dt5]','$_MONITORED[reg_dt7]','$salt');");  
  mysqli_query($db_main, "INSERT INTO sg_settings(id,a1_check,a2_check,a3_check,a4_check,a5_check) VALUES('user_".$_MONITORED['login_q']."','all','all','all','self','self')");
  mysqli_query($db_main, "INSERT INTO sg_permissions(access_type,towhom,granted_by) VALUES('friend snowglobe','$_MONITORED[reg_dt1]','$_MONITORED[reg_dt1]')");
  foreach($_MONITORED as $nkey => $nvalue){
if(preg_match("#^reg[_]dt[\055\1370-9a-z]+#", $nkey)){
unset($_SESSION[$nkey]);
} } 

  if(!$sn){echo "<div class='contentbox'> <h3>SQL error</h3><p>" .mysqli_error($db_main) . "</p></div>";

  }else{
  

  header("Location:index.php?phase=2");
  } }
  
  }else{
  header("Location:index.php?phase=2");}
  if($_GET['phase'] == "2"){   //inquire for successful data entry messages  
  if(isset($_COOKIE['limbooo'][1])){ 
  setcookie("glimpse","yuo",time()+1);
  }    
  if(!isset($_SESSION['login_q'])){setcookie('incorrect_password_notice','incorrect',time()+1);}
  clear_array($_SESSION,"free_sess_");
  
  if($_SESSION['db_query'] == "posted content-anything"){
  $latest = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom = '".$_MICRORFID['login_q']."' ORDER BY stamptime DESC");
  $actual = mysqli_fetch_assoc($latest);
  
  $clasp_tip = ($actual['parent'] != 0) ? $actual['parent'] : $actual['postid'];   //check to see if it's a thread to refer for a notification
  
  $parent_clasp = mysqli_query($db_main, "SELECT * FROM posts WHERE postid=$clasp_tip ORDER BY stamptime DESC"); $_SESSION['abc'] = mysqli_num_rows($parent_clasp); 
   $parent_call = mysqli_fetch_assoc($parent_clasp);
  if(mysqli_num_rows($parent_clasp) > 0 && compare_dz($parent_call['forwhom'],"self") !== 0){
  
  $parent_check = ($actual['bywhom'] == $parent_call['bywhom']) ? "no" : "yes";
  $no_notif = ($actual['cnttype'] == 2) ? $parent_check : "yes";
  //check if it's either a reply to a comment, or not a thread to your own snowglobe, or a reply to your own thread/comment post, so that it wouldn't be a redundant notification               
  //i'm getting the most recent comment with $parent_call ... I mean its parent post
  //dang it I have to learn how to do comments better
  $url_nu = ($actual['cnttype'] == "1") ? "thread_view=" . $actual['thread_nick'] . "_" . $actual['topic_hash'] : "comment=" . $actual['topic_hash'];      
  $parent_type = ($parent_call['cnttype'] == 1) ? ["thread",substr(hack_free($parent_call['content']),0,30),"index.php?" .$url_nu] : ["comment",substr($parent_call['content'],0,30),"index.php?comment=" . $actual['topic_hash']];

  $notif_add = ($no_notif == "no") ? false : mysqli_query($db_main, "INSERT INTO notifications(content,url,towhom) VALUES('<a href=\'index.php?profile=".$_MONITORED['login_q']."\'>".$_MONITORED['login_q']."</a> replied to your ".$parent_type[0].": ".$parent_type[1]."','$parent_type[2]','$parent_call[bywhom]')");    
  if(!$notif_add){$_SESSION['sql_error'] = mysqli_error($db_main);} 
  }
  mysqli_query($db_main,"INSERT INTO votes_q(bywhom,timeof,which_post,vote) VALUES('$_MICRORFID[login_q]',CURRENT_TIMESTAMP,'$actual[postid]',1)");
  if($actual['cnttype'] == "1"){
header("Location:index.php?thread_view=". $actual['thread_nick'] . "_" . $actual['topic_hash']);
  }
  
  if($actual['cnttype'] == "2"){
  $tree_roots = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$actual[thread_id]' ORDER BY stamptime DESC");
  $piece = mysqli_fetch_assoc($tree_roots);


 header("Location:index.php?thread_view=".$piece['thread_nick']."_".$piece['topic_hash']);
  mysqli_free_result($tree_roots);
  }
  
     mysqli_free_result($parent_clasp);
  mysqli_free_result($latest); 
  }
  unset($_SESSION['db_query']);

  }  
  }else{header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}       }
?>