/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(urlPatterns = {"/registerContracter"})
public class registerContracter extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
      
        String username=request.getParameter("username");
        String pass=request.getParameter("password");
        String repass=request.getParameter("repassword");   
        
            String companyName=request.getParameter("name");
            String email=request.getParameter("email");
            
            String phone=request.getParameter("phone");
            String location=request.getParameter("location");
            String requirements=request.getParameter("require");
            //String address=request.getParameter("house")+" "+request.getParameter("street");
            String quantity=request.getParameter("quantity");
            //String pincode=request.getParameter("pincode");
            
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
            Statement stmt=con.createStatement();
            
            
            stmt.executeUpdate("insert into contracterLogin values('"+companyName+"','"+email+"','"+phone+"','contracter', '"+requirements+"', '"+quantity+"', '"+username+"','"+pass+"')");
            
            response.sendRedirect("login.html");
            
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
          
        }
    }

   
 
    