import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class home extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                String dbURL = "jdbc:mysql://localhost:3242/CoralCove";
                String username = "root";
                String dbpass = "";
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(dbURL, username, dbpass);

                String query = "SELECT * FROM rooms";
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();

                List<Map<String, Object>> rooms = new ArrayList<>();
                while (rs.next()) {
                    Map<String, Object> room = new HashMap<>();
                    room.put("roomid", rs.getString("roomid"));
                    room.put("roomname", rs.getString("roomname"));
                    room.put("price", rs.getInt("price"));
                    room.put("category", rs.getString("category"));
                    room.put("capacity", rs.getString("capacity"));
                    room.put("rating", rs.getInt("rating"));
                    room.put("image", rs.getString("image"));
                    rooms.add(room);
                }

                Collections.shuffle(rooms); // Shuffle the list

                request.setAttribute("rooms", rooms.subList(0, 3));
                RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
