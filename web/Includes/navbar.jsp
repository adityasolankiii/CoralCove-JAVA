
<nav class="navbar navbar-expand-md bg-body-light border-bottom sticky-top">
    <div class="nav-info container-fluid">

        <a class="navbar-brand" href="home"><span class="fs-2 me-2" style="color: #fe424d;"><i class="fa-solid fa-umbrella-beach"></i></span><strong>Coral Cove Resort</strong></a>
        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarNavAltMarkup"
            >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ml-2" id="navbarNavAltMarkup">
            <ul class="navbar-nav mt-2 me-auto">          
                <a class="nav-link" href="rooms">Rooms</a>
                <a class="nav-link" href="#">Facilities</a>
                <a class="nav-link me-2" href="#">Contact Us</a>
                <a class="nav-link me-2" href="#">About</a>
            </ul>
            <div class="d-flex">
                <% if (session.getAttribute("userid") != null) {%>
                <a  class="nav-link mt-1" href="allbookings"> <button class="btn btn-dark">All Bookings</button></a>
                <a class="nav-link mt-1 btn btn-dark px-2 mx-2" href="logout"><button class="btn btn-dark">Logout</button></a>
                <%} else {%>
                    <a class="nav-link mt-1 btn btn-dark" href="login"><button class="btn btn-dark">Login</button></a>
                    <a class="nav-link mt-1 btn btn-dark mx-2" href="signup"><button class="btn btn-dark">Sign up</button></a>
                <%}%>

            </div>
        </div>    
    </div>
</nav>