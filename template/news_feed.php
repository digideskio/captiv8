<?php
if(index_page_check){
if(isset($_SESSION['salt_q']) && compare_dz($_SESSION['salt_q'],$logged_dt['password'])){     //personal news feed
echo "<div id='news_feed'>";
//data we need to get:
//the logged user's own posts, and every snowglobe he's subscribed to           

//first get the user's own posts, then find every access type with this user's id and access type for snowglobe_(#snowglobeid)
$zoom = "SELECT * FROM posts WHERE bywhom='$logged_dt[username]' AND cnttype=1";

//have to find an efficient way to load the most recent posts
//among other ways of assortment
//i'm gonna have to put it in a session
//clear it when the person followss new people
//that way it's only going to have to search once
$que_posts[6] = mysqli_query($db_main, "SELECT * FROM sg_permissions WHERE towhom='$_MONITORED[login_q]'");
if(!isset($_SESSION['content_pool'])){

    $xn = 0;
while($que_others_posts = mysqli_fetch_assoc($que_posts[6])){     $xn++;
//sort em'
$_SESSION['content_pool'][preg_replace("#[ :]+#","",$que_others_posts['access_type'])] = array($xn => $que_others_posts);
}
}
if(mysqli_num_rows($que_posts[6]) > 0){
for($i = 1;$i <= count($_SESSION['content_pool']);$i++){
foreach($_SESSION['content_pool']['friendsnowglobe'] as $friends_feed){
 $zoom .= " UNION SELECT * FROM posts WHERE bywhom='".$friends_feed['granted_by']."' AND cnttype=1";            //I have a feeling this is horribly inefficient
 } }
 }       
                                                

$que_posts[0] = mysqli_query($db_main, $zoom . " ORDER by stamptime DESC LIMIT 0,15");
while($que_own = mysqli_fetch_assoc($que_posts[0])){

//begin posts

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
}else{
$vote = (mysqli_num_rows($que_posts[2]) > 0) ? "no" : "none";  

}
                

}else{ //if there were no votes made in this topic(EXCLUDING the user's own, which would be yes when created
//I did this to save some bandwidth
$vote = "yes";



}
$que_posts[3] = mysqli_query($db_main, "SELECT * FROM polls where post_id_root='$que_own[postid]' ORDER by (CASE 'define_set' WHEN 'question' THEN 1 WHEN 'choice_selection' THEN 2 WHEN 'choice_addition' THEN 3 WHEN 'poll_choice' THEN 4 ELSE 25 END) DESC");      //check to see if it has a poll, also have the poll questions be last
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

//POLLS


echo "</td>";
if(mysqli_num_rows($que_posts[3]) > 0){echo "<td class='poll_choosy'>";  $z = 0; $poll_dt = [];         $poll_choice_zen = [];      $total = 0;
while($poll_extract = mysqli_fetch_assoc($que_posts[3])){
//check if current poll data query in-loop is a poll choice and if there are previous results that are poll choices, then merge the array
//but if not, just leave it be 
$poll_async = isset($poll_dt['poll_choice']) ? array_merge(array("pcid_" . $poll_extract['data_id'] => $poll_extract),$poll_async) : array("pcid_" . $poll_extract['data_id'] => $poll_extract);
$poll_dt[$poll_extract['define_set']] = ($poll_extract['define_set'] == "poll_choice") ? $poll_async : $poll_extract;
}

//1 is the question, 2 is the choice selection, 3 is the choice addition and everything after that are the poll questions
//looks like i'm gonna have to make another button for radios
$question = $poll_dt['question']['value'];
$selection_type = ($poll_dt['choice_selection']['value'] == "true") ? "radio" : "checkbox";
$addition_choice = $poll_dt['choice_addition']['value'];

echo "<h4>".$question."</h4>";

            echo "<span class='poll_choices is_".$selection_type."'>";
//check if userlogged has voted on any poll choice
$que_posts[4] = mysqli_query($db_main, "SELECT * FROM pollvotes_q WHERE which_poll='$que_own[postid]' AND bywhom='$_MONITORED[login_q]'");
if(mysqli_num_rows($que_posts[4]) > 0){
while($que_pollvotes = mysqli_fetch_assoc($que_posts[4])){    //get all poll votes
$this_voted_on[$que_pollvotes['choice_id']] = $que_pollvotes['choice_id'];
}

//add total poll votes
foreach($poll_dt['poll_choice'] as $totes){
$total = ($total == "0") ? $totes['votes'] : $totes['votes'] + $total;
} //display poll results
foreach($poll_dt['poll_choice'] as $poll_disp){
     $pct = ($poll_disp['votes']/$total)*100;
$set_ayy = isset($this_voted_on[$poll_disp['data_id']]) ? " vote_select" : "";
echo "<div class='optionbox results".$set_ayy."'>" . $poll_disp['value'] . " (".$pct."%)";
if(isset($this_voted_on[$poll_disp['data_id']])){echo "<span class='bywhom'>[You voted this.]</span>";}
echo"</div>";
}


$this_voted_on = [];

}else{    



foreach($poll_dt['poll_choice'] as $i => $j){    //i'll have to sort by most popular choices later, probably? On the one hand, they need to be as unbiased as possible

echo "<div class='optionbox'><input type='".$selection_type."' name='pc_".$poll_dt['poll_choice'][$i]['post_id_root']."' value='".$poll_dt['poll_choice'][$i]['data_id']."' ref='".$poll_dt['poll_choice'][$i]['post_id_root']."' class='poll_choice'><span>".$poll_dt['poll_choice'][$i]['value']."</span>

</div>";
}       

echo "<a href='vote' class='prompt button_samp rad'>VOTE!</a></span>";

echo "</td>";}       }

echo"<td width='1%' class='right_side'><span class='right side_info' alt='" .$que_own['postid'] . "'><a href='index.php?thread_view=".$que_own['thread_nick']."_".$que_own['topic_hash']."' class='topic_link'>".time_rounds($que_own['stamptime'])."</a><span class='score'> (".$score."%)</span>";
echo"<span class='votes'><a href='up' class='vote_" .$select_class[0] . "'><img src='template/img/up.png'></a><a href='down' class='vote_" .$select_class[1] . "'><img src='template/img/down.png'></a></span></span></td></tr></table></div>";
};       

for($i = count($que_posts)-1;$i >= 0;$i--){
if(isset($que_posts[$i])){
mysqli_free_result($que_posts[$i]);        }
}
clear_array($poll_dt);



 echo "</div>";
}



}
?>