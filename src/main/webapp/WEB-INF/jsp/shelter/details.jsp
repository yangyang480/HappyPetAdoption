<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../pub/style/shelters.css">


<div class="page-heading-shelters products-heading header-text">
    <div class="container-header">
        <div class="row">
            <div class="col-md-12">
                <div class="text-content">
                    <h2>Welcome to ${shelter.name}!</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container py-5 main-content">
    <h1>${shelter.name}</h1>

    <address>
        <strong>${shelter.name}</strong><br>
        ${shelter.address}<br>
        ${shelter.city}, ${shelter.state} ${shelter.zipcode}<br>
        <br>
        Email: ${shelter.email}<br>
        Phone: ${shelter.phone}
    </address>

    <h2 style="color: #121212">Animals</h2>

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

</div>

<jsp:include page="../include/footer.jsp" />
