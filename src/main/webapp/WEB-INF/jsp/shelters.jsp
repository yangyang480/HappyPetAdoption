<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<jsp:include page="include/header.jsp" />
<link rel="stylesheet" href="../../pub/style/shelter.css">


    <div class="main-content bg-light">
        <div class="container-lg album py-5">
            <form class="row row-cols-lg-auto g-3 mb-3 align-items-center" action="/shelters" method="get">
                <div class="col-12">
                    <div class="input-group">
                    <div class="input-group-text">Name</div>
                        <input class="form-control me-2" type="text" name="name" placeholder="Hospital Name"
                            aria-label="Search" id="shelterSearchBox" value="${name}">
                    </div>
                </div>

                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </form>

            <c:if test="${not empty name}">
                <h5>Search Results Found ${userModelKey.size()}</h5>
                <br>
            </c:if>

            <table class="table" id="shelterTable">
                <thead>
                    <tr>
<%--                        <th scope="col">#</th>--%>
<%--                        <th scope="col">Shelter</th>--%>
<%--                        <th scope="col">Link</th>--%>
                        <th scope="col">Name</th>
                        <th scope="col">Address</th>
                        <th scope="col">Email</th>
                        <th scope="col">Phone</th>
                    </tr>

                    <c:forEach items="${userModelKey}" var="user">
                        <tr scope = "row">
                            <td>${user.name}</td>
                            <td>${user.address}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                        </tr>
                    </c:forEach>

                </thead>
<%--                <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>Loading</td>--%>
<%--                        <td>Loading</td>--%>
<%--                        <td>Loading</td>--%>
<%--                    </tr>--%>
<%--                </tbody>--%>
            </table>
        </div>
    </div>

    <jsp:include page="include/footer.jsp" />

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
