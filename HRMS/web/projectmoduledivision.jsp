<%if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalidsession");%>
<html xmlns=""><head>
<link href="css/tooplate_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Project Module Division</title>
</head><body>
    <div id="tooplate_header">
    <div id="tooplate_mid_wrapper">
    	<div id="tooplate_mid_sub">

			<div id="mid_title" align="center">Human Resource management System</div>
            
           
        </div>
    </div>
</div>
<table width="780" align=center cellspacing=0 border="4" cellpadding=0>
<jsp:include page="rm_transactions.jsp" /><br>
	<tr><td>
		<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
			<tr><td>
				<fieldset id="fieldhead">
				<legend>Project Modules</legend><BR>
					<%@ page import="java.sql.*"%>
				<%
					Connection con=null;
					PreparedStatement pst=null;
					Statement st=null;
					ResultSet rs=null;
					try	
					{
						String pid=request.getParameter("pid").trim();
						String manpowerreq=request.getParameter("manpowerreq");
						String module1=request.getParameter("module1").trim();
						String description1=request.getParameter("description1").trim();
						String module2=request.getParameter("module2").trim();
						String description2=request.getParameter("description2").trim();
						String module3=request.getParameter("module3").trim();
						String description3=request.getParameter("description3").trim();
						String module4=request.getParameter("module4").trim();
						String description4=request.getParameter("description4").trim();
						String module5=request.getParameter("module5").trim();
						String description5=request.getParameter("description5").trim();
						if(session.getAttribute("login")==null) response.sendRedirect("RMShome.htm?invalid");	

						Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                String myDb = "jdbc:derby://localhost:1527/rms";
                                                con = DriverManager.getConnection(myDb);
						
						pst=con.prepareStatement("insert into projectmodules values (?,?,?,?,?,?,?,?,?,?,?,?)");
					
						pst.setString(1,pid);	
						pst.setInt(2,Integer.parseInt(manpowerreq));	
						pst.setString(3,module1);
						pst.setString(4,description1);
						pst.setString(5,module2);
						pst.setString(6,description2);
						pst.setString(7,module3);
						pst.setString(8,description3);
						pst.setString(9,module4);
						pst.setString(10,description4);
						pst.setString(11,module5);
						pst.setString(12,description5);				
								
						int eff=pst.executeUpdate();		
						
						if(eff>0 )
							out.println(" Module Division is Successful<BR><center><a href=\"javascript:history.back()\">Continue</a>");
				
						else
							out.println("<CENTER><b><u>Failed To Module Division<BR><center><a href=\"javascript:history.back()\">Continue</a>");
					}
								
					catch(Exception e)	
						{
					   	String msgs=" ";
						out.println("<body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;"+e);
						}
				%>
						
						
					
				</fieldset>
			</td></tr>
		</table>
	</td></tr>
</table>
 <div class="cleaner"></div>
                                                
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
</body></html>



