

function validate() {
    var isValid = true;

    reset();

    var username = document.getElementById("username").value;
    if (!username) {
      isValid = false;
      document.getElementById("emptyUsername").style.display = "block";
      //instead of alert we call the block from the html
    }
    if (username && !/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(username)) {
      isValid = false;
      document.getElementById("usernameNoAnnotation").style.display = "block";
    }
  
    var password = document.getElementById("password").value;
    if (!password) {
      isValid = false;
      document.getElementById("emptyPassword").style.display = "block";
    }
    if (password && !/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/.test(password)) {
      isValid = false;
      document.getElementById("passwordTooLong").style.display = "block";
    }

    if (isValid) {
        window.location.href = "home.html";
      }
};

function reset() {
    document.getElementById("emptyUsername").style.display = "none";
    document.getElementById("emptyPassword").style.display = "none";
    document.getElementById("usernameNoAnnotation").style.display = "none";
    document.getElementById("passwordTooLong").style.display = "none";
}