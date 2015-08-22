//load notifications, online status, etc
//hmmm

setInterval(function(){


$.ajax({
    url: "<?php echo $main_dir; ?>template/simcheck.php",
    data: {"action":"sync_all"},
    async: false,
    success: function(sync){
        sync_in = sync;        
    },
    dataType: "json"
});


                   
if(sync_in.chat > 0 || $(".chat-b[preloaded]").length > 0){

$.get("<?php echo $main_dir; ?>template/simcheck.php",{"action":"chat_with_user","format":"sync_in"},function(asyncd){  
if(asyncd.new_messages > 0){   //get users who most recently sent currently logged in user a message
for(i = 0;i <= asyncd.senders.length-1;i++){   //check to see if respective chat box is not opened and if there's less than 5 senders
//actually for the latter conditional I will set up the deletion in previous 
if($(".chat-b[ref='"+asyncd.senders[i]+"']").length == 0){ // $("#left1").prepend(asyncd.senders[i]);
load_replies(asyncd.senders[i]);  //this is where a chat box would be loaded if a new message is sent from the other user but this current user doesn't have it opened
//$("#left1").prepend("3");
}
}}  },"json");


if($(".chat-b").length <= 5 && $(".chat-b").length > 0){

$(".chat-b").each(function(){ other_user = $(this).attr("ref");
$.ajax({url:"<?php echo $main_dir; ?>template/simcheck.php",data:{"action":"chat_with_user","user":other_user,"is_read":"true"},success:function(chat_sync){

delete messages_p;  //old message array needs to be removed



num = chat_sync.messages.length - 1; 

x = chat_sync.messages[num].postid;   //get the postid of the very last post in a chat comment chain

 y = (typeof $(".chat-b[ref='"+other_user+"'] .spacer .chat_box p:last").attr("num") !== "string") ? 0 : $(".chat-b[ref='"+other_user+"'] .spacer .chat_box p:last").attr("num"); //just a quick fix for those pre-loaded chat boxes


      
if(typeof chat_sync.messages === "object" && x > y){ //inserting the chat box in      
//check to see if there's a new post by checking if the most recent post ID is larger than the smaller one    

//check to see that there's actually a conversation between the two, and the newest message is later than the most recent post
<?php include("template/post_list.js") ?>
     
 place = [$(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollHeight"),($(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollTop") < 150) ? $(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollTop") : 203422];    
 
 place[1] = (y == 0) ? 2934923 : place[1];  //so the pre-loaded chat boxes would automatically scroll to the bottom
 
                                                  
$(".chat-b[ref='"+other_user+"'] .spacer .chat_box").html(messages_p).scrollTop(place[1]);


                                                                                        
}},dataType: "json"});
$(this).removeAttr("preloaded");
});
  
  
}     }






//saved users on chat


if(sync_in.notifs > 0){


$.ajax({   //notification relay
url: "<?php echo $main_dir; ?>template/simcheck.php",
data: {"nm_time":"notifs"},
success: function(data){        $("#notifications").html();

                                 

if(data.result == "new"){    //new as in there are notifications, what counts is if it's read

if($("#notifs_bar .spacer a").next().is(":not('.note')")){

if(data.unread >= 1){$("#notifs_bar .spacer a").after("<span class='note'>("+data.unread+" new)</span>");  
$("title").prepend("("+data.unread+") ");
$("#notifications .spacer").empty();
}}
 

                                    i = 0;
$.each(data.notifs,function(i,v){

i++;
j = data.notifs.length - i;      //reverse it
//because there's no negative incremental index looping for .each()

if($(".notifs").length != data.notifs.length){ 
$("#notifications .spacer").prepend("<div alt='"+ data.notifs[j]['url'] +"' class='notifs unchecked'>"+data.notifs[j]['content']+"<br><em>"+data.notifs[j]['stamptime']+"</em></div>");
//$("<a href='"+ data.notifs[i]['url'] +"'><div class='notifs'>Some arbitrary content "+data.notifs[i]['content']+"</div></a>").prependTo("#notifications .spacer");
}
});


    
$zin = $("#notifications .spacer").html();

                
}

  $('.notifs').each(function(){
$zen = $(this).attr('alt');    
if($(this).parent().is(":not('a')")){
$(this).wrap("<a href='"+ $zen +"' />");    //that was painful
}
});

},dataType: "json"        
});

                }
},2500);     