<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>

<link rel="stylesheet" href="../../../pub/style/shelter/manage.css">

<div class="container main-content">
    <br>
    <h1>Adoptions</h1>
    <br>

    <c:if test="${empty adoptionObjectList}">
        <p style="color: #4e4066">* You have no adoption history!</p>
    </c:if>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <c:forEach items="${adoptionObjectList}" var="adoptionObject">
            <div class="col">
                <div class="card shadow-sm">
                    <c:if test="${empty adoptionObject.animal.getImgURL()}">
                        <img src="https://placedog.net/50${adoptionObject.animal.getId()}/50${adoptionObject.animal.getId()}?r" alt="animal image">
                    </c:if>
                    <c:if test="${not empty adoptionObject.animal.getImgURL()}">
                        <img src="${adoptionObject.animal.getImgURL()}" alt="animal image">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${adoptionObject.animal.getName()}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Rescuer: ${adoptionObject.rescuer.getName()}</h6>
                        <p class="card-text">
                            ${adoptionObject.animal.getDescription()}
                        </p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <a href="/adoption/${adoptionObject.adoption.getId()}/details" type="button" class="btn btn-sm btn-outline-secondary">View Request</a>
                            </div>
                            <small class="text-muted">Status: ${adoptionObject.orderStatus}</small>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
