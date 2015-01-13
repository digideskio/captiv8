  <script src="template/jquery-.js" type="text/javascript"></script>

<script src="template/jquery-ui.js" type="text/javascript"></script>

 <script>(function ( $ ) {   
    //this is soooo tacky      


$.fn.loadingtext = function(text = "LOADING",dot_nums = 3){
  

//this.html("LOADING");

var agent = this;
return this.each(function(){
 $this = $(this);
dots($this);

});  
function dots($this){       x = 0;    dots = "";
setInterval(function(){      for(i = 0;i <=x; i++){
dots = (x > 3) ? "." : "." + dots;  
};    if(dots.length > dot_nums){dots = "";}
$this.html(text + dots);
},200);
} 

} 
 $.ltrim = function( str ) {
return str.replace( /^\s+/, "" );
};
$.rtrim = function( str ) {
return str.replace( /\s+$/, "" );
};
}( jQuery ));     //my first jquery function



</script>    
<script type="text/javascript">


function microtime(get_as_float)
{
var unixtime_ms = new Date().getTime();
    var sec = parseInt(unixtime_ms / 1000);
    return (get_as_float) ? unixtime_ms/1000 : sec + (unixtime_ms - (sec * 1000))/1000 ;
}

$("head").ready(function(){   //gets executed faster than $(document).ready()
//get current timezone of user

//no background image on last child



$(".quick_links a:last-child").css("background-image","none");

$("#panel").css("width",screen.availWidth-240 + "px");
$("#user_menu .uplink").append("<img src='template\/img\/9.png' alt='\(Options\)'>");
$(".posts_t1:first").addClass("nobg");
$(".profile_main,h3.content_q").wrapInner("<div class='part_1'><div class='part_2'><div class='part_3'></div></div></div>"); //everything that needs 3-part backgrounds

//lazy dropdowns - also I have to work on a border on .right later
//started over, there's no shame in doing it
//this time I hope to make it even more fluid, making a parent span element the trigger to open the dropdown box
//lol it actually worked
//can't have margins inbetween dropdown boxes and their respective menus, otherwise it'll trigger the mouseleave. span.drop's encapsulation in the area space is limited to objects that are connected, and margins separate the connection.
$("span.drop").each(function(){

$(this).on({'mouseover':function(){
var nina = $(this).find(".uplink");
var nina2 = nina.offset().left;
var nina3 = nina.offset().top + nina.height();
$(this).find(".dropdown_content").attr("style","left: "+nina2+"px; top: "+nina3+"px;display:block;");



}, 'mouseleave':function(){
$(this).find(".dropdown_content").attr("style","display:none");
}

})
});


$("#title_trigger").next("textarea").hide().end().on(
'focus',function(){
if($(this).next("textarea").css("display") == "none"){
$(this).next("textarea").toggle("400", function(){
$(this).attr("style","display:block");
});     }
}).next("textarea").on('blur',function(){
if($(this).val() == $(this).prop("defaultValue") || $(this).val().length == "0"){
$(this).toggle("400");
}
});


//a whitespace, just for design's sake
$("#user_menu .left,#user_menu .right").each(function(){
if($(this).is(".left:first")){ //left will probably always be the first div but still
$(this).css("border-right","1px solid #26303F");
if($(this).next("div").is(":not('.left')") || $(this).is(":only-child")){
$(this).after("<div class='left boxxy'>&nbsp;</div>");
$(this).next("div.left").css("border-left","1px solid #38475D");
}  
/* if($(this).is(:first)){
$(this).css()
}  */
}
if($(this).is(".right:last")){
$(this).css("border-left","1px solid #38475D");
if($(this).prev("div").is(":not('.right')") || $(this).is(":only-child")){
$(this).prev("<div class='right'>&nbsp;</div>");
$(this).prev("div.right").css("border-left","1px solid #26303F");
}  
}

if($(this).is(".left:not(':first')")){
$(this).css("border-left","1px solid #38475D");
if($(this).is(":not('.boxxy')")){
if($(this).parent().is("span.drop")){
$(this).parent().prev().find(".boxxy").detach();
}

}
}


});    $("#user_menu .left,#user_menu .right,#user_menu .dropdown_content,#left1 div.box").wrapInner("<div class='spacer' />");



$("body").on('focus','.flick',function(){
if($(this).val()==$(this).prop("defaultValue")){
$(this).attr("extra",$(this).val()).val("");       
}}).on('blur','.flick',function(){if($(this).val().length == 0){
$(this).val($(this).prop("defaultValue"));
} }).on('change','.flick',function(){if($(this).hasClass("named") && ($(this).val().length == 0 || $(this).val()==$(this).prop("defaultValue"))){$(this).removeClass("named")}else{$(this).addClass("named")}
if($(this).val().length == 0){
$(this).val($(this).prop("defaultValue")); //had to change it to this for textareas
}}).on('keyup','.flick',function(event){
<?php if(isset($_SESSION['login_q']) && count($_GET) == 1 && compare_dz($logged_dt['password'],$_SESSION['salt_q'])): ?>  

if($(this).hasClass("school_search")){    


//I need to make the wait a certain amount of time after a person is done typing before displaying results
//In this case i'll set it to 3/4 of a second
//seems like there's already a jquery function for this but im not sure                
//or I could have just nulled the settimeout function before the last time it was executed
    event.stopPropagation();    
    if($(this).next().is("div")){   // $(this).next("#spark").html($(this).val());         
 $(this).next("div").load("template/simcheck.php?action=school_search&criteria="+encodeURIComponent($(this).parent().prev().text())+"&search_q=" +encodeURIComponent($(this).val()));


    }else{
    $(this).after("<div></div>");    }


   

 }
   <?php endif; ?>
//add em'
});


;

/*
$(".flick").each(function(){



$(this).on('focus', function(){
if($(this).val()==$(this).prop("defaultValue")){
$(this).attr("extra",$(this).val()).val("");       
}

}).blur(function(){if($(this).val().length == 0){
$(this).val($(this).prop("defaultValue"));
} }).change(function(){if($(this).hasClass("named") && ($(this).val().length == 0 || $(this).val()==$(this).prop("defaultValue"))){$(this).removeClass("named")}else{$(this).addClass("named")}
if($(this).val().length == 0){
$(this).val($(this).prop("defaultValue")); //had to change it to this for textareas
}
 //yup, change covers more than blur
});     
});  */
$("#first1").attr("extra",$("#first1").height()).addClass("lolbuffer").animate({height:$("#first1").attr('extra')},2200).removeClass("lolbuffer");
$("#close_button1").click(function(event){event.preventDefault();
$(this).parents("td#left1 div").detach();});  
 

$("span.signup input[type=text]").each(function(){
$(this).attr("title", " ");
});
  
$("body").on('click',"a.comment_opts",function(event){
event.preventDefault();
if($(this).parent().has("form").length){ $(this).parent().find("form").eq(0).detach();}else{
$("a#"+this.name).parent().append("<form action='index.php?direct=new_post&verify=<?php echo hack_free($_SESSION['temp_n']) ?>' method='POST'><input type='hidden' value='<?php $thread_id = isset($thread_data['postid']) ? $thread_data['postid'] : '08676'; echo $thread_id; ?>' name='thread_id'><input type='hidden' value='Comments' name='tcha1'><input value='"+ $(this).parent('.opts_block').attr('alt') +"' name='parent_comment' type='hidden'><textarea name='tcha2' class='largeform flick'><?php echo $nx['24'] ?></textarea><input type='submit' value='<?php echo $nx['25'] ?>' class='comment_opts'>");
}



}
); 

$("input[type=checkbox]").each(function(){
$(this).before("<button class='dc'>").addClass("clear");

});  

$("button.dc").each(function(){     //better-looking checkboxes
if($(this).next("input").is(":checked")){$(this).addClass("a2")}else{$(this).addClass("a1")}
if($(this).next("input[id]")){
$(this).attr("id","axe1" + $(this).next("input").attr("id"))
}
 //check initial checkbox value
$(this).click(function(mod){      mod.preventDefault();
if($(this).hasClass("a1") && $(this).next("input").prop("checked",false)){$(this).removeClass("a1").addClass("a2"); $(this).next("input").prop("checked",true)}else{$(this).removeClass("a2").addClass("a1"); $(this).next("input").prop("checked",false)}
});
});


<?php if(isset($_SESSION['login_q'])){require_once("template/autorelays.js");} ?> 

<?php if(preg_match("#profile[=](.+)$#",extraurl())){require_once("template/profile_sync.js");} ?> 

             var $black_layer = ["<div id='black_overlay'><div id='widthfix'>","</div></div>"];  

      
      
 
$("body").on('click',".prompt",function(event){event.preventDefault();

if($(this).attr("value") == "SEARCH SCHOOL"){  
$values = [[$(this).prev("input").prop("defaultValue"),$(this).prev("input").val()],[$(this).prev().prev("input").prop("defaultValue"),$(this).prev().prev("input").val()]]; 
$zenx = [($values[0][0] == $values[0][1]) ? " " : $values[0][1],($values[1][0] == $values[1][1]) ? " " : $values[1][1]];
  $(this).after(function(){if($(this).next().is("div") == true){return false;}else{return "<div id='school_search' class='contentbox'>Loading...</div>"}});
  $(this).next("div").html("Loading...").addClass("contentbox");
$.get("template/simcheck.php",{"action":"wikipedia_search","data":[$zenx[1],$zenx[0]]},function(data){
$(".prompt[value='SEARCH SCHOOL']").next("div").removeClass("contentbox").html(data);
});
}

if($(this).attr("href") == "submit-edit"){  
$.post("template/simcheck.php?action=css_edit",{"data":$("#jones").val(),"file":$("#jones").attr("title")},function(data){ alert(data);
if(data.notice == "success"){alert("Successfully edited file!");
}                                                                       
});
}


if($(this).attr("href") == "select-school"){     $("#select4").removeAttr("id");
$(this).attr("id","select4");

$.get("template/simcheck.php",{"action":"confirm_school","data":$(this).attr("datamine")}).done(function(msg){

$("#select4").parent().append(msg);

});



}
if(/^edit[:]/g.test($(this).attr("href"))){    //murder murder murder murrdurrrrrrrrrrrrrrrrr murrrrrrdurrrrrrrrr
//FINALLY. holy shit mother of god tweaking batman
$zen_0 = $(this).attr('href');      
$zen_1 = $(this).attr('href');                
$zen_1 = $zen_1.replace(/^edit[:](.+)$/,"$1");

$.get($zen_1).done(function(css){
     $("link[href='" +$zen_1+"']").remove();
//modify directory file at url('')'s
     $snick = css;
     $snick = $snick.replace(/url[\x28]img(.?)(.+)?/g,"url($1template/img$2");
     
     if($("head style[title='"+$zen_1+"']").length === 0){     
     $("head").append("<style title='"+$zen_1+"'>"+ $snick +"</style>");  
         
     }
if($("#jones").length === 0){  
$("a[href='"+$zen_0+"']").addClass("selected2").after("<a href='submit-edit' class='link_view link_view2 rad prompt'>Finish editing</a><textarea id='jones' title='"+$zen_1+"' style='height:500px;margin-top:5px'></textarea>");

//hmm...     

$("#jones").val($("style[title='"+$zen_1+"']").html());              
               
if($("style[title='"+$zen_1+"']").length === 0){  

   
   
}
}else{
}
     
}); 


}



if(/^v[\137]/g.test($(this).attr("href"))){




if($(".selected_link").attr("href") == $(this).attr("href")){

}else{$.get("template/simcheck.php",{"action":"change_panels","view":$(this).attr("href")});
if($(this).attr("href") == "v_css"){
$("#session_list").css({"width":"650px","height":"650px"});
}else{$("#session_list").removeAttr("style");}

$(".selected_link").removeClass("selected_link");  $(".open").removeClass("open");

$(this).addClass("selected_link");
$("div#" + $(this).attr("href")).addClass("open");

}
}




if($(this).attr("href") == "one-liner"){
$("#post_k input[name=tcha1]").val("<?php echo $nx['27'] ?>");$("#post_k textarea[name=tcha2]").toggle("200",function(){$(this).attr("style","display:block;box-shadow:0 0 6px #556378")}).removeClass("flick").val("<?php echo $nx['28'] ?>").end();  
}
if($(this).attr("href") == "add-more-choices"){
if($("input[name=poll_choice]").length < 21 && $("input[name=poll_choice]").eq(-1).val() !== "Add a choice here"){
$(this).before("<input type='text' class='largeform flick' value='Add a choice here' name='poll_choice'>");
}
}

if($(this).attr("href") == "add-friend"){  

$(this).addClass("greened");
$.get("template/simcheck.php",{"friend_status[]":[$("#check_friend_status").attr("ref1"),$("#check_friend_status").attr("ref2")],"action":"sg_req"}).done(function(data){
$("#check_friend_status").html(data);
});   


 
}

if($(this).attr("href") == "finished-poll-q"){
refs = "pass";
for(i=0;i<=$("input[name=poll_choice]").length;i++){
if(/^[ ]+$/.test($("input[name=poll_choice]").eq(i).val()) || $("input[name=poll_choice]").eq(i).val() == "Add a choice here"){
refs = "fail";
}
}
if(refs == "fail"){
alert("One or more of the poll choices were left blank. Please correct them.");
}else{
//convert all form inputs to hidden type
//append to post_k
//close form

//then i'm gonna have to do put it back here in case they decide to add/delete some stuff

$("#content").insertBefore("form#post_k");

if($("#input_save").html().length > 0){
$("#input_save").empty();
}

$("#content input[type=text],#content input[type=checkbox]").each(function(){
if($(this).attr("type") == "text"){
var order = ($(this).attr('name') == "poll_choice") ? $(this).attr('name') + ($(this).index()-2) : $(this).attr('name');
$("#input_save").prepend("<input type='hidden' name='"+ order +"' value='"+$(this).val()+"'>");
}
if($(this).attr("type") == "checkbox"){
$("#input_save").prepend("<input type='hidden' name='"+$(this).attr('name')+"' value='"+ $(this).prop('checked') +"'>");
}
});
$("#black_overlay").empty().detach();
$("#attach_poll_q").html("MANAGE ATTACHED POLL");
}


}
if($(this).attr("href") == "toggle"){
if($(this).parent().next().is(".spoiler")){$(this).parent().next(".spoiler").toggle();}
if($(this).parent().parent().is("#first1")){
$("#first1").toggle();
}
 

}

if($(this).attr("href") == "add-poll" && !($("#black_overlay").length)){
$("body").prepend($black_layer[0] + $black_layer[1]);
$("#content").appendTo("#widthfix");  //keep the dynamicity?


} 

});      

});



</script>   