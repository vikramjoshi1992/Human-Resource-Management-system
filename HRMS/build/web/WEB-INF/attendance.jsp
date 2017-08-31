
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%

	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
        
    try{
		 Class.forName("org.apache.derby.jdbc.ClientDriver");
                 String myDb = "jdbc:derby://localhost:1527/rms";
                 con = DriverManager.getConnection(myDb);
                 st=con.createStatement();
                 String eid=request.getParameter("empid").toLowerCase();
                 String cmd="Select * from employee where empid='"+eid+"'";
		 rs=st.executeQuery(cmd);
                 //rs=st.executeQuery("alter table attendance add '"+eid+"' varchar(100)");
	         
	    if(rs.next()) 
            {
                rs=st.executeQuery("alter table attendance add '"+eid+"' varchar(100)"); 
            }
            else 
				out.println("<body bgcolor=gray><p><font face=tahoma color=maroon>No Such user Exist .<BR><BR>Please Check emp ID  u supplied is Correct or Not</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
				 
				
		
    }
    catch(Exception e)
	    {
			out.println("<link rel=stylesheet href='css/styles.css'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
		}
%>
