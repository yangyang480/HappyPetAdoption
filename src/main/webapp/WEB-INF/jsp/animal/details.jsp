<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../../pub/style/shelter/details.css">

<div class="container py-5 main-content">
    <h1>${animal.name}</h1>

    <dl class="row">
        <dt class="col-sm-3 text-sm-end">From Shelter</dt>
        <dd class="col-sm-9"><a href="/shelter/${shelter.id}/details">${shelter.name}</a></dd>

        <dt class="col-sm-3 text-sm-end">Name</dt>
        <dd class="col-sm-9">${animal.name}</dd>

        <dt class="col-sm-3 text-sm-end">Species</dt>
        <dd class="col-sm-9">TODO</dd>

        <dt class="col-sm-3 text-sm-end">Age</dt>
        <dd class="col-sm-9">${animal.age}</dd>

        <dt class="col-sm-3 text-sm-end">Gender</dt>
        <dd class="col-sm-9">${animal.gender}</dd>

        <dt class="col-sm-3 text-sm-end">Weight</dt>
        <dd class="col-sm-9">${animal.weight}</dd>

        <dt class="col-sm-3 text-sm-end">Description</dt>
        <dd class="col-sm-9">${animal.description}</dd>
    </dl>

    <sec:authorize access="hasAuthority('Rescuer')">
        <c:if test="${!animalHasCompleteAdoption && empty currentRescuerAdoption && rescuerHasOpenAdoption == false}">
            <a class="btn btn-primary btn-lg" role="button" href="/adoption/request/animal/${animal.id}">Request to Adopt ${animal.name}</a>
        </c:if>

        <c:if test="${!animalHasCompleteAdoption && empty currentRescuerAdoption && rescuerHasOpenAdoption == true}">
            <button type="button" class="btn btn-secondary disabled">Request to Adopt ${animal.name}</button>
            <p class="text-secondary">*You currently have an open adoption. Please complete before opening another adoption request.</p>
        </c:if>

        <c:if test="${not empty currentRescuerAdoption}">
            <button type="button" class="btn btn-secondary disabled">Request to Adopt ${animal.name}</button>
            <a class="btn btn-primary" role="button" href="/adoption/${currentRescuerAdoption.getId()}/details">Go to Adoption Page</a>
            <p class="text-secondary">*You currently have an adoption order.</p>
        </c:if>
    </sec:authorize>

    <sec:authorize access="!isAuthenticated()">
        <c:if test="${!animalHasCompleteAdoption}">
            <a class="btn btn-primary btn-lg" role="button" href="/user/register">Sign up to Rescue!</a>
        </c:if>
    </sec:authorize>

    <c:if test="${animalHasCompleteAdoption}">
        <p class="text-success">*${animal.name} has been adopted!</p>
    </c:if>
</div>

<jsp:include page="../include/footer.jsp" />
