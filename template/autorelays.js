//load notifications, online status, etc
//hmmm


setTimeout(function(){

setInterval(function(){


$.get("<?php echo $main_dir; ?>template/simcheck.php",{"action":"chat_with_user","format":"sync_in"},function(asyncd){ //$("#left1").prepend("1");
if(asyncd.new_messages > 0){   // $("#left1").prepend("2");
for(i = 0;i <= asyncd.senders.length-1;i++){   //check to see if respective chat box is not opened and if there's less than 5 senders
//actually for the latter conditional I will set up the deletion in previous 
if($(".chat-b[ref='"+asyncd.senders[i]+"']").length == 0){ // $("#left1").prepend(asyncd.senders[i]);
load_replies(asyncd.senders[i]);
//$("#left1").prepend("3");
}
}}  },"json");


if($(".chat-b").length <= 5 && $(".chat-b").length > 0){   //because potential DDoS attacks...? Then again, they can always have multiple windows, so I have to regulate for that too 

$(".chat-b").each(function(){ other_user = $(this).attr("ref");
$.ajax({url:"<?php echo $main_dir; ?>template/simcheck.php",data:{"action":"chat_with_user","user":other_user,"is_read":"true"},success:function(msg_sync){

delete messages_p;

num = msg_sync.messages.length - 1;

x = msg_sync.messages[num].postid; y = $(".chat-b[ref='"+other_user+"'] .spacer .chat_box p:last").attr("num");
      
if(typeof msg_sync.messages === "object" && x > y){
  
//check to see that there's actually a conversation between the two, and the newest message is later than the most recent post

for(i = 0;i <= msg_sync.messages.length - 1;i++){ 
message = msg_sync.messages[i].content; 
user = msg_sync.messages[i].bywhom; 
postid = msg_sync.messages[i].postid;
j = i -1;  
                                 
r_format = ((j < 0 && i == 0) || (i > 0 && msg_sync.messages[j].bywhom != user)) ? "<div>"+user+"</div><p num='"+postid+"'>"+message+"</p>" : "<p num='"+postid+"'>"+message+"</p>"; //check whether previous user was the same one so I won't have to spell the username for each reply
//count the very first message

messages_p = (typeof messages_p === "undefined") ? r_format : messages_p + r_format;   

}       
 place = [$(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollHeight"),($(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollTop") < 150) ? $(".chat-b[ref='"+other_user+"'] .spacer .chat_box").prop("scrollTop") : 203422];    
 
                                                  
$(".chat-b[ref='"+other_user+"'] .spacer .chat_box").html(messages_p).scrollTop(place[1]);


                                                                                        
}},dataType: "json"});

});
  
}




//saved users on chat


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


},2500);          }  ,5000 );
          
            