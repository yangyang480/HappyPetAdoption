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
        <c:if test="${!anyOpenAdoptions}">
            <a class="btn btn-primary btn-lg" role="button" href="/adoption/request">Request to Adopt ${animal.name}</a>
        </c:if>

        <c:if test="${anyOpenAdoptions}">
            <button type="button" class="btn btn-secondary disabled">Request to Adopt ${animal.name}</button>
            <p class="text-secondary">*You currently have an open adoption.</p>
        </c:if>
    </sec:authorize>
</div>

<jsp:include page="../include/footer.jsp" />
