<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" href="../../../pub/style/shelter/home.css">

<jsp:include page="../include/shelter/header.jsp"/>

<div class="main-content bg-light">
    <div class="container-lg album py-5">
            <form class="row row-cols-lg-auto g-3 mb-3 align-items-center" action="/shelter/home"
                  method="get">
                <div class="col-12">
                    <div class="input-group">
                        <div class="input-group-text">Name</div>
                        <input class="form-control" type="text" name="name" placeholder="Animal Name"
                               aria-label="Search" id="shelterSearchBox" value="${name}">
                        <button class="btn btn-primary" type="submit">Search</button>
                    </div>
                </div>
            </form>

            <c:if test="${not empty name}">
                <h5>Search Results Found ${animals.size()}</h5>
                <br>
            </c:if>

        <%--show animals in card of current shelter--%>
        <div class="container-lg album py-5 ">
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <c:forEach items="${animals}" var="animal">
                        <div class="col">
                            <div class="card shadow-sm">
                                <c:if test="${empty animal.imgURL}">
                                    <img src="https://placedog.net/50${animal.getId()}/50${animal.getId()}?r" alt="animal image">
                                </c:if>
                                <c:if test="${not empty animal.imgURL}">
                                    <img src="${animal.imgURL}" alt="animal image">
                                </c:if>
                                <div class="card-body">
                                    <p class="card-text">Name: ${animal.name}</p>
                                    <p class="card-text">Age: ${animal.age}</p>
                                    <p class="card-text">Gender: ${animal.gender}</p>
                                    <p class="card-text">Weight: ${animal.weight}</p>
                                    <p class="card-text">${animal.description}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary"><a href="/animal/${animal.id}/details">Edit</a></button>
                                        </div>
                                        <small class="text-muted">${animal.createdDate}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../include/footer.jsp"/>