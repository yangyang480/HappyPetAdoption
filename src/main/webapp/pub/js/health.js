// https://stackoverflow.com/questions/41621024/xmlhttp-request-error-failed
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
        document.getElementById("healthStatus").innerHTML = this.responseText;
    }
    else {
        document.getElementById("healthStatus").innerHTML = "Unhealthy";
    }
};
xhttp.open("GET", "/api/health", true);
xhttp.send();