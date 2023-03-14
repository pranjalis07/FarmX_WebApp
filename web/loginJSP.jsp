<%-- 
    Document   : loginJSP
    Created on : 1 Dec, 2022, 9:35:06 AM
    Author     : sidharth
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
     <%-- <link rel="stylesheet" href="MainCss.css"> --%>
     <style>
         @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500&display=swap');

body {
	font-family: Montserrat,Arial, Helvetica, sans-serif;
	background-color:#f7f7f7;
}
* {box-sizing: border-box}

/* Add padding to container elements */
.container {
    padding: 20px;
      width:500px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
      border:1px solid #ccc;
      border-radius:10px;
      background:background;
  -webkit-box-shadow: 2px 1px 21px -9px rgba(0,0,0,0.38);
  -moz-box-shadow: 2px 1px 21px -9px rgba(0,0,0,0.38);
  box-shadow: 2px 1px 21px -9px rgba(0,0,0,0.38);
  }
  
  /* Set a style for all buttons */
button {
  background-color: #FF2572;;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
	font-size:16px;
	font-family: Montserrat,Arial, Helvetica, sans-serif;
	border-radius:10px;
}

button:hover {
  opacity:1;
}

.icon-bar {
  width: 100%; /* Full-width */
  background-color: #FF2572; /* Dark-grey background */
  overflow: auto; /* Overflow due to float */
}

.icon-bar a {
  float: left; /* Float links side by side */
  text-align: center; /* Center-align text */
  width: 20%; /* Equal width (5 icons with 20% width each = 100%) */
  padding: 12px 0; /* Some top and bottom padding */
  transition: all 0.3s ease; /* Add transition for hover effects */
  color: white; /* White text color */
  font-size: 36px; /* Increased font size */
}

.icon-bar a:hover {
  background-color: purple; /* Add a hover color */
}

/*.active {
  background-color: purple;} /* Add an active/current color */


     </style>
    </head>
    <body style="background-color:white;">
        
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
                    if("farmer".equals(getRole)){
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
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="icon-bar">
  <a href="login.html"><i class="fa fa-home"></i></a>
  <a href=""><i class="fa fa-search"></i></a>
  <a href="#"><i class="fa fa-envelope"></i></a>
  <a href="govSchemes.jsp"><i class="fa fa-globe"></i></a>
  <a href="#"><i class="fa fa-trash"></i></a>
</div>
   
        <div class =" container">
        <h2> Welcome: ${param.uname}</h2>
         <div class="clearfix">
      
           
        <a href ="govSchemes.jsp"> <button type="submit" class="btn"> Government Agricultural Schemes</button></a>
         <a href ="farmerProfile.jsp"> <button type="submit" class="btn">Show Profile Details</button></a>
         </div>
        </div>
        
    </body>
</html>
