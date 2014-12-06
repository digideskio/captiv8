<?php
if(index_page_check){
if(isset($_SESSION['salt_q']) && compare_dz($_SESSION['salt_q'],$logged_dt['password'])){     //personal news feed
echo "<div id='news_feed'>";
//data we need to get:
//the logged user's own posts, and every snowglobe he's subscribed to           

//first get the user's own posts, then find every access type with this user's id and access type for snowglobe_(#snowglobeid)
$que_posts[0] = mysqli_query($db_main, "SELECT * FROM posts WHERE bywhom='$logged_dt[username]' AND cnttype=1 ORDER by stamptime DESC LIMIT 0,15");
while($que_own = mysqli_fetch_assoc($que_posts[0])){
$score = round(($que_own['upvotes'] / ($que_own['upvotes'] + $que_own['downvotes'])),2) *100;
$que_posts[1] = mysqli_query($db_main, "SELECT * FROM votes_q WHERE which_post='$que_own[postid]'");
if(mysqli_num_rows($que_posts[1]) > 0){ //it's too easy to get lost in your train of thought
//practice comments, idiot

//find vote made by this user in this topic
$que_posts[2] = mysqli_query($db_main, "SELECT * FROM votes_q WHERE which_post='$que_own[postid]' AND bywhom='$_MONITORED[login_q]'");
//then reference it to a variable
$que_vote =  mysqli_fetch_assoc($que_posts[2]);
if($que_vote['vote'] > 0){
$vote = "yes";
}else{$vote = "no";}
                

}else{ //if there were no votes made in this topic(EXCLUDING the user's own, which would be yes when created
//I did this to save some bandwidth
$vote = "yes";



}
$select_class[0] = ($vote == "yes" && isset($que_posts[2]) > 0) ? "selected" : "";
$select_class[1] = ($vote == "no" && isset($que_posts[2]) > 0) ? "selected" : ""; 
$content_blur = preg_match("#^[ ]+$#",$que_own['content']) ? "" : "<p>".$que_own['content'] ."<span class='bywhom'> (Posted in your own snowglobe)</span></p>";
echo "<div class='contentbox index_post' alt='".$que_own['postid']."'><table><tr><td width='1%' class='left_side'><strong><a href='index.php?profile=".$que_own['bywhom'] ."'>".$que_own['bywhom'] ."</a></strong></td><td>";
$title_code_patt = "#^[\050](One-liner)[\051]([ ]{0,5})[\133](.+)[\135]#";
if(preg_match($title_code_patt,$que_own['title'])){
preg_match($title_code_patt,$que_own['title'],$matches);
if($matches[1] == "One-liner"){
echo "<strong>". $matches[3] ." <a class='prompt' href='toggle'>(Click here...)</a></strong>";


echo"<span class='spoiler'>".$content_blur."</span>";
}
}else{echo "<strong>" .$que_own['title'] . "</strong>".$content_blur .""; }



echo "</td><td width='1%' class='right_side'><span class='right side_info' alt='" .$que_own['postid'] . "'><a href='index.php?thread_view=".$que_own['thread_nick']."_".$que_own['topic_hash']."' class='topic_link'>".time_rounds($que_own['stamptime'])."</a><span class='score'> (".$score."%)</span>";
echo"<span class='votes'><a href='up' class='vote_" .$select_class[0] . "'><img src='template/img/up.png'></a><a href='down' class='vote_" .$select_class[1] . "'><img src='template/img/down.png'></a></span></span></td></tr></table></div>";
};       

for($i = count($que_posts)-1;$i >= 0;$i--){
mysqli_free_result($que_posts[$i]);
}



 echo "</div>";
}



}
?>