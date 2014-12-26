<?php
//time to start with polls
//first create the polls DB
//save it for later reference

//i'm also gonna have to make a user's personal posts along with this
//so personal user snowglobe posts will be cnttype = 1

// mysqli_query($db_main, "CREATE TABLE polls(post_id_root INT NOT NULL,question varchar(100), num_values INT NOT NULL, a1 varchar(100), a2 varchar(100), a3 varchar(100), a4 varchar(100), a5 varchar(100), a6 varchar(100), a7 varchar(100), a8 varchar(100), a9 varchar(100), a10 varchar(100), a11 varchar(100), a12 varchar(100), a13 varchar(100), a14 varchar(100), a15 varchar(100), a16 varchar(100), a17 varchar(100), a18 varchar(100), a19 varchar(100), a20 varchar(100))");
//this is the index template

if(logged_in_check && index_page_check){   //make a new post panel(for threads)
 echo "<div id='content' class='contentbox'>".$nx['31']."</div>";
echo "<form method='POST' action='index.php?direct=new_post&verify=". $_SESSION['temp_n'] ."' id='post_k'>
<span id='input_save'></span>
<div class='extra_opts'><a href='add-poll' class='prompt' id='attach_poll_q'>".$nx[30]."</a></div><div id='main_new_post' class='contentbox'>"; 
echo "<div class='sect_1'><input type='text' maxlength='150' value='".$nx['17']."' class='flick largeform' name='tcha1' id='title_trigger'>
<textarea name='tcha2' class='flick largeform'>".$nx['18']."</textarea></div>";  
//post as: formats


//title and content
echo "<div class='sect_2 button_row'>
<span class='drop user_opts'><div class='uplink rad'>".$nx['19']."</div><div class='dropdown_content' id='snowglobe_opts'>

<div class='spacer rad'>
";

//check for all snowglobes they can make a thread in, of course being able to post in your own profile snowglobe is always your right, and it'll be called "1"
echo "<input type='checkbox' checked='checked' name='sg_1' snowglobe='".$nx['20']."'></div></div></span>";
//as for the rest...
$passes = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE towhom='$_MONITORED[login_q]'");
$stack = mysqli_fetch_assoc($passes);

mysqli_free_result($passes);

echo "

<input type='submit' value='".$nx['21']."'></div>";
echo "</div></form>";  }

  if(isset($_SESSION['login_q'])){

  echo mysqli_error($db_main);
  }  


if(isset($_GET['thread_view'])){
//viewing threads
//it'll be a combination of the topic's hash and it's thread nickname
//should help with search engines
//ergo

if($view_thread && ($thread_data['cnttype'] == "1")){     
                             

echo "<div class='contentbox' id='thread_main'><h3>".$thread_data['title']." <small>by <a href='index.php?profile=".$thread_data['bywhom']."'>".$thread_data['bywhom']."</a> at <span class='white'>". date(dflt_date_f, strtotime($thread_data['stamptime']))."</span></small></h3>";      //".$thread_data['']."
if(strlen($thread_data['content']) > 3){echo "<p>".$thread_data['content']."</p>";  }
echo "</div>";
//reply-action to thread
if(isset($_SESSION['login_q'])){
echo "<div id='thread_reply' class='contentbox'><form action='index.php?direct=new_post&verify=".hack_free($_SESSION['temp_n'])."' method='POST'>
<input type='hidden' value='". $thread_data['postid'] ."' name='parent_comment'>
<input type='hidden' value='".$thread_id."' name='thread_id'>
<textarea name='tcha2' class='flick largeform'>Comment on this thread...</textarea>   <input type='submit' value='POST REPLY'>
</form></div>";  }      //get main threads only
$snipe8 = mysqli_query($db_main, "SELECT *
FROM posts
WHERE parent = '$thread_data[postid]'
ORDER BY stamptime DESC
LIMIT 0,100");
$queue = mysqli_num_rows($snipe8); 
if($queue == "0"){
echo "<div class='contentbox notice_msg'>There are no replies in this topic yet.</div>";
}else{
 
if(!isset($_GET['comment'])){while($comment_loop = mysqli_fetch_assoc($snipe8)){$sync_25 = mysqli_query($db_main, "SELECT * FROM posts WHERE parent='$comment_loop[parent]' AND thread_id='$thread_data[postid]' ORDER BY stamptime DESC LIMIT 0,25");

echo "<div class='contentbox comment_box arch_1'><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$comment_loop['bywhom']."'>".$comment_loop['bywhom']."</a></h4></td><td><p class='post_text'>".$comment_loop['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$comment_loop['topic_hash'] ."'>". date(dflt_date_f, strtotime($comment_loop['stamptime'])) ."</a></span>
</p>";                                                                                                              
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$comment_loop['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' name='post_".$comment_loop['postid']."' id='post_".$comment_loop['postid']."'>Reply</a><a href='#' class='comment_opts rad edit' id='edit_".$comment_loop['postid']."'>Edit</a>";echo "</div>";}
echo"</td></tr></table>";    echo "</div>";
//second and third and fourth level of comments and so on



if(mysqli_num_rows($sync_25) > 0){//function get_posts($pid_call,$tid_call = "1",$limit = "25",$chain = "5")
get_posts($comment_loop['postid'],$thread_data['postid']);

}
 
}

    
    }else{  
     while($comment_loop = mysqli_fetch_assoc($specific)){     $sync_25 = mysqli_query($db_main, "SELECT * FROM posts WHERE parent='$comment_loop[parent]' AND thread_id='$thread_data[postid]' ORDER BY stamptime DESC LIMIT 0,25");
     
     if($comment_loop['parent'] == $thread_id){
          echo "<div class='contentbox comment_box arch_1 selected'><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$comment_loop['bywhom']."'>".$comment_loop['bywhom']."</a></h4></td><td><p class='post_text'>".$comment_loop['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$comment_loop['topic_hash'] ."'>". date(dflt_date_f, strtotime($comment_loop['stamptime'])) ."</a></span>
</p>";
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$comment_loop['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' name='post_".$comment_loop['postid']."' id='post_".$comment_loop['postid']."'>Reply</a><a href='#' id='edit_".$comment_loop['postid']."' class='comment_opts rad edit' name='edit_".$comment_loop['postid']."' >Edit</a>";echo "</div>";}
echo "</td></tr></table>";
//second and third and fourth level of comments and so on

echo "</div>";      //this is soooooo tacky

if(mysqli_num_rows($sync_25) > 0){//function get_posts($pid_call,$tid_call = "1",$limit = "25",$chain = "5")
get_posts($comment_loop['postid'],$thread_data['postid']);

}
 mysqli_free_result($sync_25);
}else{
//the devil
//wow I got this done so much more quickly
//I feel like celebrating   
function show_parents($queue,$parent,$parent_comments = "5"){ global $db_main,$thread_data,$nay;

//the logic is, you will always need the margin unless it's the top ancestor generation     

$show_1 = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$parent' AND thread_id='$thread_data[postid]'");
$tell_1 = (mysqli_num_rows($show_1) > 0) ? mysqli_fetch_assoc($show_1) : "dead";
if($tell_1 !== "dead" && $_SESSION['count'] > 0){  $_SESSION['count'] = $_SESSION['count'] - 1; $_SESSION['incr'] = $_SESSION['incr'] + 1; //remember, it has to be limited to 5 ancestor generations
$show_2 = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$tell_1[parent]' AND thread_id='$thread_data[postid]'");
$tell_2 = (mysqli_num_rows($show_2) > 0) ? mysqli_fetch_assoc($show_2) : "dead";
if($tell_2 !== "dead" && $_SESSION['count'] > 0){  $_SESSION['count'] = $_SESSION['count'] - 1;  $_SESSION['incr'] = $_SESSION['incr'] + 1; 
if($tell_2['parent'] !== $thread_data['postid']){
show_parents($tell_2['postid'],$tell_2['parent'],$_SESSION['count'] - 1);  
} echo "<div class='contentbox comment_box'><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$tell_2['bywhom']."'>".$tell_2['bywhom']."</a></h4></td><td><p class='post_text'>".$tell_2['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$tell_2['topic_hash'] ."'>". date(dflt_date_f, strtotime($tell_2['stamptime'])) ."</a></span>
</p>";
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$tell_2['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' id='post_".$tell_2['postid']."' name='post_".$tell_2['postid']."'>Reply</a><a href='#' class='comment_opts rad edit' id='edit_".$tell_2['postid']."'>Edit</a>";echo "</div>";}
echo "</td></tr></table></div>"; }   

echo "<div class='contentbox comment_box' alt=''><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$tell_1['bywhom']."'>".$tell_1['bywhom']."</a></h4></td><td><p class='post_text'>".$tell_1['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$tell_1['topic_hash'] ."'>". date(dflt_date_f, strtotime($tell_1['stamptime'])) ."</a></span>
</p>";     
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$tell_1['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' id='post_".$tell_1['postid']."' name='post_".$tell_1['postid']."'>Reply</a><a href='#' class='comment_opts rad edit' id='edit_".$tell_1['postid']."'>Edit</a>";echo "</div>";}
echo "</td></tr></table></div>";     
mysqli_free_result($show_2);
}
mysqli_free_result($show_1);
 //end show_parents();

}
$_SESSION['count'] = "5";   $_SESSION['incr'] = "0";
show_parents($comment_loop['postid'],$comment_loop['parent'],$_SESSION['count']);
 echo "<div class='margin'><div class='contentbox comment_box arch_1 selected'><table><tr>
<td class='user_info'><h4><a href='index.php?profile=".$comment_loop['bywhom']."'>".$comment_loop['bywhom']."</a></h4></td><td><p class='post_text'>".$comment_loop['content']."
<span class='side_info'>- Posted <a href='?thread_view=".$_GET['thread_view']."&comment=".$comment_loop['topic_hash'] ."'>". date(dflt_date_f, strtotime($comment_loop['stamptime'])) ."</a></span>
</p>";
if(isset($_SESSION['login_q'])){echo "<div class='opts_block' alt='".$comment_loop['postid']."'>";echo "<a href='#' class='comment_opts rad comment_q-u' id='post_".$comment_loop['postid']."' name='post_".$comment_loop['postid']."'>Reply</a><a href='#' class='comment_opts rad edit' id='edit_".$comment_loop['postid']."'>Edit</a name='post_".$comment_loop['postid']."'>";echo "</div>";}
echo "</td></tr></table>";
//second and third and fourth level of comments and so on

echo "</div></div>";      //this is soooooo tacky
echo "<div class='margin'>";
get_posts($comment_loop['postid'],$thread_data['postid']);        echo "</div>";
}

}
    mysqli_free_result($specific);
    
    }

   
}

mysqli_free_result($snipe8);
mysqli_free_result($view_thread); }else{header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}
}else{
if(isset($_GET['comment'])){
$search_for_thread = mysqli_query($db_main, "SELECT * FROM posts WHERE topic_hash='$_FILTERED[comment]' ORDER BY stamptime DESC");
if(mysqli_num_rows($search_for_thread) > 0){
$post_data = mysqli_fetch_assoc($search_for_thread);                    
$thread_query = mysqli_query($db_main, "SELECT * FROM posts WHERE postid='$post_data[thread_id]'");
$thread_dt = mysqli_fetch_assoc($thread_query);
header("Location:index.php?thread_view=" . $thread_dt['thread_nick'] . "_" . $thread_dt['topic_hash'] . "&comment=" . $_GET['comment']);
}else{header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}
}
}


if(isset($_GET['profile'])){    //viewing a profile
if($profile_query){
echo "<div class='contentbox profile_main'><table><tr class='row_1'><td class='side_1' width='99%'><h3>".$nx[14].": 
<span class='nix1'>". $matched['username'] ."</span></h3>";
if(isset($_SESSION['login_q'])){
echo " <span id='check_friend_status' class='flick side_links' ref1='".$_MONITORED['login_q']."' ref2='".$matched['username']."'>Loading friendship status...</span>";
}                                                                    

echo"</td><td class='side_2' width='1%' style='min-width:200px;'>Last active ".time_rounds($matched['last_active_at'])."</td></tr>";  //row 1

echo "<tr class='row_2'><td class='side_1' width='99%'><div class='auto_filler'>";
echo "<h3 class='content_q'> ".$matched['username']."'s posts </h3>";
$query_2 = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom='$matched[username]' ORDER BY stamptime DESC LIMIT 0,36");
if(mysqli_num_rows($query_2) < 1){
echo "<h3 class='notice2'>". $nx['22'] ."</h3>";
}else{  //has posts
while($post_loop = mysqli_fetch_assoc($query_2)){
if($post_loop['cnttype'] == "1"){         //threads
$post_type ="thread";
$snipe7 = mysqli_query($db_main, "SELECT * FROM posts WHERE parent = '$post_loop[postid]' OR thread_id='$post_loop[postid]'");
if(mysqli_num_rows($snipe7) == 1){    
$msg_format = mysqli_num_rows($snipe7) . " REPLY TO THIS THREAD";   }
if(mysqli_num_rows($snipe7) == 0){
$msg_format =  "NO REPLIES";   }
if(mysqli_num_rows($snipe7) > 1){
$msg_format =  mysqli_num_rows($snipe7) . " REPLIES TO THIS THREAD";   }  

echo "<div class='posts_t1 ".$post_type."_post'><h4>
<a href='index.php?thread_view=".$post_loop['thread_nick']."_".$post_loop['topic_hash']."'>".$post_loop['title']."</a> 
<span>- Posted ".date(dflt_date_f, strtotime($post_loop['stamptime']))."</span>
<span class='reply_notch rad'>".$msg_format."</span></h4><p>".$post_loop['content']."</p></div>";          //".$post_loop['']."

}
if($post_loop['cnttype'] == "2"){  $post_type = "comment";
$snipe8 = mysqli_query($db_main, "SELECT * FROM posts WHERE postid = '$post_loop[parent]'");
$snipe9 = mysqli_fetch_assoc($snipe8);    //find parent of comment
$snipe10 = mysqli_query($db_main, "SELECT * FROM posts WHERE postid = '$snipe9[parent]'");
$snipe11 = mysqli_fetch_assoc($snipe10);   //find parent of parent comment   
$snipe12 = mysqli_query($db_main, "SELECT * FROM posts WHERE postid = '$post_loop[thread_id]'");
$snipe13 = mysqli_fetch_assoc($snipe12);   //find original thread     


//first, find the comment ancestor's post info
//check to see if its parent is the thread

$post_tree_msg = ($snipe9['parent'] !== $post_loop['thread_id']) ? array("to thread",$snipe13['topic_hash'],$snipe13['thread_nick'],$snipe13['title']) : array("in a comment under",$snipe13['topic_hash'],$snipe13['thread_nick'],$snipe13['title']);         //check if parent of current comment is thread id

//I really need to be more logistical about this

echo "<div class='posts_t1 ".$post_type."_post'><h4>Replying ".$post_tree_msg[0]." 
<a href='index.php?thread_view=".$post_tree_msg[2]."_".$post_tree_msg[1]."&comment=".$post_loop['topic_hash']."'>".$post_tree_msg[3]."</a> 
<span>...Posted ".date(dflt_date_f, strtotime($post_loop['stamptime']))."</span></h4><p>".$post_loop['content']."</p></div>";         

mysqli_free_result($snipe8);   mysqli_free_result($snipe10);   mysqli_free_result($snipe12);
}

}


}         //<dt></dt><dd></dd>
echo "</div></td>";                                                        
echo "<td class='side_info'>  <div class='spacer'>



".$nx[16]. date(dflt_date_f, strtotime($matched['joindate'])) . " 
<h3>Personal Information</h3>
              <blockquote>
<dt>Full Name</dt><dd>".$matched['fullname']."</dd>
</blockquote>

<h3>Q & A</h3>";

echo" 
</div>
</td></tr>";

echo "</table></div>";

mysqli_free_result($query_2);
if(isset($snipe_7)){mysqli_free_result($snipe7);    }

}else{header("Location:index.php"); $_SESSION['error' .rand(56,1515)] = extraurl();}
mysqli_free_result($profile_query);
}

//show posts from others in the news feed
?>