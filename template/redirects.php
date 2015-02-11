<?php   if(isset($_GET['phase'])){
if(isset($_SESSION['db_query'])){  //$_COOKIE['limbooo'] was being buggy, or there was something I wasnt doring right
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
  

  redir_process("Location:index.php?phase=2");
  } }
  
  }
  if($_GET['phase'] == "2"){   //inquire for successful data entry messages  
  if(isset($_COOKIE['limbooo'][1])){ 
  setcookie("glimpse","yuo",time()+4);
  } 
  if(isset($_GET['db_query'])){switch($_GET['db_query']){
  case "new_snowglobe":
  header("Location:" . $main_dir."profile_nuise/". $_MONITORED['login_q'] ."/find/snowglobes/");
  break;
  }    }
  if(!isset($_SESSION['login_q'])){setcookie('incorrect_password_notice','incorrect',time()+1);}
  clear_array($_SESSION,"free_sess_");
  
  if($_SESSION['db_query'] == "posted content-anything"){
  $latest = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom = '".$_MONITORED['login_q']."' ORDER BY stamptime DESC") or die(mysqli_error($db_main));
  $actual = mysqli_fetch_assoc($latest);
  
  $clasp_tip = ($actual['parent'] !== 0) ? $actual['parent'] : $actual['postid'];   //check to see if it's a thread to refer for a notification
  
  $parent_clasp = mysqli_query($db_main, "SELECT * FROM posts WHERE postid=$clasp_tip ORDER BY stamptime DESC") or die(mysqli_error($db_main)); $_SESSION['abc'] = mysqli_num_rows($parent_clasp); 
   $parent_call = mysqli_fetch_assoc($parent_clasp);
  if(mysqli_num_rows($parent_clasp) > 0 && (($parent_call['bywhom'] != $_MONITORED['login_q']) || ($parent_call["bywhom"] == $_MONITORED['login_q'] && $parent_call["forwhom"] != "self"))){       echo "in! (1)<br>";
  //this is so messy.
  //make sure you don't get replies in comments to your own replies or your own snowglobe
  
  
  
  $parent_check = ($actual['bywhom'] == $parent_call['bywhom']) ? "no" : "yes";
  $no_notif = ($actual['cnttype'] == 2) ? $parent_check : "yes";
  //check if it's either a reply to a comment, or not a thread to your own snowglobe, or a reply to your own thread/comment post, so that it wouldn't be a redundant notification               
  //i'm getting the most recent comment with $parent_call ... I mean its parent post
  //dang it I have to learn how to do comments better
  $url_nu = ($actual['cnttype'] == "1") ? "thread/" . $actual['thread_nick'] . "_" . $actual['topic_hash'] : "comment/" . $actual['topic_hash'];      
  $parent_type = ($parent_call['cnttype'] == 1) ? ["thread",substr(hack_free($parent_call['title']),0,30),"" .$url_nu] : ["comment",substr($parent_call['content'],0,30),"comment/" . $actual['topic_hash']];

  $notif_add = ($no_notif == "no") ? false : mysqli_query($db_main, "INSERT INTO notifications(content,url,towhom) VALUES('<span>".$_MONITORED['login_q']."</span> replied to your ".$parent_type[0].": ".$parent_type[1]."','$parent_type[2]','$parent_call[bywhom]')");    
  if(!$notif_add){$_SESSION['sql_error'] = mysqli_error($db_main);} 
  }
  mysqli_query($db_main,"INSERT INTO votes_q(bywhom,timeof,which_post,vote) VALUES('$_MICRORFID[login_q]',CURRENT_TIMESTAMP,'$actual[postid]',1)");
  if($actual['cnttype'] == "1"){  $url = "Location:thread/". $actual['thread_nick'] . "_" . $actual['topic_hash'];  mysqli_free_result($parent_clasp);
  mysqli_free_result($latest);   echo "in! (2)<br>";
redir_process($url);
  }
  
  if($actual['cnttype'] == "2"){         
   $url ="Location:index.php?comment=".$actual['topic_hash'];
    mysqli_free_result($parent_clasp);
  mysqli_free_result($latest); 

      mysqli_free_result($tree_roots);      echo "in! (2)<br>";
 redir_process($url);

  }
     echo $url;
  }
  unset($_SESSION['db_query']);

  }  
  }else{$_SESSION['error' .rand(56,1515)] = extraurl() . " - failed cookie"; redir_process("Location:index.php"); }       }
?>