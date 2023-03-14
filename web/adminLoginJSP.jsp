<%-- 
    Document   : adminLoginJSP
    Created on : 25 Feb, 2023, 10:03:50 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String uname=request.getParameter("uname");
            String pass=request.getParameter("password");
            
            session.putValue("user", uname);
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
            Statement stmt=con.createStatement();
            
            ResultSet rs=stmt.executeQuery("select username,password,role from logins where username='"+uname+"'");
            String getUname="",getPass="",getRole="";
            while(rs.next())
            {
                getUname=rs.getString(1);
                getPass=rs.getString(2);
                getRole=rs.getString(3);
            }
            if(getUname.equals("")){
                out.println("<h1>Incorrect Username</h1>");
            }
            else{
                if(getPass.equals(pass))
                {
                    if("admin".equals(getRole)){
                        %><script>alert("Login Successfull")</script><%
//                        response.sendRedirect("dashboard.html");
                    }
                    else{
                        %><script>alert("Login Successfull")</script><%
//                        response.sendRedirect("customerDashboard.html");
                    }
                }
                else{
                    out.println("<h1>Incorrect Password</h1>");
                }
            }
        %>
    </body>
</html>
