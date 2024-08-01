<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coral Cove Resort: All Bookings</title>
        <%@ include file="Includes/links.jsp" %>
    </head>
    <body>
        <%@ include file="Includes/navbar.jsp" %>

        <div class="mt-5 mb-3 px-4">
            <h2 class="fw-bold h-font text-center">All Bookings</h2>
            <div class="h-line bg-dark col-1"></div> 
        </div>

        <c:if test="${not empty error}">
            <div class="alert alert-danger fade show col-lg-5 align-self-center" role="alert">
                <p>${error}</p>
            </div>
        </c:if>

        <c:if test="${not empty msg}">            
            <p>${msg}</p>
        </c:if>

        <div class="container">
            <div class="row row-cols-lg-3 row-cols-md-2 row-cols-sm-1 row-cols-1 mt-3">
                <c:forEach var="booking" items="${bookings}">
                    <div class="card col mx-3 my-2" style="width: 24rem">
                        <div class="card-header">
                            Booking ID: ${booking.bookingid}
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Guest Name: ${booking.cname}</li>
                            <li class="list-group-item">Total Guests: ${booking.adult + booking.children} (Adults: ${booking.adult}, Children: ${booking.children})</li>
                            <li class="list-group-item">Check-in: ${booking.checkin}</li>
                            <li class="list-group-item">Check-out: ${booking.checkout}</li>
                            <li class="list-group-item">Aadhar ID: ${booking.aadhar}</li>
                            <li class="list-group-item">Mobile: ${booking.mobile}</li>
                            <li class="list-group-item">Room Name: ${booking.roomname}</li>
                            <li class="list-group-item">Total Amount: &#8377;${booking.total}</li>
                        </ul>
                        <div class="card-footer bg-white">
                            <form method="post">
                                <button class="btn btn-dark shadow-none col-6" type="button" data-bs-toggle="modal" data-bs-target="#cancelModal">Cancel Booking</button>
        <!--                            <a class="btn btn-dark shadow-none col-10" href="edit.jsp?bookingid=${booking.bookingid}">Update Details</a>-->
                                <input type="hidden" name="bookingid" value="${booking.bookingid}">
                            </form>
                        </div>
                    </div>

                    <!-- Confirmation Popup -->
                    <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">
                                        Sailing Plans Changed? <br> We’ve Got You Covered.
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h4>Cancellation Policy</h4>
                                    <ul>
                                        <li>Cancel up to 48 hours before your check-in date for a full refund.</li>
                                        <li>For cancellations within 48 hours of arrival, a nominal fee applies.</li>
                                        <li>Receive immediate email confirmation upon successful cancellation.</li>
                                    </ul>
                                </div>
                                <div class="modal-footer">
                                    <form method="post" action="allbookings">
                                        <input type="hidden" name="bookingid" value="${booking.bookingid}">
                                        <button type="submit" class="btn btn-dark" name="btnConfirm">Confirm</button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <%@ include file="Includes/footer.jsp" %>
    </body>
</html>
