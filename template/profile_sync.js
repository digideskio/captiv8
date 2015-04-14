$.get("<?php echo $main_dir; ?>template/simcheck.php",{"friend_status[]":[$("#check_friend_status").attr("ref1"),$("#check_friend_status").attr("ref2")]},function(append){
$("#check_friend_status").html(append); 
});                         
