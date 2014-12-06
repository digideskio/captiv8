$("body").on("click",".index_post .votes a",function(event){ event.preventDefault();

//get data of poster with regards to this vote
$.get("template/simcheck.php",{"vote_action": $(this).attr("href") , "post_que":$(this).parent().parent().attr("alt")},function(data){
});

if($(this).next().hasClass("vote_selected") || $(this).prev().hasClass("vote_selected")){ //check if they've already voted on it

$(this).parent().find("a").toggleClass("vote_selected");//toggle both at the same time
}else{
$(this).toggleClass("vote_selected");
}

});
