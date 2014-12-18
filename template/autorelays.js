//load notifications, online status, etc
//hmmm



setInterval(function(){
$.ajax({
url: "template/simcheck.php",
data: {"nm_time":"notifs"},
success: function(data){  
if(data.result == "new"){
if($("#notifs_bar .spacer a").next().is(":not('.note')")){
$("#notifs_bar .spacer a").after(" <span class='note'>("+data.notifs.length+" new)</span>");  } 
$.each(data.notifs,function(i,v){ 
if($(".harrr").length != data.notifs.length){ 
$("#notifications .spacer").prepend("<span alt='"+ data.notifs[i]['url'] +"' class='harrr'>"+data.notifs[i]['content']+"</span>");
//$("<a href='"+ data.notifs[i]['url'] +"'><div class='notifs'>Some arbitrary content "+data.notifs[i]['content']+"</div></a>").prependTo("#notifications .spacer");
}
});


    
$zin = $("#notifications .spacer").html();
if($("#clear").length == 0){
$("#notifications .spacer").html( $zin + "<a href='clear' class='prompt' id='clear'>Clear all notifications</a>");      
}  

                
}else{} 
},dataType: "json"        
});
  $('.harrr').each(function(){
$zen = $(this).attr('alt');    
if($(this).parent().is(":not('.notifs')")){
$(this).wrap("<a href='"+ $zen +"'><div class='notifs'></div></a>");    //that was painful
     }
});

},2500);
          
            