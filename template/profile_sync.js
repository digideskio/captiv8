$.get("template/simcheck.php",{"friend_status[]":[$("#check_friend_status").attr("ref1"),$("#check_friend_status").attr("ref2")]}).done(function(data){
$("#check_friend_status").html(data);
});