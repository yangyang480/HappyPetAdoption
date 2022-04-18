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
    </div>
</div>

            <!-- animal list -->
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placedog.net/506/506?r" alt="dog">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placekitten.com/401/401" alt="cat">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placekitten.com/400/400" alt="cat">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placekitten.com/460/460" alt="cat">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placedog.net/500/500" alt="dog">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card shadow-sm">
                            <img src="https://placedog.net/499/499" alt="dog">
                            <div class="card-body">
                                <p class="card-text">
                                    My name is Coco. I am 2 years old. I love playing throw and catch.
                                    Happy pet Adoption saved me in a cold day.
                                </p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    </div>
                                    <small class="text-muted">create date</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- page -->
            <div class="col-md-12">
                <ul class="pages">
                    <li><a href="#">1</a></li>
                    <li class="active"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../include/footer.jsp"/>