<%if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalidsession");
%>
<%@ page import="java.sql.*;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit Profile</title>
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
<style>
.city {
   float: left;
   margin: 10px;
   padding: 10px;
   max-width: 300px;
   height: 400px;
   border: 1px solid black;
}  
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    float: left;
    width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>
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
                        <li><a href="./hr_home.jsp">Employee Home</a></li>
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
    	<table cellSpacing=0 cellPadding=0 border=0px bordercolor=#999966>
		<tr><td>
		<jsp:include page="hr_transactions.jsp" /><BR>
		</TBODY>
        
        </TABLE>
	</td></tr></table>
        
</div>
                
                <div>
                    <h2>Edit your Profile Form</h2>

<form action="hr_updatedprofile.jsp" style="border:1px solid #ccc">
  <div class="container">

    <%

	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
    try{
		 Class.forName("org.apache.derby.jdbc.ClientDriver");
                 String myDb = "jdbc:derby://localhost:1527/rms";
                 con = DriverManager.getConnection(myDb);
		 if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalid");	
                 st=con.createStatement();
	
                 String id=session.getAttribute("login").toString();
	
                 rs=st.executeQuery("Select * from employee where empid='"+id+"'");
	
	while(rs.next()) {
		String empid=rs.getString(1);
		String empname=rs.getString(2);
		String gender=rs.getString(14);
		String address=rs.getString(3);
               
		int cno=rs.getInt(4);
		String aemail=rs.getString(5);

                String pwd=rs.getString(9);
                
                out.println("<label><b>Address</b></label><input type=text name=empid required value="+empid+" readonly>");
                
                out.println("<label><b>Emp Name</b></label><input type=text name=empname required value="+empname+">");
    
                out.println("<label><b>Address</b></label><input type=text name=address required value="+address+">");
    
                out.println("<label><b>Address</b></label><input type=text name=gender required value="+gender+">");
    
                out.println("<label><b>contact No</b></label><input type=text name=contactno required value="+cno+">");
    
                out.println("<label><b>Email</b></label><input type=text name=email required value="+aemail+">");
    
                out.println("<label><b>Password</b></label><input type=text name=pwd required value="+pwd+">");

                out.println("<div class=clearfix><button type=submit class=signupbtn>Update</button></div>");
		
		}
}catch(Exception e){e.printStackTrace();}

%>
    

  </div>
</form>
                </div>
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


