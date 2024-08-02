
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class loginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        HttpSession session = httpRequest.getSession(false);

        if ((session != null) && (session.getAttribute("userid") != null)) {
            chain.doFilter(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
