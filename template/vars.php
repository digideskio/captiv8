<?php

$check_3['username'] = isset($check_3['username']) ? $check_3['username'] : "";

//text references
//remember that they will show up as $nx[n] where n = its position in the sequence -1
//This is so that I can change it for other translations easier in the future.
$nx = array(  //english
"username..." /*1 - username pre-click text*/,
"password" /* 2- password pre-click text*/,
"LOG IN" /*3 - log in button text*/,
"SIGN UP" /*4 -signup button text*/,
/*5 - first-time visitor*/"<p>Are you a first-time visitor?<br><br>Captivate is a social media
site that has multiple ways
of interaction with other
users.  <br><br>

If this is truly your first time
visiting this site, we
encourage you to sign up
to fully know of all
our types of social media.
which includes, but is not
limited to a message board,
a gallery. polls, and a 
normal news feed.   <br><br>

You ask, what makes us
different from all the other
social media sites? Diversity
of content. Some may have
some, or even most, of the
kind of social media we
have, but we have all of
them lumped in one site. <br><br>
Signing up is totally free and will take less than a minute at the most.</p><div class='bottom_menu'><a href='?direct=signup' class='side1'>Sign Up</a><a href='toggle' class='side2 prompt'>Close</a></div>",   // 6 - next, up, some fake sample terms and conditions lol 
'<h3>Terms and conditions</h3>
<div class="boxxed">
<p>Welcome to our online store! Captivate and its associates provide their services to you subject to the following conditions. You are bound by the rules of these within any page of http://captivate.ws. </p>

<h4>PRIVACY</h4>

<p>Please review our Privacy Notice, which also governs your visit to our website, to understand our practices. </p>

<h4>ELECTRONIC COMMUNICATIONS</h4>

<p>When you visit Captivate or send e-mails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by e-mail or by posting notices on this site. You agree that all agreements, notices, disclosures and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing. </p>

<h4>COPYRIGHT</h4>

<p>All content included on this site, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software, is the property of Captivate or its content suppliers and protected by international copyright laws. The compilation of all content on this site is the exclusive property of Captivate, with copyright authorship for this collection by Captivate, and protected by international copyright laws. </p>

<h4>TRADE MARKS</h4>

<p>Captivates trademarks and trade dress may not be used in connection with any product or service that is not Captivates, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits Captivate. All other trademarks not owned by Captivate or its subsidiaries that appear on this site are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by Captivate or its subsidiaries. </p>

<h4>LICENSE AND SITE ACCESS</h4>

<p>Captivate grants you a limited license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of Captivate. This license does not include any resale or commercial use of this site or its contents: any collection and use of any product listings, descriptions, or prices: any derivative use of this site or its contents: any downloading or copying of account information for the benefit of another merchant: or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without express written consent of Captivate. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of Captivate and our associates without express written consent. You may not use any meta tags or any other "hidden text" utilizing Captivates name or trademarks without the express written consent of Captivate. Any unauthorized use terminates the permission or license granted by Captivate. You are granted a limited, revocable, and nonexclusive right to create a hyperlink to the home page of Captivate so long as the link does not portray Captivate, its associates, or their products or services in a false, misleading, derogatory, or otherwise offensive matter. You may not use any Captivate logo or other proprietary graphic or trademark as part of the link without express written permission. </p>

<h4>YOUR MEMBERSHIP ACCOUNT</h4>

<p>If you use this site, you are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer, and you agree to accept responsibility for all activities that occur under your account or password. If you are under 18, you may use our website only with involvement of a parent or guardian. Captivate and its associates reserve the right to refuse service, terminate accounts, remove or edit content, or cancel orders in their sole discretion. </p>

<h4>REVIEWS, COMMENTS, EMAILS, AND OTHER CONTENT</h4>

<p>Visitors may post reviews, comments, and other content: and submit suggestions, ideas, comments, questions, or other information, so long as the content is not illegal, obscene, threatening, defamatory, invasive of privacy, infringing of intellectual property rights, or otherwise injurious to third parties or objectionable and does not consist of or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings, or any form of "spam." You may not use a false e-mail address, impersonate any person or entity, or otherwise mislead as to the origin of a card or other content. Captivate reserves the right (but not the obligation) to remove or edit such content, but does not regularly review posted content. If you do post content or submit material, and unless we indicate otherwise, you grant Captivate and its associates a nonexclusive, royalty-free, perpetual, irrevocable, and fully sublicensable right to use, reproduce, modify, adapt, publish, translate, create derivative works from, distribute, and display such content throughout the world in any media. You grant Captivate and its associates and sublicensees the right to use the name that you submit in connection with such content, if they choose. You represent and warrant that you own or otherwise control all of the rights to the content that you post: that the content is accurate: that use of the content you supply does not violate this policy and will not cause injury to any person or entity: and that you will indemnify Captivate or its associates for all claims resulting from content you supply. Captivate has the right but not the obligation to monitor and edit or remove any activity or content. Captivate takes no responsibility and assumes no liability for any content posted by you or any third party. </p>

<h4>RISK OF LOSS</h4>

<p>All items purchased from Captivate are made pursuant to a shipment contract. This basically means that the risk of loss and title for such items pass to you upon our delivery to the carrier. </p>

<h4>PRODUCT DESCRIPTIONS</h4>

<p>Captivate and its associates attempt to be as accurate as possible. However, Captivate does not warrant that product descriptions or other content of this site is accurate, complete, reliable, current, or error-free. If a product offered by Captivate itself is not as described, your sole remedy is to return it in unused condition. </p>

<p>DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY THIS SITE IS PROVIDED BY Captivate ON AN "AS IS" AND "AS AVAILABLE" BASIS. Captivate MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND, EXPRESS OR IMPLIED, AS TO THE OPERATION OF THIS SITE OR THE INFORMATION, CONTENT, MATERIALS, OR PRODUCTS INCLUDED ON THIS SITE. YOU EXPRESSLY AGREE THAT YOUR USE OF THIS SITE IS AT YOUR SOLE RISK. TO THE FULL EXTENT PERMISSIBLE BY APPLICABLE LAW, Captivate DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Captivate DOES NOT WARRANT THAT THIS SITE, ITS SERVERS, OR E-MAIL SENT FROM Captivate ARE FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. Captivate WILL NOT BE LIABLE FOR ANY DAMAGES OF ANY KIND ARISING FROM THE USE OF THIS SITE, INCLUDING, BUT NOT LIMITED TO DIRECT, INDIRECT, INCIDENTAL, PUNITIVE, AND CONSEQUENTIAL DAMAGES. CERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS, EXCLUSIONS, OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MIGHT HAVE ADDITIONAL RIGHTS. </p>

<h4>APPLICABLE LAW</h4>

<p>By visiting Captivate, you agree that the laws of the state of DEFINE_STATE, DEFINE_COUNTRY, without regard to principles of conflict of laws, will govern these Conditions of Use and any dispute of any sort that might arise between you and Captivate or its associates. </p>

<h4>DISPUTES</h4>

<p>Any dispute relating in any way to your visit to Captivate or to products you purchase through Captivate shall be submitted to confidential arbitration in DEFINE_STATE, DEFINE_COUNTRY, except that, to the extent you have in any manner violated or threatened to violate Captivates intellectual property rights, Captivate may seek injunctive or other appropriate relief in any state or federal court in the state of DEFINE_STATE, DEFINE_COUNTRY, and you consent to exclusive jurisdiction and venue in such courts. Arbitration under this agreement shall be conducted under the rules then prevailing of the American Arbitration Association. The arbitrators award shall be binding and may be entered as a judgment in any court of competent jurisdiction. To the fullest extent permitted by applicable law, no arbitration under this Agreement shall be joined to an arbitration involving any other party subject to this Agreement, whether through class arbitration proceedings or otherwise. </p>

<h4>SITE POLICIES, MODIFICATION, AND SEVERABILITY</h4>

<p class="nobuff">Please review our other policies, such as our Shipping and Returns policy, posted on this site. These policies also govern your visit to Captivate. We reserve the right to make changes to our site, policies, and these Conditions of Use at any time. If any of these conditions shall be deemed invalid, void, or for any reason unenforceable, that condition shall be deemed severable and shall not affect the validity and enforceability of any remaining condition. </p></div>',
'Desired username', // 7 - username registrar
'Your password',    //8 - password registrar test
'Your email address', //9 - email address
'Your full name','Date of birth',"Greetings", // have this just for the sake of different languages 10, 11, and 12 right here
"View all of your currently used services", //13 - view all currently used services 
"Edit your profile" // 14 - profile link at user_menu dropdown
, "Viewing Profile" // 15 - 
, "OPTIONS" // 16 - More uptions under menu
, "Joined " // 17 - 
, "Thoughts you might have right now, post it here!"     //on the new post - 18
, "...Even explain it in detail, if you like!"//19
, "Post into these snowglobes?" // 20th
, "Your Profile" //21st€
, "Post it!"      //22 - this is in caps btw
, "This user has no posts yet." //23 
,"Replying to " //24
, "Reply to this comment... Ergo, comment on this comment." //25 - reply to this comment text
, "Submit comment!" //26 submit comment submit button
, " (Comment chain) " //27 viewing comment chain page title
, "(One-liner) [Insert Joke Here]"
, "Punchline goes here. Hopefully, it not only sounds funny in your head."
, "<div class='box'>
<h3>About to post? Here's a quick format guide:</h3>
<p>Put the code <span class='code'>(One-liner) [Insert Joke Here]</span> in the beginning of the title and you can post your own one-liner joke! Hopefully the joke you made will be worth the cued laugh track in your mind. Whenever people see the post, the punchline is hidden in the spoilers. The second box will have the punchline. <strong><a href='one-liner' class='prompt'>Try it!</a> &middot; <a href='' id='close_button1'>(Close window)</a></strong></span></p>

</div>",
"ATTACH A POLL",
//remember
//poll settings
//additional poll questions
//let's make it up to 20 questions maximum

"<h3>Poll maker</h3><input type='text' class='largeform flick pollquestion' value='Insert poll question here...' name='poll_question'><h3>Poll choices<span> - You must have at least two</span></h3><input type='text' class='largeform flick' value='Add a choice here' name='poll_choice'><input type='text' class='largeform flick' value='Add a choice here' name='poll_choice'><a href='add-more-choices' class='prompt button_samp rad'>Add more choices...</a><h3>Poll options</h3><div class='optionbox'><input type='checkbox' name='choice_addition'><span>Make anyone able to add poll choices</span></div><div class='optionbox'><input type='checkbox' name='choice_selection'><span>Only one poll choice allowed for each user</span></div><a href='finished-poll-q' class='greened prompt button_samp rad'>Finish poll questions</a>"
,"Editing your profile"   , 
"Unfortunately, the school you typed down is currently not in the directory. Click here to add your school into the current directory."
, "Add your school","Your search query is going to be referenced with all wikipedia school entries. If your school is not listed in Wikipedia, you will have to type in details for yourself."
, "","There are no more posts to display.","Successfully completed input!","Unfortunately, you have failed to enter correct details."   //39th at this point



);

$dobordate = "<select name='day2' class='largeform'><option value='0'>--</option><option value='1'>1</option><option value='2'>2</option><option value='3'>3</option><option value='4'>4</option><option value='5'>5</option><option value='6'>6</option><option value='7'>7</option><option value='8'>8</option><option value='9'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option></select> 
  <select name='month2' class='largeform'><option value='0'>--</option><option value='1'>January</option><option value='2'>February</option><option value='3'>March</option><option value='4'>April</option><option value='5'>May</option><option value='6'>June</option><option value='7'>July</option><option value='8'>August</option><option value='9'>September</option><option value='10'>October</option><option value='11'>November</option><option value='12'>December</option></select> 
  <select name='year2' class='largeform'><option value='0'>--</option><option value='2013'>2013</option><option value='2012'>2012</option><option value='2011'>2011</option><option value='2010'>2010</option><option value='2009'>2009</option><option value='2008'>2008</option><option value='2007'>2007</option><option value='2006'>2006</option><option value='2005'>2005</option><option value='2004'>2004</option><option value='2003'>2003</option><option value='2002'>2002</option><option value='2001'>2001</option><option value='2000'>2000</option><option value='1999'>1999</option><option value='1998'>1998</option><option value='1997'>1997</option><option value='1996'>1996</option><option value='1995'>1995</option><option value='1994'>1994</option><option value='1993'>1993</option><option value='1992'>1992</option><option value='1991'>1991</option><option value='1990'>1990</option><option value='1989'>1989</option><option value='1988'>1988</option><option value='1987'>1987</option><option value='1986'>1986</option><option value='1985'>1985</option><option value='1984'>1984</option><option value='1983'>1983</option><option value='1982'>1982</option><option value='1981'>1981</option><option value='1980'>1980</option><option value='1979'>1979</option><option value='1978'>1978</option><option value='1977'>1977</option><option value='1976'>1976</option><option value='1975'>1975</option><option value='1974'>1974</option><option value='1973'>1973</option><option value='1972'>1972</option><option value='1971'>1971</option><option value='1970'>1970</option><option value='1969'>1969</option><option value='1968'>1968</option><option value='1967'>1967</option><option value='1966'>1966</option><option value='1965'>1965</option><option value='1964'>1964</option><option value='1963'>1963</option><option value='1962'>1962</option><option value='1961'>1961</option><option value='1960'>1960</option><option value='1959'>1959</option><option value='1958'>1958</option><option value='1957'>1957</option><option value='1956'>1956</option><option value='1955'>1955</option><option value='1954'>1954</option><option value='1953'>1953</option><option value='1952'>1952</option><option value='1951'>1951</option><option value='1950'>1950</option><option value='1949'>1949</option><option value='1948'>1948</option><option value='1947'>1947</option><option value='1946'>1946</option><option value='1945'>1945</option><option value='1944'>1944</option><option value='1943'>1943</option><option value='1942'>1942</option><option value='1941'>1941</option><option value='1940'>1940</option><option value='1939'>1939</option><option value='1938'>1938</option><option value='1937'>1937</option><option value='1936'>1936</option><option value='1935'>1935</option><option value='1934'>1934</option><option value='1933'>1933</option><option value='1932'>1932</option><option value='1931'>1931</option><option value='1930'>1930</option><option value='1929'>1929</option><option value='1928'>1928</option><option value='1927'>1927</option><option value='1926'>1926</option><option value='1925'>1925</option><option value='1924'>1924</option><option value='1923'>1923</option><option value='1922'>1922</option><option value='1921'>1921</option><option value='1920'>1920</option><option value='1919'>1919</option><option value='1918'>1918</option><option value='1917'>1917</option><option value='1916'>1916</option><option value='1915'>1915</option><option value='1914'>1914</option><option value='1913'>1913</option><option value='1912'>1912</option><option value='1911'>1911</option><option value='1910'>1910</option><option value='1909'>1909</option><option value='1908'>1908</option><option value='1907'>1907</option><option value='1906'>1906</option><option value='1905'>1905</option><option value='1904'>1904</option><option value='1903'>1903</option><option value='1902'>1902</option><option value='1901'>1901</option><option value='1900'>1900</option></select>
  "

  ;
$reply_wrap = ["<div class='contentbox comment_box'><table><tr> <td class='user_info'>"
,"</td><td><p class='post_text'> "
,"<span class='side_info'>- Posted" 
, "</a></span> </p>"
, "<div class='opts_block'" 
,  "</div>"
, "</td></tr></table></div>"];
?>                                                                              