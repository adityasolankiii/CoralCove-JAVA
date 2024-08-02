<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Coral Cove Resort: Where Waves Meet Wonder</title>
    <%@ include file="Includes/links.jsp" %>
</head>
<body>
        <div class="form-container">
            <div class="box form-box py-2">

                <div class="px-4">
                    <h3 class="fw-bold h-font text-center">Discover Serenity by the Sea</h3>
                    <div class="h-line bg-dark col-8"></div> 
                </div>            

                <form action="signup" method="post">
                    <header>Create Your Account and Join the Coral Cove Family</header>
                    <div class="container-fluid">

                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" name="txtUName" id="username" autocomplete="off" required>

                        <label for="email" class="form-label">Email</label>
                        <input type="text" class="form-control" name="txtEmail" id="email" autocomplete="off" required>


                        <label for="age" class="form-label">Date of Birth</label>
                        <input type="date" class="form-control" name="txtDob" id="dob" autocomplete="off" required>

                        <label for="password"class="form-label">Password</label>
                        <input type="password"class="form-control" name="txtPass" id="pass" autocomplete="off" required>

                        <label for="password"class="form-label">Confirm Password</label>
                        <input type="password"class="form-control" name="txtCpass" id="cpass" autocomplete="off" required>

                        <button class="btn btn-dark mt-4 mb-2" name="btnSubmit">Register</button>

                        <div class="links">
                            Already have an account? <a href="login">Sign In</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="bootstrap-5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="app.js"></script>
    </body>
</html>