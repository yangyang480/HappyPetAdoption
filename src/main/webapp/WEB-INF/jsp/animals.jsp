<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<link rel="stylesheet" href="../../pub/style/animals.css">

<jsp:include page="include/header.jsp" />

<%--About us--%>
<div class="container py-5">
    <div class="row py-5">
        <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
            <h4 class="text mb-3">Happy-Pet</h4>
            <h1 class="display-4 mb-4"><span class="text-primary">Adoption</span> &amp; <span class="text-secondary">MISSION</span></h1>
            <h5 class="text-muted mb-3">We Rescue Animals.</h5>
            <p class="mb-4">We Commit to Our Animals through Adoption. We Inspire Change. It our responsiblity to help keep people & pets together!
                We can save lives while providing our beloved animal a sweet home.</p>
            <ul class="list-inline">
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Dogs for adoption</h5></li>
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Cats for adoption</h5></li>
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>To be volunteer</h5></li>
            </ul>
            <a href="/user/register" class="btn btn-lg btn-primary mt-3 px-4">Get involved</a>
        </div>
        <div class="col-lg-5">
            <div class="row px-3">
                <div class="col-12 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-1.jpg" alt="">
                </div>
                <div class="col-6 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-2.jpg" alt="">
                </div>
                <div class="col-6 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-3.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>

<%--search animal--%>
<div class="main-content bg-light">
    <div class="container-lg album py-5">
        <form class="row g-3 mb-3 align-items-center" action="/animals" method="get">
            <div class="col-md-4">
                <div class="input-group">
                    <div class="input-group-text">Name</div>
                    <input class="form-control" type="text" name="name" placeholder="Animal Name"
                           aria-label="Search" id="shelterSearchBox" value="${name}">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </div>
            <div class="col-md-6"></div>
            <div class="col-md-2">
                <div class="input-group">
                    <select id="searchBy" class="form-select" name="searchBy">
                        <option value="-1">Filter By</option>
                        <option value="Available Titles">Dogs</option>
                        <option value="Available Titles">Cats</option>
                        <option value="Checked Out Authors">Rats</option>
                        <option value="Checked Out By User">All animals</option>
                    </select>
                    <button class="btn btn-primary" type="submit">submit</button>
                </div>
            </div>
        </form>



        <c:if test="${not empty name}">
            <h5>Search Results Found ${userModelKey.size()}</h5>
            <br>
        </c:if>
    </div>
</div>

<%--    animal with picture--%>
<div class="container-lg album py-5 ">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <c:forEach items="${userModelKey}" var="animal">
            <div class="col">
                <div class="card shadow-sm">
                    <c:if test="${empty animal.imgURL}">
                        <img src="https://placedog.net/50${animal.getId()}/50${animal.getId()}?r" alt="animal image">
                    </c:if>
                    <c:if test="${not empty animal.imgURL}">
                        <img src="${animal.imgURL}" alt="animal image">
                    </c:if>
                    <div class="card-body">
                        <p class="card-text">${animal.name}</p>
                        <p class="card-text">${animal.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <button type="button" class="btn btn-sm btn-outline-secondary"><a href="/animal/${animal.id}/details">View</a></button>
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


<jsp:include page="include/footer.jsp" />

