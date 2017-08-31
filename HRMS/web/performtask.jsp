<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalidsession");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Perform Taskt</title>
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
                        <li><a href="./empprofile.jsp">Profile</a></li>
                        <li><a href="./emp_home.jsp">Employee Home</a></li>
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
    	<jsp:include page="emp_transactions.jsp" />
		<%

			Connection con=null;
			PreparedStatement stmt=null;
			Statement st=null;
			ResultSet rs=null;
		    try{
				Class.forName("org.apache.derby.jdbc.ClientDriver");
                                String myDb = "jdbc:derby://localhost:1527/rms";
                                con = DriverManager.getConnection(myDb);
			if(session.getAttribute("login")==null) response.sendRedirect("RMShome.html3?invalid");	
		                st=con.createStatement();
			        String id=session.getAttribute("login").toString();
			        rs=st.executeQuery("Select * from workassign where empid='"+id+"'");
			
			    while(rs.next()) {
                                String pid=rs.getString(1);
				String project_name=rs.getString(2);
				String modname=rs.getString(3);
				String description=rs.getString(4);
				String submitdate=rs.getString(6);
						
			out.println("<table width=600 height=300 align=center cellspacing=0 border=0 cellpadding=0><tr><td><fieldset id=fieldhead><legend>Work Assignment</legend><BR><table align=center cellspacing=1 cellpadding=3><form method=post action=performtaskupdate.jsp><tr><td><table width=600 height=300 align=center cellspacing=0 border=0 cellpadding=0><table width=80% align='center' cellspacing=1 cellpadding=3><tr><td><input name=pid type=hidden value="+pid+"></td></tr><tr><td width='30%'>Project Name</td><td width='30%' style='color:gray'>"+project_name+"</td></tr><tr><td width='30%'>Assigned Task</td><td width='30%' style='color:gray'>"+modname+"</td></tr><tr><td width='30%'>Description</td><td width='30%' style='color:gray'>"+description+"</td></tr><tr><td width='30%'>Submit Date</td><td width='30%' style='color:gray'>"+submitdate+"</td></tr><tr><td width='30%'>Task Perforrmed</td><td><textarea name=taskperform cols=40 rows=10></textarea></td></tr><tr><td width='30%'>Status</td><td width='30%' style='color:gray'><select name=status><option>      </option> <option>Not Yet</option> <option>Completed</option></select></td></tr><tr><Td colspan=2 align=center><button type=submit accesskey=S><u>S</u>ubmit Task</button>&nbsp;&nbsp;<button type=reset accesskey=R><u>R</u>eset</button></td></tr></table><tr><td></td></tr></table></form> </fieldset></td></tr></table>");
				
				}
		}catch(Exception e){e.printStackTrace();}

		%>
                
          
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



</body></html>