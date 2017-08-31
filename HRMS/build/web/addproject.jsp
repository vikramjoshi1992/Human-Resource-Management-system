<%if(session.getAttribute("login")==null) response.sendRedirect("RMShome.html3?invalidsession");
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add Project</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/tooplate_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />

<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue === field.value) field.value = '';
    else if (field.value === '') field.value = field.defaultValue;
}
</script>

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">


</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "tooplate_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js?load=effects,builder" type="text/javascript"></script>
<script src="js/lightbox.js" type="text/javascript"></script>

</head>
<body>

<div id="tooplate_header">
	<div id="tooplate_top">
    	<div id="tooplate_search">
            <form action="#" method="get">
              <input type="text" value="Search" name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
              <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
            </form>
		</div>
    </div>
    <div id="tooplate_titlebar">
    	<div id="site_title"><h1><a href="#">Orange Bond</a></h1></div>
        <div id="tooplate_menu" class="ddsmoothmenu">
            <ul>
              <li><a href="index.html">Home</a></li>
          		<li><a href="about.html" >About</a>
                   
              </li>
         	  <li><a href="services.html">Services</a>
                   
              </li>
              <li><a href="contact.html">Contact</a></li>
         <li><a href="#" class="selected">hello,<%out.println(session.getAttribute("login"));%></a>
              <ul>
                        <li><a href="./hrprofile.jsp">Profile</a></li>
                        <li><a href="./hr_home.jsp">HR Home</a></li>
                        <li><a href="./logout.jsp">Log out</a></li>
                  </ul> 
               </li>
             
            </ul>
            <br style="clear: left" />
        </div> <!-- end of tooplate_menu -->
    </div>
    
    <div id="tooplate_mid_wrapper">
    	<div id="tooplate_mid_sub">

			<div id="mid_title">Human Resource management System</div>
            
           
        </div>
    </div>
</div> <!-- end of header -->

<div id="tooplate_main">
	<div class="about_box">
<table width="780" align=center cellspacing=0 border="4" cellpadding=0>
<jsp:include page="hr_transactions.jsp" /><br>
	<tr><td>
		<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
		<tr><td>
			<fieldset id="fieldhead">
			<legend>Add New Project</legend><BR>
			<table align=center cellspacing=1 cellpadding=3><form method=post action="addprojectstatus.jsp">
				<center>
				<tr><Td>Client Name:</td><TD><input name="cname"></td></tr>
				<tr><Td>Project Id:</td><TD><input name="pid"></td></tr>
				<tr><Td >Project Name:</td><TD><input name="pname"></td></tr>
				<TR><TD >Platform:</td><td>
				<select name=Platform>
					<option value="">
					<option value="C">C
					<option value="C++">C++
					<option value="Java">Java
					<option value=".Net">.Net
					</select>
				</td></tr>
				<tr><Td>Duration(in months):</td><TD><input name="duration"></td></tr>
				<tr>
				<Td>End Date</td>				
			    <td><select name="dd">
			      <option>dd</option>
			      <option value="01">01</option>
			      <option value="02">02</option>
			      <option value="03">03</option>
			      <option value="04">04</option>
			      <option value="05">05</option>
			      <option value="06">06</option>
			      <option value="07">07</option>
			      <option value="08">08</option>
			      <option value="09">09</option>
			      <option value="10">10</option>
			      <option value="11">11</option>
			      <option value="12">12</option>
			      <option value="13">13</option>
			      <option value="14">14</option>
			      <option value="15">15</option>
			      <option value="16">16</option>
			      <option value="17">17</option>
			      <option value="18">18</option>
			      <option value="19">19</option>
			      <option value="20">20</option>
			      <option value="21">21</option>
			      <option value="22">22</option>
			      <option value="23">23</option>
			      <option value="24">24</option>
			      <option value="25">25</option>
			      <option value="26">26</option>
			      <option value="27">27</option>
			      <option value="28">28</option>
			      <option value="29">29</option>
			      <option value="30">30</option>
			      <option value="31">31</option>
			    </select>
			    <select name="mm">
			      <option>mm</option>
			      <option value="01">01</option>
			      <option value="02">02</option>
			      <option value="03">03</option>
			      <option value="04">04</option>
			      <option value="05">05</option>
			      <option value="06">06</option>
			      <option value="07">07</option>
			      <option value="08">08</option>
			      <option value="09">09</option>
			      <option value="10">10</option>
			      <option value="11">11</option>
			      <option value="12">12</option>
			    </select>
				<select name="yyyy">
			      <option>year</option>
			      
                              <option value="2015">2017</option>
                              <option value="2015">2018</option>
                              <option value="2015">2019</option>
                              <option value="2015">2020</option>
                              <option value="2015">2021</option>
                              <option value="2015">2022</option>
                              <option value="2015">2023</option>
			    </select></td>
			  </tr>
				<tr><Td>Budget</td><TD><input name="budget"></td></tr>
				<tr><Td colspan=2 align=center><button type=submit accesskey="A"><u>A</u>dd Project</button>
				&nbsp;&nbsp;<button type=reset accesskey="R"><u>R</u>efresh</button></td></tr>
				</center>
			</table><BR>
			</fieldset>
		</td></tr></table>
	</td></tr>
</table>
        <div class="cleaner"></div>
    </div>
    
    <div class="cleaner"></div>
</div>

<div id="tooplate_footer_wrapper">
	<div id="tooplate_footer">
    	<div class="col_4">
        	<h5>Quick Links Links</h5>
            <ul class="footer_list">
            	<li><a href="attendance.jsp">Attendance</a></li>
                <li><a href="applyleave.jsp">Apply Leave</a></li>
                <li><a href="contact.html">Contact Us</a></li>
                <li><a href="about.html">About Us</a></li>
                <li><a href="RMShome3.html">Login</a>
			</ul>
        </div>
        <div class="col_4">
        	<h5>Recent Projects</h5>
            <ul class="footer_list">
            	<li><a href="#">An automatics attendance App in android language.</a></li>
                <li><a href="#">TrueBusy App in android language.</a></li>
                <li><a href="#">Improve security in Cloud computing with fragmentation. </a></li>
			</ul>                
        </div>
        <div class="col_4">
        	<h5>Support</h5>
            <ul class="twitter_post">
	            <li><a href="#">Product Support</a></li>
                <li><a href="#">Community</a></li>
                <li><a href="#">Report Abuse</a></li>
			</ul>
        </div>
        <div class="col_4 col_l">
        	<h5>About</h5>
            <p>Major projects are done in JSP and html language so that our dynamic website should be fast.Our CEO "Vikram Joshi" is trying hard to deliver all services to their customers. </p>
            <div class="footer_social_button">
                <a href="#"><img alt="Facebook" src="images/facebook-32x32.png" title="facebook" /></a>
                <a href="#"><img alt="Flickr" src="images/flickr-32x32.png" title="flickr" /></a>
                <a href="#"><img alt="Twitter" src="images/twitter-32x32.png" title="twitter" /></a>
                <a href="#"><img alt="Youtube" src="images/youtube-32x32.png" title="youtube" /></a>
                <a href="#"><img alt="RSS" src="images/rss-32x32.png" title="rss" /></a>
			</div>
		</div>
        <div class="cleaner"></div>
    </div>
</div>

<div id="tooplate_cr_bar_wrapper">
	<div id="tooplate_cr_bar">
	Copyright © 2017 <a href="#">MayaViDREAM</a>
    </div>
</div>

</body>
</html>


