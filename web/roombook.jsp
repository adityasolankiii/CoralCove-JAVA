<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.security.SecureRandom"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Coral Cove Resort: Where Waves Meet Wonder</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="Includes/links.jsp" %>
    </head>
    <body>
        <%@ include file="Includes/navbar.jsp" %>

        <form method="post" action="roombook">
             <input type="hidden" name="roomid" value="${roomid}">
            <div class="row mt-3">
                <div class="col-8 offset-2">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input
                            type="text"
                            id="name"
                            name="txtName"
                            placeholder="Enter your name"
                            class="form-control"
                            required
                            />
                    </div>
                    <div class="row">
                        <div class="mb-3 col-md-6">
                            <label for="aadhar" class="form-label">Aadhar Number</label>
                            <input
                                type="number"
                                id="aadhar"
                                name="txtAadhar"
                                placeholder="Aadhar number (12 digits)"
                                class="form-control"
                                required
                                />
                        </div>

                        <div class="mb-3 col-md-6">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <input
                                type="number"
                                id="mobile"
                                name="txtMobile"
                                placeholder="+91 xxxx xxx xxx"
                                class="form-control"
                                required
                                />
                        </div>
                    </div>

                    <div class="row">
                        <div class="mb-3 col-md-6">
                            <label for="adult" class="form-label">Adults</label>
                            <input
                                type="number"
                                id="adult"
                                name="txtAdult"
                                placeholder="Enter number of Adults"
                                class="form-control"
                                required
                                />
                        </div>

                        <div class="mb-3 col-md-6">
                            <label for="child" class="form-label">Children</label>
                            <input
                                type="number"
                                id="child"
                                name="txtChild"
                                placeholder="Enter number of Children"
                                class="form-control"
                                />
                        </div>
                    </div>

                    <div class="row">
                        <div class="mb-3 col-md-6">
                            <label for="checkin" class="form-label">Check-IN Date</label>
                            <input
                                type="date"
                                id="checkin"
                                name="checkin"
                                class="form-control"
                                required
                                />
                        </div>

                        <div class="mb-3 col-md-6">
                            <label for="checkout" class="form-label">Check-OUT Date</label>
                            <input
                                type="date"
                                id="checkout"
                                name="checkout"
                                class="form-control"
                                />
                        </div>
                    </div>
                    <button class="btn btn-dark add-btn mt-3 mb-4" name="btnBook">Confirm Booking</button>
                    <a href="rooms" class="btn btn-outline-secondary rounded-2 mt-3 mb-4">Go Back</a>
                </div>
            </div>
        </form>
        <%@ include file="Includes/footer.jsp" %>
    </body>
</html>
