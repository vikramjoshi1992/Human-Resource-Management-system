<%@ page import="java.sql.*;"%>
<%if(session.getAttribute("login")==null) response.sendRedirect("RMShome.html3?invalidsession");
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Orange Bond - About</title>
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
    	<jsp:include page="hr_transactions.jsp" />
<%
	String eid=request.getParameter("eid").toLowerCase();
	String ename=request.getParameter("ename").toLowerCase();
        String epwd=request.getParameter("epwd").toLowerCase();
	String sex=request.getParameter("sex").toLowerCase();
	String addr=request.getParameter("address").toLowerCase();
	String phone=request.getParameter("phone");
	String aemail=request.getParameter("alternate_email").toLowerCase();
	String designation=request.getParameter("designation");
	String grade=request.getParameter("grade");
	String primaryskills=request.getParameter("primaryskills");
	String secondaryskills=request.getParameter("secondaryskills");
	String salary=request.getParameter("salary");
	%>
<%	Connection con=null;
	PreparedStatement pst=null;
	PreparedStatement pst2=null;
	Statement st=null;
	ResultSet rs=null;
	try{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
                String myDb = "jdbc:derby://localhost:1527/rms";
                con = DriverManager.getConnection(myDb);
		
		pst=con.prepareStatement("insert into employee values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
											
				pst.setString(1,eid);	
				pst.setString(2,ename);
				pst.setString(14,sex);
				pst.setString(3,addr);
				pst.setInt(4,Integer.parseInt(phone));	
				pst.setString(5,aemail);
                                pst.setString(6, "");
				pst.setString(11,designation);	
				pst.setString(12,grade);
				pst.setString(7,primaryskills);
				pst.setString(8,secondaryskills);
				pst.setInt(13,Integer.parseInt(salary));
				pst.setString(10,"/emp_home.jsp");
				pst.setString(9,epwd);
                                
				int eff=pst.executeUpdate();		
				pst=con.prepareStatement("insert into attendance (empid) values ('"+eid+"')");
                                pst.executeUpdate();
                                pst=con.prepareStatement("insert into leave (empid) values ('"+eid+"')");
                                pst.executeUpdate();
				if(eff>0 )
					out.println("added Successful<BR>");
		
				else
					out.println("<CENTER><b><u>Failed To Add Employee<BR>");
		}
					
	catch(Exception e)	
		{
   		String msgs=" ";
		msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The User Name U Specified is Already Existed.<BR><BR>Please Choose Another Name":"UnKnown Exception Occured";
		out.println("<body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;"+e);

		}
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
	Copyright � 2017 <a href="#">MayaViDREAM</a>
    </div>
</div>

</body>
</html>


