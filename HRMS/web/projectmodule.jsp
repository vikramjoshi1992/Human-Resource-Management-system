<%@ page import="java.sql.*"%>
<%
    if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalidsession");
    Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
 %>
 <script>
 function getValues(combo) {
 document.forms[0].project_name.value=combo.options[combo.selectedIndex].getAttribute('project_name');
 document.forms[0].platform.value=combo.options[combo.selectedIndex].getAttribute('platform');
 document.forms[0].duration.value=combo.options[combo.selectedIndex].getAttribute('duration');
 document.forms[0].enddate.value=combo.options[combo.selectedIndex].getAttribute('enddate');
 }
 onload=function() {
	 if(document.forms[0].pid.options.length>1)
     document.forms[0].pid.options[1].selected=true;
	 getValues(document.forms[0].pid);}
 </script>
<html xmlns=""><head>
<link href="css/tooplate_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Project Module</title>
</head><body>
    <div id="tooplate_header">
    <div id="tooplate_mid_wrapper">
    	<div id="tooplate_mid_sub">

			<div id="mid_title" align="center">Human Resource management System</div>
            
           
        </div>
    </div>
</div>
	<table width="780" align=center cellspacing=0 border="4" cellpadding=0>
	<jsp:include page="rm_transactions.jsp" />
			<tr><td>
			<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
			<tr><td>
			<fieldset id="fieldhead">
				<legend>Module Division</legend><BR>
					<table align=center cellspacing=1 cellpadding=3>
					<form method=post action="projectmoduledivision.jsp">
					<tr><td>
					<table width="600" height="150"align=center cellspacing=0 border="0" cellpadding=0>
					<TR><td>Product ID</td><td>
						<select name=pid onchange=getValues(this);>
							<option value="" project_name="" platform="" duration="" enddate="">Select Project id</option>
								<%
									try {
									Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                                        String myDb = "jdbc:derby://localhost:1527/rms";
                                                                        con = DriverManager.getConnection(myDb);
                                                                        st=con.createStatement();
									String cmd="Select * from projectdet pd "; 
									// where pd.pid not in ( Select pm.pid from projectmod pm )";
								    rs=st.executeQuery(cmd);
									while(rs.next()) 
									{
										String pid=rs.getString("pid");
										String project_name=rs.getString("projectname");
										String platform=rs.getString("platform");
										int duration=rs.getInt("duration");
										String enddate=rs.getString("enddate");
										
										out.println("<option project_name='"+project_name+"' platform='"+platform+"' duration='"+duration+"' enddate='"+enddate+"' value='"+pid+"'>"+pid+"</option>");
									}
								   }   catch(Exception e) {
								       out.println("<option value='null'>"+e.getMessage().toString()+"</option>");
								       }
								%>
						</select>
						</td>
						<TD>Project Name</td><Td ><input name=project_name readonly></td>
					</tr>
					<tr><TD>Platform</td><Td ><input name=platform  readonly ></td>
						<TD> Duration</td><Td ><input name=duration readonly></td>
					</tr>
					<tr><TD>End Date</td><Td ><input name=enddate readonly></td>
						<td>Man Power </td><Td ><input name=manpowerreq ></td>
					</tr>
					</table>
						<tr><td align=Center>
							<table width="550" height="40" align=center cellspacing=0 border="0" cellpadding=0>
							<tr ><td>
								<fieldset id="fieldhead">
								<legend> Modules </legend><br>
								<table width="550" height="40" align=center cellspacing=0 border="0" cellpadding=0>
								<tr ><td>
									<fieldset id="fieldhead">
									<legend> Module 1 </legend><br>
										<table>
										<tr colspan=2 >
										<td valign=top align=center>Module Name </td><td valign=top><input size=15 name=module1></td>
										<TD valign=top align=center rowspan=2 >Description</td><td>
										<Textarea align=center rows=3 name=description1></Textarea></td>
										</tr>
										</table>
									</fieldset>
								</td></tr>
								<tr ><td>
									<fieldset id="fieldhead">
									<legend> Module 2 </legend><br>
										<table>
										<tr colspan=2 >
										<td valign=top align=center>Module Name </td><td valign=top><input size=15 name=module2></td>
										<TD valign=top align=center rowspan=2 >Description</td><td>
										<Textarea align=center rows=3 name=description2></Textarea></td>
										</tr>
										</table>
									</fieldset>
								</td></tr>
								<tr ><td>
									<fieldset id="fieldhead">
									<legend> Module 3 </legend><br>
										<table>
										<tr colspan=2 >
										<td valign=top align=center>Module Name </td><td valign=top><input size=15 name=module3></td>
										<TD valign=top align=center rowspan=2 >Description</td><td>
										<Textarea align=center rows=3 name=description3></Textarea></td>
										</tr>
										</table>
									</fieldset>
								</td></tr>
								<tr ><td>
									<fieldset id="fieldhead">
									<legend> Module 4 </legend><br>
										<table>
										<tr colspan=2 >
										<td valign=top align=center>Module Name </td><td valign=top><input size=15 name=module4></td>
										<TD valign=top align=center rowspan=2 >Description</td><td>
										<Textarea align=center rows=3 name=description4></Textarea></td>
										</tr>
										</table>
									</fieldset>
								</td></tr>
								<tr ><td>
									<fieldset id="fieldhead">
									<legend> Module 5 </legend><br>
										<table>
										<tr colspan=2 >
										<td valign=top align=center>Module Name </td><td valign=top><input size=15 name=module5></td>
										<TD valign=top align=center rowspan=2 >Description</td><td>
										<Textarea align=center rows=3 name=description5></Textarea></td>
										</tr>
										</table>
									</fieldset>
								</td></tr>
								</table>
								</fieldset>
							</td></tr>
							</table>
						</td></tr>
						<tr><Td colspan=2 align=center><button type=submit accesskey="P"><u>P</u>roceed</button>
							&nbsp;&nbsp;<button type=reset accesskey="R"><u>R</u>eset</button>
						</td></tr>
					</table>
				</fieldset>
			</td></tr></table>
	</td></tr>
</table><br/><br/>
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
