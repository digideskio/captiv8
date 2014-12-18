//load notifications, online status, etc

setInterval(function(){
$.ajax({
url: "template/simcheck.php",
data: {"nm_time":"notifs"},
success: function(data){  
if(data.result == "new"){
if($("#notifs_bar .spacer a").next().is(":not('.note')")){
$("#notifs_bar .spacer a").after(" <span class='note'>("+data.notifs.length+" new)</span>");  } 
$.each(data.notifs,function(i,v){ 
if($("#notifications .notifs").length != data.notifs.length){ 
$("#notifications .spacer").prepend("<div class='notifs'>"+data.notifs[i]['content']+"</div>");
$("#notifications .spacer .notifs:first-child").wrapInner("<a href='"+ data.notifs[i]['url'] +"'></a>");
}
});    
$zin = $("#notifications .spacer").html();
if($("#clear").length == 0){
$("#notifications .spacer").html( $zin + "<a href='clear' class='prompt' id='clear'>Clear all notifications</a>");      
}                  
}else{} 
},dataType: "json"        
});
},2500);