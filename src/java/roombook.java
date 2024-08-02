
import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

public class roombook extends HttpServlet {

    public static String dbURL = "jdbc:mysql://localhost:3242/CoralCove";
    public static String username = "root";
    public static String dbpass = "";
    public static PreparedStatement pst = null;
    public static ResultSet rs = null;
    public static Connection con = null;
    public static String query = "";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(dbURL, username, dbpass);

                query = "SELECT price FROM rooms WHERE roomid=?";
                pst = con.prepareStatement(query);
                pst.setString(1, request.getParameter("roomid"));
                rs = pst.executeQuery();

                if (rs.next() && request.getParameter("roomid") != null) {
                    request.setAttribute("price", rs.getInt("price"));
                    request.setAttribute("roomid", request.getParameter("roomid"));
                    RequestDispatcher rd = request.getRequestDispatcher("roombook.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("rooms");
                }
            } catch (SQLException sqlex) {
                System.out.println(sqlex.getMessage());
                request.setAttribute("error", "Something went wrong");
                RequestDispatcher rd = request.getRequestDispatcher("roombook.jsp");
                rd.forward(request, response);
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
                request.setAttribute("error", "Something went wrong");
                RequestDispatcher rd = request.getRequestDispatcher("roombook.jsp");
                rd.forward(request, response);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(dbURL, username, dbpass);
            String bookingid = BookingID();
            String userid = (String) session.getAttribute("userid");
            String cname = request.getParameter("txtName");
            double aadhar = Double.parseDouble(request.getParameter("txtAadhar"));
            double mobile = Double.parseDouble(request.getParameter("txtMobile"));
            int adults = Integer.parseInt(request.getParameter("txtAdult"));
            int children = Integer.parseInt(request.getParameter("txtChild"));

            int price = Integer.parseInt(request.getParameter("price"));

            String roomid = request.getParameter("roomid");

            // Code for Check-in and Check-out Dates
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            String chkin = request.getParameter("checkin");
            long check_in = format.parse(chkin).getTime();
            Date checkin = new Date(check_in);

            String chkout = request.getParameter("checkout");
            long check_out = format.parse(chkout).getTime();
            Date checkout = new Date(check_out);

            int dayDiff = (int) TimeUnit.DAYS.convert((check_out - check_in), TimeUnit.MILLISECONDS);

            int total = dayDiff * price;

            query = "INSERT INTO room_book (userid, bookingid, cname, aadhar, mobile, adult, children, roomid, checkin, checkout, total) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pst = con.prepareStatement(query);

            pst.setString(1, userid);
            pst.setString(2, bookingid);
            pst.setString(3, cname);
            pst.setDouble(4, aadhar);
            pst.setDouble(5, mobile);
            pst.setInt(6, adults);
            pst.setInt(7, children);
            pst.setString(8, roomid);
            pst.setDate(9, checkin);
            pst.setDate(10, checkout);
            pst.setInt(11, total);

            int result = pst.executeUpdate();

            if (result > 0) {
                String msg = "<div class='alert alert-success alert-dismissible fade show col-lg-5 align-self-center' role='alert'>"
                        + "<strong>Booking Confirmed! : </strong>You’ve just unlocked a slice of paradise"
                        + "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>"
                        + "</div>";
                session.setAttribute("msg", msg);
                response.sendRedirect("allbookings");
            }

        } catch (SQLException ex) {
            out.println(ex);
        } catch (Exception e) {
            out.println(e);
        }
    }

    public static String BookingID() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder id = new StringBuilder();

        for (int i = 0; i < 10; i++) {
            int randIndex = (int) (Math.random() * chars.length());
            id.append(chars.charAt(randIndex));
        }

        return id.toString();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
