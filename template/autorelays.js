//load notifications, online status, etc
//hmmm



setInterval(function(){


$.ajax({
url: "template/simcheck.php",
data: {"nm_time":"notifs"},
success: function(data){  



if(data.result == "new"){
if($("#notifs_bar .spacer a").next().is(":not('.note')")){

if(data.unread < 1){

}else{$("#notifs_bar .spacer a").after(" <span class='note'>("+data.unread+" new)</span>");  }}



$.each(data.notifs,function(i,v){ 
if($(".notifs").length != data.notifs.length){ 
$("#notifications .spacer").prepend("<div alt='"+ data.notifs[i]['url'] +"' class='notifs'>"+data.notifs[i]['content']+"</div>");
//$("<a href='"+ data.notifs[i]['url'] +"'><div class='notifs'>Some arbitrary content "+data.notifs[i]['content']+"</div></a>").prependTo("#notifications .spacer");
}
});


    
$zin = $("#notifications .spacer").html();

                
}else{} 

  $('.notifs').each(function(){
$zen = $(this).attr('alt');    
if($(this).parent().is(":not('a')")){
$(this).wrap("<a href='"+ $zen +"' />");    //that was painful
}
});

},dataType: "json"        
});


},2500);
          
            