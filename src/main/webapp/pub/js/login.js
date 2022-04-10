

function validate() {
    var isValid = true;

    reset();

    var email = document.getElementById("email").value;
    if (!email) {
      isValid = false;
      document.getElementById("emptyEmail").style.display = "block";
      //instead of alert we call the block from the html
    }
  
    var password = document.getElementById("password").value;
    if (!password) {
      isValid = false;
      document.getElementById("emptyPassword").style.display = "block";
    }

    if (isValid) {
        var form = document.getElementsByTagName("form");
        form[0].submit();
    }
};

function reset() {
    document.getElementById("emptyEmail").style.display = "none";
    document.getElementById("emptyPassword").style.display = "none";
}