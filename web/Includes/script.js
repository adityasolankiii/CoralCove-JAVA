// Children Stepper
const childrenInput = document.getElementById('children');
const decChild = document.getElementById('decChild');
const incChild = document.getElementById('incChild');

let minChildren = 0;
let maxChildren = 2;
let currentChildren = parseInt(childrenInput.value);

decChild.addEventListener('click', function () {
    if (currentChildren > minChildren) {
        currentChildren -= 1;
        childrenInput.value = currentChildren;
    }
});

incChild.addEventListener('click', function () {
    if (currentChildren < maxChildren) {
        currentChildren += 1;
        childrenInput.value = currentChildren;
    }
});

// Adults Stepper
const adultsInput = document.getElementById('adult');
const decAdults = document.getElementById('decAdult');
const incAdults = document.getElementById('incAdult');

const minAdults = 1;
const maxAdults = 4;
let currentAdults = parseInt(adultsInput.value);

decAdults.addEventListener('click', function () {
    if (currentAdults > minAdults) {
        currentAdults -= 1;
        adultsInput.value = currentAdults;
    }
});

incAdults.addEventListener('click', function () {
    if (currentAdults < maxAdults) {
        currentAdults += 1;
        adultsInput.value = currentAdults;
    }
});


// Form Validations
const checkin = document.getElementById("checkin");
const checkout = document.getElementById("checkout");

// Get dates
const today = new Date();
const tomorrow = new Date(today);
tomorrow.setDate(today.getDate() + 1);
const todayDate = today.toISOString().split('T')[0];
const tomorrowDate = tomorrow.toISOString().split('T')[0];

// Set min for checkin and checkout dates
checkin.setAttribute("min", todayDate);
checkin.value=todayDate;
checkout.setAttribute("min", tomorrowDate);

checkin.addEventListener("change", updateDate);
checkout.addEventListener("change", updateDate);

function updateDate() {
    let checkinDate = new Date(checkin.value);
    let checkoutDate = new Date(checkout.value);
    
    const prevDay = new Date();
    const nextDay = new Date();
    nextDay.setDate(checkinDate.getDate() + 1);
    prevDay.setDate(checkoutDate.getDate() - 1);
    
    checkout.setAttribute("min", nextDay.toISOString().split('T')[0]);
    checkin.setAttribute("max", prevDay.toISOString().split('T')[0]);
}



(() => {
    "use strict";

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const form = document.querySelector(".booking-form");
    const aadhar = document.getElementById("aadhar");
    const mobile = document.getElementById("mobile");

    // Validate Aadhar number
    aadhar.addEventListener('input', function () {
        const aadharValue = aadhar.value;
        const aadharPattern = /^\d{12}$/; // 12-digit pattern
        if (!aadharPattern.test(aadharValue)) {
            aadhar.setCustomValidity("must be valid Aadhar number");
        } else {
            aadhar.setCustomValidity("");
        }
    });

    // Validate Mobile number
    mobile.addEventListener('input', function () {
        const mobileValue = mobile.value;
        const mobilePattern = /^[6-9]\d{9}$/;
        if (!mobilePattern.test(mobileValue)) {
            mobile.setCustomValidity("must be a valid Indian Mobile number");
        } else {
            mobile.setCustomValidity("");
        }
    });

    // Loop over them and prevent submission
    form.addEventListener(
            "submit",
            (event) => {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }

        form.classList.add("was-validated");
    },
            false
            );
})();