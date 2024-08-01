
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

public class allbookings extends HttpServlet {

    public static String dbURL = "jdbc:mysql://localhost:3242/CoralCove";
    public static String username = "root";
    public static String dbpass = "";
    public static PreparedStatement pst = null;
    public static Connection con = null;
    public static String query = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
            con = DriverManager.getConnection(dbURL, username, dbpass);

            if (userid == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            query = "SELECT rb.bookingid, rb.cname, rb.aadhar, rb.mobile, rb.adult, rb.children, "
                    + "r.category, r.roomname, rb.checkin, rb.checkout, rb.total, r.image "
                    + "FROM ROOM_BOOK rb "
                    + "INNER JOIN ROOMS r ON rb.roomid = r.roomid "
                    + "WHERE rb.userid = ? "
                    + "ORDER BY rb.checkin DESC";
            pst = con.prepareStatement(query);
            pst.setString(1, userid);
            try (ResultSet rs = pst.executeQuery()) {
                List<Map<String, Object>> bookings = new ArrayList<>();
                while (rs.next()) {
                    Map<String, Object> booking = new HashMap<>();
                    booking.put("bookingid", rs.getString("bookingid"));
                    booking.put("cname", rs.getString("cname"));
                    booking.put("aadhar", rs.getString("aadhar"));
                    booking.put("mobile", rs.getString("mobile"));
                    booking.put("adult", rs.getInt("adult"));
                    booking.put("children", rs.getInt("children"));
                    booking.put("category", rs.getString("category"));
                    booking.put("roomname", rs.getString("roomname"));
                    booking.put("checkin", rs.getString("checkin"));
                    booking.put("checkout", rs.getString("checkout"));
                    booking.put("total", rs.getInt("total"));
                    booking.put("image", rs.getString("image"));
                    bookings.add(booking);
                }

                String msg = (String) session.getAttribute("msg");
                if (msg != null) {
                    request.setAttribute("msg", msg);
                    session.removeAttribute("msg"); // Remove the message after displaying it
                }

                String error = (String) session.getAttribute("error");
                if (error != null) {
                    request.setAttribute("error", error);
                    session.removeAttribute("error"); // Remove the error after displaying it
                }

                request.setAttribute("bookings", bookings);
                RequestDispatcher rd = request.getRequestDispatcher("allbookings.jsp");
                rd.forward(request, response);
            }

        } catch (SQLException sqlex) {
            System.out.println(sqlex.getMessage());
            request.setAttribute("error", "An error occurred while retrieving bookings.");
            RequestDispatcher rd = request.getRequestDispatcher("allbookings.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error occurred while retrieving bookings.");
            RequestDispatcher rd = request.getRequestDispatcher("allbookings.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            HttpSession session = request.getSession();
            String userid = (String) session.getAttribute("userid");
            String bookingid = request.getParameter("bookingid");
            query = "DELETE FROM ROOM_BOOK WHERE USERID=? AND bookingid=?";
            pst = con.prepareStatement(query);
            pst.setString(1, userid);
            pst.setString(2, bookingid);
            int result = pst.executeUpdate();
            String msg;
            if (result > 0) {
                msg = "<div class='alert alert-success alert-dismissible fade show col-lg-5 align-self-center' role='alert'>"
                        + "<strong>Seashell Shifts : </strong>Effortlessly Adjusting Your Coral Cove Itinerary"
                        + "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
                        + "</div>";
            } else {
                msg = "<div class='alert alert-danger alert-dismissible fade show col-lg-5 align-self-center' role='alert'>"
                        + "Something went wrong, Please try again later"
                        + "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
                        + "</div>";
            }

            session.setAttribute("msg", msg);
            response.sendRedirect("allbookings");
        } catch (SQLException sqlex) {
            System.out.println(sqlex.getMessage());
            request.setAttribute("error", "An error occurred while retrieving bookings.");
            response.sendRedirect("allbookings");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            request.setAttribute("error", "An error occurred while retrieving bookings.");
            response.sendRedirect("allbookings");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
