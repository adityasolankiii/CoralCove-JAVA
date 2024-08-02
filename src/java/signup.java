import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.text.SimpleDateFormat;

public class signup extends HttpServlet {
    private String generateUserID() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder id = new StringBuilder();
        for (int i = 0; i < 7; i++) {
            int randIndex = (int) (Math.random() * chars.length());
            id.append(chars.charAt(randIndex));
        }
        return id.toString();
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            Connection con = null;
            PreparedStatement pst = null;

            String dbURL = "jdbc:mysql://localhost:3242/CoralCove";
            String username = "root";
            String dbPass = "";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbURL,username,dbPass);
            
            //DOB Format
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = request.getParameter("txtDob");
            long dobdate = format.parse(date).getTime();
            Date dob = new Date(dobdate);
            
            String query = "INSERT INTO USERS VALUES(?,?,?,?,?)";
            pst =con.prepareStatement(query);
            
            String userid = generateUserID();
            
            pst.setString(1, userid);
            pst.setString(2, request.getParameter("txtUName"));
            pst.setString(3, request.getParameter("txtEmail"));
            pst.setDate(4, dob);
            pst.setString(5, request.getParameter("txtCpass"));
            
            
            int result = pst.executeUpdate();
            
            if(result>0){
                HttpSession session = request.getSession();
                session.setAttribute("userid",userid);                
                response.sendRedirect("home");
            }
            
            
        } catch (SQLException sqlex) {
            System.out.println(sqlex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
