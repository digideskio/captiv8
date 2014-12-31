<?php

//for later reference

  //incidentally I need to make a database here for school records        
  //i'm gonna go ahead and make it look in the first 3 pages or so                
    
  
  //first off, this is soooooo bandwidth-intensive
  //hopefully that should cover some of the lag. It's a 5 second delay from when a person started typing
          
  $search_query["bulk"] = [file_get_html("http://www.google.com/search?q=". rawurlencode($_FILTERED['search_q'] . ' ' . $_FILTERED['criteria']) . "%20Wikipedia")];
  foreach($search_query["bulk"] as $html_bulk){ //   $i = isset($i) ? $i+1 : 0;      //stupid logic dyslexia
  $html_composite = isset($html_composite) ? $html_composite .= $html_bulk->find("div#ires",0) : $html_bulk->find("div#ires",0);
  
  
  }

  $html_composite = str_get_html($html_composite);
  $search_query["results"] = $html_composite->find("li.g");
  foreach($search_query["results"] as $iterations){
  //get all possible search parameters that can include a school from the links
  //then filter the search results to only include schools
  
  //incidentally, html-dom-search is fun to use
  
  //cross-reference all wikipedia pages
  //reference its sidebar to check if its a high school or college, etc
  //initially I was going to use Wikipedia's API to get results but decided against
               
  
  $parsed_1 = str_get_html($iterations);
  $parsed_2 = [$parsed_1->find(".s .kv",0),$parsed_1->find("h3", 0)];  //get URLs and page titles of search results

  if(is_object($parsed_2[0]) && is_object($parsed_2[1]) && preg_match("#en[.]wikipedia[.]org#",$parsed_2[0]->plaintext) && preg_match("#".$_FILTERED['search_q']."#",$parsed_2[1])){
  //then what
  //uh
  //reference its page in wikipedia which is $parsed_2[0]
 // $search_query["check_sidebar"] = file_get_html("http://" .$parsed_2[0]->plaintext);
  //look for sidebar
  $links = str_get_html($parsed_2[0])->find(".kv");
  

 foreach($links as $reference){  $x = isset($x) ? $x+1 : 0;    
 $urlencode = "http://" . preg_replace("#[ ]+(.){0,}$#","",$reference->plaintext);    //remove all the side text  
 
 //reference the sidebar on these links for data if they even exist
 $refer_to_url = file_get_html($urlencode)->find("#mw-content-text table.infobox",0);
 if(is_object($refer_to_url)){
 //get data on each row in an array
 $get_properties = str_get_html($refer_to_url->outertext);   
 $get_data = $get_properties->find("tr");   //get only the ones with td's (ergo, data rows)

 $data_screened = str_get_html($get_properties->innertext)->find("th[!colspan],td[!colspan]");

 
 foreach($data_screened as $sheet){
 if(preg_match("#^<th#",$sheet)){$name = strtolower(preg_replace("#[^A-Za-z]#","",$sheet->plaintext));
             //criteria evaluation
 if(preg_match("#school|college|academy|university|education|grade#",strtolower($name))){$is_school = "yes";}
 }
 else{$value = $sheet->plaintext;}     
 
 if(isset($name)){$properties[$x][$name] = isset($value) ? preg_replace("#([\133](.+)[\135][ ]+)$#","",$value) : "";  }
 
 }
  
  if(isset($is_school)){ echo $get_title;
  
  var_dump($properties);  
  
     
  } 
$refer_to_url->clear(); }
 
   unset($is_school);
   
 }
 
     }

//   echo $search_query["get_data"];
  }
    foreach($search_query["bulk"] as $html_bulk){ $i = isset($i) ? $i+1 : 0; 
   $search_query["bulk"][$i]->clear();
  }


?>