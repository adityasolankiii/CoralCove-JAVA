<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Coral Cove Resort: Where Waves Meet Wonder</title>
    <%@ include file="Includes/links.jsp" %>
</head>
<body>
<div class="form-container">
    <div class="box form-box">
        <div class="my-5 px-4">
            <h3 class="fw-bold h-font text-center">Welcome to Paradise!</h3>
            <div class="h-line bg-dark col-8"></div>
        </div>

        <header>Please Log In to Continue Your Journey at Coral Cove.</header>
        
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) {
                out.println("<div class='alert alert-danger alert-dismissible fade show' role='alert'>");
                out.println("<strong>" + error + "</strong>");
                out.println("<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>");
                out.println("</div>");
            }
        %>
        
        <form action="login" method="post" class="floating needs-validation" novalidate>
            <label for="email" class="form-label">Email</label>
            <input type="text" name="txtEmail" id="email" autocomplete="off" class="form-control" required>

            <label for="password" class="form-label">Password</label>
            <input type="password" name="txtPass" id="password" autocomplete="off" class="form-control" required>

            <button class="btn btn-dark mt-4 mb-2" name="btnSubmit">Login</button>

            <div class="links">
                Don't have an account? <a href="register.html">Sign Up Now</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>