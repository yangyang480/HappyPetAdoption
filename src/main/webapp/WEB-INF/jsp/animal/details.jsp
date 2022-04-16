<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../../pub/style/shelter/details.css">

<div class="container py-5 main-content">
    <h1>${animal.name}</h1>
    <dl class="row">

        <dt class="col-sm-3 text-end">From Shelter</dt>
        <dd class="col-sm-9"><a href="/shelter/${shelter.id}/details">${shelter.name}</a></dd>

        <dt class="col-sm-3 text-end">Name</dt>
        <dd class="col-sm-9">${animal.name}</dd>

        <dt class="col-sm-3 text-end">Species</dt>
        <dd class="col-sm-9">TODO</dd>

        <dt class="col-sm-3 text-end">Age</dt>
        <dd class="col-sm-9">${animal.age}</dd>

        <dt class="col-sm-3 text-end">Gender</dt>
        <dd class="col-sm-9">${animal.gender}</dd>

        <dt class="col-sm-3 text-end">Weight</dt>
        <dd class="col-sm-9">${animal.weight}</dd>

        <dt class="col-sm-3 text-end">Description</dt>
        <dd class="col-sm-9">${animal.description}</dd>

    </dl>
</div>

<jsp:include page="../include/footer.jsp" />
