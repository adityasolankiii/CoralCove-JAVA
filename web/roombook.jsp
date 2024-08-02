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
        <form method="post" action="roombook" novalidate class="needs-validation booking-form">
            <input type="hidden" name="roomid" value="${roomid}">
            <input type="hidden" name="price" value="${price}">
            <div class="row mt-3">
                <div class="col-8 offset-2">
                    <div class="mb-3 position-relative">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" id="name" name="txtName" placeholder="Enter your name" class="form-control" required/>
                        <div class="valid-feedback">Looks Good!</div>
                        <div class="invalid-tooltip">
                            Please Enter Valid Name
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-md-6 position-relative">
                            <label for="aadhar" class="form-label">Aadhar Number</label>
                            <input type="number" id="aadhar" name="txtAadhar" placeholder="Aadhar number (12 digits)" class="form-control" required maxlength="12"/>
                            <div class="valid-feedback">Looks Good!</div>
                            <div class="invalid-tooltip">
                                Please Enter Valid Aadhar Number
                            </div>
                        </div>

                        <div class="mb-3 col-md-6 position-relative">
                            <label for="mobile" class="form-label">Mobile Number</label>
                            <input type="number" id="mobile" name="txtMobile" placeholder="+91 xxxx xxx xxx" class="form-control" required maxlength="10"/>
                            <div class="valid-feedback">Looks Good!</div>
                            <div class="invalid-tooltip">
                                Please Enter Valid Mobile Number
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="mb-3 col-md-6 position-relative">
                            <label for="checkin" class="form-label">Check-IN Date</label>
                            <input type="date" id="checkin" name="checkin" class="form-control" required />
                            <div class="valid-feedback">Looks Good!</div>
                            <div class="invalid-tooltip">
                                Please Select Check-IN Date
                            </div>
                        </div>

                        <div class="mb-3 col-md-6 position-relative">
                            <label for="checkout" class="form-label">Check-OUT Date</label>
                            <input type="date" id="checkout" name="checkout" class="form-control" required />
                            <div class="invalid-tooltip">
                                Please Select Check-OUT Date
                            </div>
                            <div class="valid-feedback">Looks Good!</div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="mb-3 col-md-3">                            
                            <label for="adult" class="form-label">Adults</label>
                            <div class="input-group" style="width: 120px;">
                                <button class="btn border" type="button" id="decAdult">-</button>
                                <input type="number" id="adult" name="txtAdult" class="form-control" value="1" readonly>
                                <button class="btn border" type="button" id="incAdult">+</button>
                            </div>
                            <div class="valid-feedback">Looks Good!</div>
                        </div>

                        <div class="mb-3 col-md-3">                            
                            <label for="child" class="form-label">Children</label>
                            <div class="input-group" style="width: 120px;">
                                <button class="btn border" type="button" id="decChild">-</button>
                                <input type="number" id="children" name="txtChild" class="form-control" value="0" readonly>
                                <button class="btn border" type="button" id="incChild">+</button>
                            </div>
                            <div class="valid-feedback">Looks Good!</div>
                        </div>
                        <div class="mb-3 col-md-6">
                            <p>Total Price</p>
                            <b>&#8377;<span id="totalPrice">0</span></b>
                        </div>
                    </div>


                    <button class="btn btn-dark add-btn mt-3 mb-4" name="btnBook">Confirm Booking</button>
                    <a href="rooms" class="btn btn-outline-secondary rounded-2 mt-3 mb-4">Go Back</a>
                </div>
            </div>
        </form>
        <script src="./Includes/script.js"></script>
        <script>

            document.addEventListener("DOMContentLoaded", function () {
                let checkin = document.getElementById("checkin");
                let checkout = document.getElementById("checkout");
                let totalPriceElement = document.getElementById("totalPrice");

                checkin.addEventListener("change", updateTotalPrice);
                checkoutInput.addEventListener("change", updateTotalPrice);

                function updateTotalPrice() {
                    let checkinDate = new Date(checkin.value);
                    let checkoutDate = new Date(checkout.value);

                    if (isNaN(checkinDate.getTime()) || isNaN(checkoutDate.getTime())) {
                        return;
                    }

                    if (checkinDate >= checkoutDate) {
                        return;
                    }

                    let timeDiff = Math.abs(checkoutDate.getTime() - checkinDate.getTime());
                    let diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                    var price = <c:out value='${pricePerNight}' />;
                    let totalPrice = diffDays * price;

                    totalPriceElement.textContent = totalPrice.toLocaleString("en-IN");
                }
            }
            </script>
            <%@ include file="Includes/footer.jsp" %>
        </body>
    </html>
