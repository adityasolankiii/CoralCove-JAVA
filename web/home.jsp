<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coral Cove Resort: Where Waves Meet Wonder</title>
        <%@ include file="Includes/links.jsp" %>
    </head>
    <body>

        <%@ include file="Includes/navbar.jsp" %>

        <!-- AUTO CHANGE IMAGE CAROUSEL -->
        <div id="myCarousel" class="carousel slide px-lg-4 mt-4" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/carousel/1.png" class="w-100 d-block img-fluid" />
                </div>
                <div class="carousel-item">
                    <img src="images/carousel/3.png" class="w-100 d-block img-fluid" />
                </div>
                <div class="carousel-item">
                    <img src="images/carousel/4.png" class="w-100 d-block img-fluid" />
                </div>
                <div class="carousel-item">
                    <img src="images/carousel/6.png" class="w-100 d-block img-fluid" />
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <!-- OUR ROOMS -->
        <div class="my-5 px-4">
            <h2 class="fw-bold h-font text-center">OUR ROOMS</h2>
            <div class="h-line bg-dark col-1"></div> 
        </div>
        <div class="container">
            <div class="row">
                <c:forEach var="room" items="${rooms}">
                    <form action="roombook" method="get" class="col-lg-4 col-md-6 my-3">
                        <input type="hidden" name="roomid" value="${room.roomid}">

                        <div class="card border-0 shadow home-card">
                            <img src="${room.image}" class="card-img-top" alt="${room.roomname}" style="max-height: 196.88px;">
                            <div class="card-body home-card-body">
                                <h5 class="card-title">${room.roomname}</h5>
                                <h6 class="mb-4">&#8377;${room.price} per night</h6>
                                <div class="Category mb-4">
                                    <h6 class="mb-1">Category</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap">${room.category}</span>
                                </div>
                                <div class="guests mb-4">
                                    <h6 class="mb-1">Guests</h6>
                                    <span class="badge rounded-pill bg-light text-dark text-wrap">${room.capacity}</span>
                                </div>
                                <div class="rating mb-4">
                                    <h6 class="mb-1">Rating</h6>
                                    <span class="badge rounded-pill bg-light">
                                        <c:forEach var="i" begin="1" end="${room.rating}">
                                            <i class="fa-solid fa-star text-warning"></i>
                                        </c:forEach>
                                    </span>
                                </div>
                                <div class="d-flex justify-content-evenly mb-2">
                                    <button class="btn btn-dark shadow-none col-4 px-1">Book Now</button>
                                    <a href="#" class="btn btn-sm btn-outline-secondary shadow-none col-5 px-1">More details</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </c:forEach>
                 <div class="col-lg-12 text-center mt-5">
                    <a href="rooms" class="btn btn-sm btn-outline-secondary rounded-2 fw-bold shadow-none">More Rooms</a>
                </div>
            </div>
        </div>

        <!-- OUR FACILITIES -->
        <h2 class="mt-5 pt-4 mb-4 text-center fw-bold h-font">OUR FACILITIES</h2>
        <div class="container">
            <div class="row justify-content-evenly px-lg-0 px-md-0 px-5">

                <div class="col-lg-2 col-md-2 text-center bg-white rounded shadow py-4 my-3">
                    <img src="images/facilities/Wifi.svg" width="80px">
                    <h5 class="mt-3">WiFi</h5>
                </div>
                <div class="col-lg-2 col-md-2 text-center bg-white rounded shadow py-4 my-3">
                    <img src="images/facilities/heater.svg" width="80px">
                    <h5 class="mt-3">Room Heater</h5>
                </div>
                <div class="col-lg-2 col-md-2 text-center bg-white rounded shadow py-4 my-3">
                    <img src="images/facilities/ac.svg" width="80px">
                    <h5 class="mt-3">Air conditioner</h5>
                </div>
                <div class="col-lg-2 col-md-2 text-center bg-white rounded shadow py-4 my-3">
                    <img src="images/facilities/geyser.svg" width="80px">
                    <h5 class="mt-3">Geyser</h5>
                </div>
                <div class="col-lg-2 col-md-2 text-center bg-white rounded shadow py-4 my-3">
                    <img src="images/facilities/spa.svg" width="80px">
                    <h5 class="mt-3">Spa</h5>
                </div>
                <div class="col-lg-12 text-center mt-5">
                    <a href="#" class="btn btn-sm btn-outline-secondary rounded-2 fw-bold shadow-none">More Facilities</a>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            var myCarouselElement = document.querySelector("#myCarousel");
            var carousel = new bootstrap.Carousel(myCarouselElement, {
                interval: 1500,
                loop: true
            });
        </script>

        <%@ include file="Includes/footer.jsp" %>

    </body>
</html>
