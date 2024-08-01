import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

public class rooms extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
        }
    }

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
                    room.put("price", rs.getInt("price"));
                    room.put("roomid", rs.getString("roomid"));
                    room.put("category", rs.getString("category").replaceAll("([a-z])([A-Z])", "$1 $2"));
                    room.put("roomname", rs.getString("roomname").replaceAll("([a-z])([A-Z])", "$1 $2"));
                    room.put("image", rs.getString("image"));
                    room.put("features", rs.getString("features"));
                    room.put("facilities", rs.getString("facilities"));
                    room.put("capacity", rs.getString("capacity"));
                    room.put("rating", rs.getInt("rating"));
                    rooms.add(room);
                }
                request.setAttribute("rooms", rooms);
                RequestDispatcher rd = request.getRequestDispatcher("rooms.jsp");
                rd.forward(request, response);

            } catch (SQLException sqlex) {
                System.out.println(sqlex.getMessage());
            }
            catch (Exception e){
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
