import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("txtEmail");
        String password = request.getParameter("txtPass");
        
        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            request.setAttribute("error", "Email or Password cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String dbURL = "jdbc:mysql://localhost:3242/CoralCove";
            String dbUsername = "root";
            String dbPassword = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);
            
            String query = "SELECT * FROM users WHERE email=? AND pass=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password); // Ensure password is hashed in real applications
            rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
//                session.setAttribute("email", rs.getString("email"));
//                session.setAttribute("username", rs.getString("username"));
//                session.setAttribute("dob", rs.getString("dob"));
                session.setAttribute("userid", rs.getString("userid"));
                
                response.sendRedirect("home");
            } else {
                request.setAttribute("error", "Incorrect Login Credentials.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error occurred. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            try {
                rs.close();
                pst.close();
                con.close();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
