function validate() {
  var isValid = true;

  //call reset method so when we write something in the input the warning will go away.
  reset();

  // Validate Email if !email = true, then will execute the block. email == '' this is false. !email == true.
  var email = document.getElementById("email").value;
  if (!email) {
    isValid = false;
    document.getElementById("emptyEmail").style.display = "block";
    //instead of alert we call the block from the html
  }
  if (email && !/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(email)) {
    isValid = false;
    document.getElementById("emailNoAnnotation").style.display = "block";
  }

  var name = document.getElementById("name").value;
  if (!name) {
    isValid = false;
    document.getElementById("emptyName").style.display = "block";
  }

  var address = document.getElementById("address").value;
  if (!address) {
    isValid = false;
    document.getElementById("emptyAddress").style.display = "block";
  }

  var city = document.getElementById("city").value;
  if (!city) {
    isValid = false;
    document.getElementById("emptyCity").style.display = "block";
  }

  var state = document.getElementById("state");
  var optionSelIndex = state.options[state.selectedIndex].value;
  if (optionSelIndex == -1) {
    isValid = false;
    document.getElementById("emptySelectState").style.display = "block";
  }

  var zipcode = document.getElementById("zipcode").value;
  if (!zipcode) {
    isValid = false;
    document.getElementById("emptyZipcode").style.display = "block";
  }
  if (zipcode && !/^\d{5}(-\d{4})?$/.test(zipcode)) {
    isValid = false;
    document.getElementById("zipNot5Digits").style.display = "block";
  }

  var phone = document.getElementById("phone").value;
  if (!phone) {
    isValid = false;
    document.getElementById("emptyPhone").style.display = "block";
  }
  if (phone && !/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/.test(phone)) {
    isValid = false;
    document.getElementById("phoneNot10Digits").style.display = "block";
  }

  if (isValid) {
    var form = document.getElementsByTagName("form");
    form[0].submit();
  }
}

function reset() {
  document.getElementById("emptyEmail").style.display = "none";
  document.getElementById("emailNoAnnotation").style.display = "none";
  document.getElementById("emptyName").style.display = "none";
  document.getElementById("emptyAddress").style.display = "none";
  document.getElementById("emptyCity").style.display = "none";
  document.getElementById("emptySelectState").style.display = "none";
  document.getElementById("emptyZipcode").style.display = "none";
  document.getElementById("zipNot5Digits").style.display = "none";
  document.getElementById("emptyPhone").style.display = "none";
  document.getElementById("phoneNot10Digits").style.display = "none";
}
