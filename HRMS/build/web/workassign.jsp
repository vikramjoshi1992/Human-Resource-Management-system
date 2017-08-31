<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*" %>
<%
    if(session.getAttribute("login")==null) response.sendRedirect("RMShome3.html?invalidsession");
    Connection con=null;
	PreparedStatement sst=null;
	Statement st=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	
 %>
 <script>
 function getValues(combo) {
 document.forms[0].project_name.value=combo.options[combo.selectedIndex].getAttribute('project_name');
 document.forms[0].platform.value=combo.options[combo.selectedIndex].getAttribute('platform');
 document.forms[0].duration.value=combo.options[combo.selectedIndex].getAttribute('duration');
 document.forms[0].enddate.value=combo.options[combo.selectedIndex].getAttribute('enddate');
 }
 function getValues2(combo) {
 document.forms[0].empname.value=combo.options[combo.selectedIndex].getAttribute('empname');
 }
 
 function getValues3(combo) {
 document.forms[0].module.value=combo.options[combo.selectedIndex].getAttribute('module');
 document.forms[0].description.value=combo.options[combo.selectedIndex].getAttribute('description');
 }
 
 onload=function() {
	 if(document.forms[0].value.options.length>1)
     document.forms[0].value.options[1].selected=true;
	 getValues(document.forms[0].value);
	 
	 if(document.forms[0].empid.options.length>1)
     document.forms[0].empid.options[1].selected=true;
	 getValues2(document.forms[0].empid);
	 
	 if(document.forms[0].module.options.length>1)
     document.forms[0].module.options[1].selected=true;
	 getValues3(document.forms[0].module);
	 }
 </script>
<html xmlns=""><head>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Work Assign</title>
</head><body>
	<table width="780" align=center cellspacing=0 border="4" cellpadding=0>
	<jsp:include page="rm_transactions.jsp" />
			<tr><td>
			<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
			<tr><td>
			<fieldset id="fieldhead">
				<legend>Work Assignment</legend><BR>
					<table align=center cellspacing=1 cellpadding=3>
					<form method=post action="workassignment.jsp">
				<tr><td>
					<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
					<TR><td>Product ID</td><td>
                                                
						<select name=pid onchange=getValues(this);>
							<option value="" project_name="" platform="" duration="" enddate="">Select Project id</option>
								<%
									try {
									Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                                        String myDb = "jdbc:derby://localhost:1527/rms";
                                                                        con = DriverManager.getConnection(myDb);
								        st=con.createStatement();
									String cmd="Select pid,projectname,platform,duration,enddate from projectdet";
									// where pd.pid in ( Select pm.pid from projectmod pm )";
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
                                                                <TD>Project Name</td>
                                                                <Td ><input name=project_name readonly></td>
					</tr>
					<tr><TD>Platform</td><Td ><input name=platform  readonly ></td>
						<TD> Duration</td><Td ><input name=duration readonly></td>
					</tr>
					<TR><TD>End Date</td><Td ><input name=enddate readonly></td>
					<td>Module Name</td><td>
                                            
						<select name=module onchange=getValues3(this);>
							<option value="" module="" description="">Select Module</option>
								<%
									try {
									Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                                        String myDb = "jdbc:derby://localhost:1527/rms";
                                                                        con = DriverManager.getConnection(myDb);
								        st=con.createStatement();
                                                                        
									//String id=request.getParameter("pid");
                                                                        
									String cmd1="Select module1,description1,module2,description2,module3,description3,module4,description4,module5,description5 from projectmodules where pid='p9'";
									
								    rs3=st.executeQuery(cmd1);
									
									if(rs3.next()) 
									{
										
										String module1=rs3.getString("module1");
										String description1=rs3.getString("description1");
										String module2=rs3.getString("module2");
										String description2=rs3.getString("description2");
										String module3=rs3.getString("module3");
										String description3=rs3.getString("description3");
										String module4=rs3.getString("module4");
										String description4=rs3.getString("description4");
										String module5=rs3.getString("module5");
										String description5=rs3.getString("description5");
                                                                                
									out.println("<option  module='"+module1+"' description='"+description1+"' value='"+module1+"'>'"+module1+"'</option>");
									out.println("<option  module='"+module2+"' description='"+description2+"' value='"+module2+"'>'"+module2+"'</option>");
									out.println("<option  module='"+module3+"' description='"+description3+"' value='"+module3+"'>'"+module3+"'</option>");
									out.println("<option  module='"+module4+"' description='"+description4+"' value='"+module4+"'>'"+module4+"'</option>");
									out.println("<option  module='"+module5+"' description='"+description5+"' value='"+module5+"'>'"+module5+"'</option>");
									}
									
								   }   catch(Exception e) {
								       out.println("<option value='null'>"+e.getMessage().toString()+"</option>");
								       }
								%>
						</select>
						</td>
					
					</tr>
					<tr>
					<TD  valign=top align=center rowspan=2 >Description</td>
					<td><Textarea valign=top readonly cols=18  rows=7 name=description></Textarea></td>
					<td colspan=2>Employee ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <select align=center name=emp onchange=getValues2(this);>
					<option value="" empid="">Select Employee</option>
								<%
									try {
									Class.forName("org.apache.derby.jdbc.ClientDriver");
                                                                        String myDb = "jdbc:derby://localhost:1527/rms";
                                                                        con = DriverManager.getConnection(myDb);
                                                                        st=con.createStatement();
									String cmd2="Select empid,empname from employee";
									rs2=st.executeQuery(cmd2);
									
									while(rs2.next()) 
									{
										String empid=rs2.getString("empid");
										String empname=rs2.getString("empname");
										
										out.println("<option value='"+empid+"' empname='"+empname+"'>"+empid+"</option>");
									}
									
								   }   catch(Exception e) {
								       out.println("<option val='null'>"+e.getMessage().toString()+"</option>");
								       }
								%>
						</select><br><br>
						Employee Name <input size=15 name=empname readonly><br><br>
						Submit Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<select name="dd">
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
					      <option value="2008">2008</option>
					      <option value="2009">2009</option>
					      <option value="2010">2010</option>
					      <option value="2011">2011</option>
					      <option value="2012">2012</option>
					      <option value="2013">2013</option>
					      <option value="2014">2014</option>
					      <option value="2015">2015</option>
					    </select>
						</td></tr>
						</td>
						</tr>
					</table>
					</td></tr>
					<tr><Td colspan=2 align=center><button type=submit accesskey="A"><u>A</u>ssign Task</button>
							&nbsp;&nbsp;<button type=reset accesskey="R"><u>R</u>eset</button>
					</td></tr>
					</table>
					</form>
					</td></tr>
					</table>
				</fieldset>
			</td></tr></table>
	</td></tr>
</table>
</body></html>
