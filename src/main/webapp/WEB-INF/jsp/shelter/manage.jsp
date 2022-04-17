<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet" href="../../../pub/style/shelter/home.css">
<link rel="stylesheet" href="../../../pub/style/shelter/manage.css">

<!-- Page Content -->
<div class="page-heading products-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-content">
                    <h4>Hello, Shelter!</h4>
                    <h2>We are glad to have you</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- shelter function -->
<div class="shelter main-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="filters">
                    <ul>
                        <a href="/shelter/home" style="text-decoration: none; color: #121212"><li data-filter="*">All Animals</li></a>
                        <a href="/shelter/manage/animal" style="text-decoration: none; color: #121212"><li class="active data-filter=.des" >Manage Animals</li></a>
                        <a href="/shelter/manage" style="text-decoration: none; color: #121212"><li data-filter=".gra">Manage Adoptions</li></a>
                    </ul>
                </div>
            </div>

            <div class="wrapper">
                <div class="card">
                    <p class="sign">Create Animal</p>
                    <%--@elvariable id="manageAnimalFormBean" type=""--%>
                    <form:form class="form" action="/shelter/manage/createAnimal" modelAttribute="manageAnimalFormBean" method="post" autocomplete="off">
                        <div class="form-field" hidden="true">
                            <form:input  path="id" id="id"  class="id form-control" name="id" type="text" placeholder="Animal ID"/>
                        </div>

                        <div class="form-field">
                            <form:input path="name" id="name"  class="name form-control" name="name" type="text" placeholder="Animal Name"/>
                            <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>

                        <div class="form-row form-field d-inline-block">
                            <div class="d-flex gap-3 justify-content-center">
                                <div class="col">
                                    <form:input id="age" path="age" class="form-control" name="age"
                                                type="text" placeholder="Animal Age"/>
                                </div>

                                <div class="col">
                                    <form:input id="gender" path="gender" class="gender form-control" name="gender" type="text"
                                           placeholder="Animal Gender"/>
                                    <c:forEach items="${bindingResult.getFieldErrors('gender')}" var="error">
                                        <div class="error-message">
                                                ${error.getDefaultMessage()}
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="form-field">
                            <form:input id="weight" path="weight" class="weight form-control" name="weight" type="text"
                                        placeholder="Animal Weight"/>
                            <c:forEach items="${bindingResult.getFieldErrors('weight')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>

                        <div class="form-field">
                            <form:input id="description" path="description" class="description form-control" name="description" type="text" placeholder="Animal Description"/>
                            <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>

                        <div class="form-field">
                            <div id="speciesId" class="species d-flex justify-content-center form-control">
                                <div class="pe-2">Animal SpeciesID</div>
                                <div class="form-check pe-2 mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="1" label="Dog" id="species1" name="speciesId"/></div>
                                <div class="form-check pe-2 mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="2" label="Cat" id="species2" name="speciesId"/></div>
                                <div class="form-check mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="3" label="Rat" id="species3" name="speciesId"/></div>
                            </div>
                            <c:forEach items="${bindingResult.getFieldErrors('speciesId')}" var="error">
                            <div class="error-message">
                                    ${error.getDefaultMessage()}
                            </div>
                        </c:forEach>
                        </div>

                        <div class="form-field" hidden="true">
                            <form:input id="shelterId" path="shelterId" class="shelterId form-control" name="shelterId" type="text" placeholder="Shelter ID"/>
                        </div>

<%--                        <div class="form-field">--%>
<%--                            <div id="status" class="roles d-flex justify-content-center form-control">--%>
<%--                                <div class="pe-2">Animal Status:</div>--%>
<%--                                <div class="form-check pe-2 mb-0"><form:radiobutton path="status" class="form-check-input" value="0" label="Avaliable" id="status" name="status"/></div>--%>
<%--                                <div class="form-check mb-0"><form:radiobutton path="status" class="form-check-input" value="1" label="Unavaliable" id="status" name="status"/></div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <button class="submit btn btn-primary py-2 px-4">Create</button>
                    </form:form>


        </div>
    </div>

        </div>
    </div>

    <div class="container">
        <form class="row row-cols-lg-auto g-3 mb-3 align-items-center" action="/shelter/manage/animals" method="get">
            <div class="col-12">
                <div class="input-group">
                    <div class="input-group-text">Name</div>
                    <input class="form-control" type="text" name="name" placeholder="Animal Name"
                           aria-label="Search" id="shelterSearchBox" value="${name}">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </div>
        </form>
    </div>


    <c:if test="${not empty name}">
        <h5>Search Results Found ${animals.size()}</h5>
        <br>
    </c:if>

    <table class="table" id="shelterTable">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Age</th>
            <th scope="col">Gender</th>
            <th scope="col">Weight</th>
            <th scope="col">Description</th>
        </tr>

        <c:forEach items="${animals}" var="animal">
            <tr scope = "row">
                <td><a href="/animal/${animal.id}/details">${animal.name}</a></td>
                <td>${animal.age}</td>
                <td>${animal.gender}</td>
                <td>${animal.weight}</td>
                <td>${animal.description}</td>
            </tr>
        </c:forEach>

        </thead>
    </table>


    <%--//TODO add picture to the animal table...--%>
    <%--<h1>Create Animal</h1>--%>

    <%--<form action="/shelter/createSubmit" method="get">--%>

    <%--    Image URL: <input type="text" name="imageURL">--%>
    <%--    <br>--%>
    <%--</form>--%>
</div>








<jsp:include page="../include/footer.jsp"/>
