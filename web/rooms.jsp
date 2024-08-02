<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coral Cove Resort: Where Waves Meet Wonder</title>
        <%@ include file="Includes/links.jsp" %>
    </head>
    <body>
        <%@ include file="Includes/navbar.jsp" %>

        <div class="my-5 px-4">
            <h2 class="fw-bold h-font text-center">OUR ROOMS</h2>
            <div class="h-line bg-dark col-1"></div>
        </div>

        <div class="container room-card-container">
            <div class="row">
                <c:forEach var="room" items="${rooms}">
                    <form action="roombook" method="get" class="col-lg-4 col-md-6 my-3">
                        <input type="hidden" name="roomid" value="${room.roomid}">
                        <!--<div class="col-lg-4 col-md-6 my-3">-->
                        <div class="card border-0 shadow room-card">
                            <img src="${room.image}" class="card-img-top" alt="${room.roomname}" style="max-height: 196.88px;">
                            <div class="card-body home-card-body">
                                <h5 class="card-title">${room.roomname}</h5>
                                <h6 class="mb-4">&#8377;${room.price} per night</h6>
                                <div class="Category mb-3">
                                    <h6 class="mb-1">Category</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap">${room.category}</span>
                                </div>
                                <div class="features mb-3">
                                    <h6 class="mb-1">Features</h6>
                                    <c:forEach var="feature" items="${fn:split(room.features, ',')}">
                                        <span class="badge rounded-pill bg-light text-dark text-wrap">${feature}</span>
                                    </c:forEach>
                                </div>
                                <div class="Facilities mb-3 w-100">
                                    <h6 class="mb-1">Facilities</h6>
                                    <c:forEach var="facility" items="${fn:split(room.facilities, ',')}">
                                        <span class="badge rounded-pill bg-light text-dark text-wrap">${facility}</span>
                                    </c:forEach>
                                </div>
                                <div class="guests mb-3">
                                    <h6 class="mb-1">Guests</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap">${room.capacity}</span>
                                </div>
                                <div class="rating mb-3">
                                    <h6 class="mb-1">Rating</h6>
                                    <span class="badge rounded-pill bg-light">
                                        <c:forEach var="i" begin="1" end="${room.rating}">
                                            <i class="fa-solid fa-star text-warning"></i>
                                        </c:forEach>
                                    </span>
                                </div>
                                <div class="d-flex justify-content-evenly mb-2">
                                    <button class="btn btn-dark shadow-none col-4 px-1">Book Now</button>
                                    <!--<a href="roombook?roomid=${room.roomid}" class="btn btn-dark shadow-none col-4 px-1">Book Now</a>-->
                                    <a href="#" class="btn btn-sm btn-outline-secondary shadow-none col-5 px-1">More details</a>
                                </div>
                            </div>
                        </div>
                        <!--</div>-->
                    </form>
                    
                </c:forEach>
            </div>
        </div>

        <%@ include file="Includes/footer.jsp" %>
    </body>
</html>
