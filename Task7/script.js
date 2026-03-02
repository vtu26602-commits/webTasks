

function validateName() {
    let name = document.getElementById("name").value;
    let error = document.getElementById("nameError");

    if (name.length < 3) {
        error.textContent = "Name must be at least 3 characters";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validateEmail() {
    let email = document.getElementById("email").value;
    let error = document.getElementById("emailError");
    let pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if (!email.match(pattern)) {
        error.textContent = "Enter valid email";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function validateMessage() {
    let message = document.getElementById("message").value;
    let error = document.getElementById("messageError");

    if (message.length < 5) {
        error.textContent = "Feedback must be at least 5 characters";
        return false;
    } else {
        error.textContent = "";
        return true;
    }
}

function submitForm() {

    let result = document.getElementById("result");

    if (validateName() && validateEmail() && validateMessage()) {
        result.className = "success";
        result.textContent = "Feedback submitted successfully!";
    } else {
        result.className = "error";
        result.textContent = "Please fix errors before submitting.";
    }
}