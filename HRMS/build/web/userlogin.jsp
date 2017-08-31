
<%@page import="java.sql.*"%>
<%! String userid,password;
Connection con;
Statement st;
ResultSet rs;
%>

<%
	try
		{
			userid=request.getParameter("userid");
			password=request.getParameter("password");
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        String myDb = "jdbc:derby://localhost:1527/rms";
                        Connection DBconn = DriverManager.getConnection(myDb);
                        Statement st=DBconn.createStatement();
                        
			String cmd="Select * from employee where empid='"+userid+"' and pword='"+password+"'";
			rs=st.executeQuery(cmd);
                        session.setAttribute("login",userid);
			if(rs.next())
			{
				%>
										<jsp:forward page="<%=rs.getString("url") %>"/>;						
				<%
				
	        }
			 
	    		 
			else 
				out.println("<body bgcolor=gray><p><font face=tahoma color=maroon>No Such user Exist .<BR><BR>Please Check Your ID and Password u supplied is Correct or Not</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
				 
				
		}
		
	 catch(Exception e)
	    {
			out.println("<link rel=stylesheet href='css/styles.css'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
		}

%>