for(i = 0;i <= chat_sync.messages.length - 1;i++){
message = chat_sync.messages[i].content; 
user = chat_sync.messages[i].bywhom; 
postid = chat_sync.messages[i].postid;
time = chat_sync.messages[i].stamptime; 
j = i - 1;  

last_id = postid;
                                 
r_format = ((j < 0 && i == 0) || (i > 0 && chat_sync.messages[j].bywhom != user)) ? "<div>"+user+"</div><p num='"+postid+"' time_posted='"+time+"'>"+message+"</p>" : "<p num='"+postid+"' time_posted='"+time+"'>"+message+"</p>"; //check whether previous user was the same one so I won't have to spell the username for each reply
//count the very first message

messages_p = (typeof messages_p === "undefined") ? r_format : messages_p + r_format;   

}