//load notifications, online status, etc
//hmmm


setTimeout(function(){

setInterval(function(){


$.ajax({
url: "template/simcheck.php",
data: {"nm_time":"notifs"},
success: function(data){        $("#notifications").html();

                                 

if(data.result == "new"){
if($("#notifs_bar .spacer a").next().is(":not('.note')")){

if(data.unread < 1){

}else{$("#notifs_bar .spacer a").after(" <span class='note'>("+data.unread+" new)</span>");  }}
 

                                    i = 0;
$.each(data.notifs,function(i,v){

i++;
j = data.notifs.length - i;      //reverse it
//because there's no negative incremental index looping for .each()

if($(".notifs").length != data.notifs.length){ 
$("#notifications .spacer").prepend("<div alt='"+ data.notifs[j]['url'] +"' class='notifs'>"+data.notifs[j]['content']+"<br><em>"+data.notifs[j]['stamptime']+"</em></div>");
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


},2500);          }  ,5000 );
          
            