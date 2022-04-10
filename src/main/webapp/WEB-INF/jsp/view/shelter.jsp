<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shelter</title>
    <link rel="stylesheet" href="../../../pub/style/shelter.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="hf">
        <nav class="container-lg navbar navbar-expand-lg navbar-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="/home">Happy Pet Adoption</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="/home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/view/shelter">Shelter</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/view/animal">Animal</a>
                        </li>
                    </ul>
                    <span class="navbar-text">
                        <small>
                            <i class="fa-solid fa-circle-user fa-lg "></i> &nbsp
                            <a href="/user/login" class="login link-primary"> Login</a> /
                            <a href="/user/register" class="link-primary">Register</a>
                        </small>
                    </span>
                </div>
            </div>
        </nav>
    </div>

    <div class="main-content bg-light">
        <div class="container-lg album py-5 ">
            <div class="row">
                <div class="col-8"></div>
                <div class="col-4">
                    <div class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                            id="shelterSearchBox">
                        <button class="btn btn-outline-success" onclick="searchShelters()">Search</button>
                    </div>
                </div>
            </div>

            <table class="table" id="shelterTable">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Shelter</th>
                        <th scope="col">Link</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Loading</td>
                        <td>Loading</td>
                        <td>Loading</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="../include/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

    <script>
        var shelterData = [{
            "id": "1",
            "name": "Otto Shelter",
            "link": ""
        },
        {
            "id": "2",
            "name": "Thornton Mercy Shelter",
            "link": ""
        },
        {
            "id": "3",
            "name": "Pet and Vet",
            "link": ""
        },
        {
            "id": "4",
            "name": "Animal Savior",
            "link": ""
        },
        {
            "id": "5",
            "name": "Stacys Vet Care",
            "link": ""
        },
        {
            "id": "6",
            "name": "Paterson Hope Home",
            "link": ""
        },
        {
            "id": "7",
            "name": "Shelter to Home",
            "link": ""
        },
        {
            "id": "8",
            "name": "Kwik Out Animals",
            "link": ""
        },
        {
            "id": "9",
            "name": "Lords Animals",
            "link": ""
        },
        {
            "id": "10",
            "name": "Yangyangs Cool Cat Center",
            "link": ""
        }];

        function loadShelterData(searchTerm, notFoundCallback) {
            var tableTbodyInnerHTML = "";

            shelterData.forEach(value => {
                //The search() method returns -1 if no match is found, != -1 name in the array list, return id, name and link
                if (searchTerm === undefined || value.name.search(searchTerm) != -1) {
                    tableTbodyInnerHTML += "<tr><th scope='row'>" + value.id + "</th><td>" + value.name + "</td><td><a href='#'>link" + value.link
                }
            });
            //get the first row of the result
            document.getElementById('shelterTable').getElementsByTagName('tbody')[0].innerHTML = tableTbodyInnerHTML;

            //if table innerhtml is empty, then we will pass the loading to notfoundcallback and call the nohospiatlfoundcallback function.
            if (tableTbodyInnerHTML === "") {
                notFoundCallback();
            }
        }

        //give searchbox value to searchterm, pass the searchterm to loadShelter parameter. when we click on the search button this function get called.
        function searchShelters() {
            var searchTerm = document.getElementById('shelterSearchBox').value;
            loadShelterData(searchTerm, noShelterFoundCallback);
        }

        function noShelterFoundCallback() {
            alert("No shelters found.");
        }

        //when we road the page this function get called
        loadShelterData("", noShelterFoundCallback);
        //A callback is a function passed as an argument to another function.
    </script>

</body>

</html>