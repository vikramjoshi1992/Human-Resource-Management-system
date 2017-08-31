package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class userlogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 String userid,password;
Connection con;
Statement st;
ResultSet rs;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	try
		{
			userid=request.getParameter("userid");
			password=request.getParameter("password");

                        out.println("1");
                        
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        out.println("2");
                        String myDb = "jdbc:derby://localhost:1527/rms";
                        out.println("3");
                        Connection DBconn = DriverManager.getConnection(myDb);
                        out.println("4"+DBconn);
                        Statement st=DBconn.createStatement();
                        out.println("5"+st);
                        
			String cmd="Select * from employee where empid='"+userid+"' and empname='"+password+"'";
                        out.println("6"+cmd);
			rs=st.executeQuery(cmd);
                        out.println("7");
			if(rs.next())
			{
			
				
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t");
      if (true) {
        _jspx_page_context.forward( rs.getString("role") );
        return;
      }
      out.write(";\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t");

				
	        }
			 
	    		 
			else 
				out.println("<body bgcolor=gray><p><font face=tahoma color=maroon>No Such user Exist .<BR><BR>Please Check Your ID and Password u supplied is Correct or Not</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
				 
				
		}
		
	 catch(Exception e)
	    {
			out.println("<link rel=stylesheet href='css/styles.css'><body bgcolor=ivory><h1>Error Occured! While Processing Ur Transaction</font></h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"javascript:parent.close()\">Skip From This Page</a>");
		}


    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
