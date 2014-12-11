var sync;

$("body").on("click",".index_post .votes a",function(event){ event.preventDefault();

//get data of poster with regards to this vote
$.get("template/simcheck.php",{"vote_action": $(this).attr("href") , "post_que":$(this).parent().parent().attr("alt")},function(data){
});

if($(this).next().hasClass("vote_selected") || $(this).prev().hasClass("vote_selected")){ //check if they've already voted on it

$(this).parent().find("a").toggleClass("vote_selected");//toggle both at the same time
}else{
$(this).toggleClass("vote_selected");
}

}).on("click",".poll_choices a.prompt",function(event){event.preventDefault();
 if($(this).parent().hasClass("is_radio")){
var $choice_ref = [$(this).parent().find("input.poll_choice:checked").attr('ref'),$(this).parent().find("input.poll_choice:checked").attr('value'),$(this).parent()];
//topic id where poll was posted, id of poll choice, and then the content where this will rightfully be appended into   ^^
$.get("template/simcheck.php",{"poll_vote": $choice_ref[1] , "post_que": $choice_ref[0] },function(data){
$choice_ref[2].html(data);
});
}
});
                          