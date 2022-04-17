<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../../pub/style/shelter/details.css">

<div class="container py-5 main-content">
    <h1>Adoption Details</h1>
    <div class="alert ${orderStatus == 'Requested' || orderStatus == 'Pending' ? 'alert-primary' : ''} ${orderStatus == 'Canceled' ? 'alert-secondary' : ''} ${orderStatus == 'Completed' ? 'alert-success' : ''}" role="alert">
        <h4 class="alert-heading">Adoption Status: ${orderStatus}</h4>

        <p>
            <c:if test="${currentUserIsShelter && orderStatus == 'Requested'}">
                This rescuer has requested to adopted this animal. Please reach out to them to discus adoption steps. Switch to pending status when your shelter awaits for their response.
            </c:if>
            <c:if test="${currentUserIsRescuer && orderStatus == 'Requested'}">
                Aww yeah, you are officially awesome! Please await the shelter to reach out to you for more information.
            </c:if>
            <c:if test="${currentUserIsShelter && orderStatus == 'Pending'}">
                Your shelter is currently awaiting for the rescuer. Please reach out to them for any missing adoption steps. Once the adoption is complete, you set this adoption to complete.
            </c:if>
            <c:if test="${currentUserIsRescuer && orderStatus == 'Pending'}">
                So close to completing your adoption! Please reach out to the shelter if you have any questions. You should have received information from the shelter.
            </c:if>
            <c:if test="${currentUserIsShelter && orderStatus == 'Canceled'}">
                Unfortunately, this adoption did not go through. Let's hope next one will!
            </c:if>
            <c:if test="${currentUserIsRescuer && orderStatus == 'Canceled'}">
                Unfortunately, your adoption did not go through. Let's hope next one will!
            </c:if>
            <c:if test="${currentUserIsShelter && orderStatus == 'Completed'}">
                Hooray! We want to congratulate the shelter on a successful adoption!
            </c:if>
            <c:if test="${currentUserIsRescuer && orderStatus == 'Completed'}">
                Hooray! We want to congratulate you on your successful adoption!
            </c:if>
        </p>

        <c:if test="${orderStatus == 'Requested' || orderStatus == 'Pending'}">
            <hr>
        </c:if>

        <c:if test="${currentUserIsShelter && orderStatus == 'Requested'}">
            <a class="btn btn-primary" role="button" href="/adoption/${adoptionId}/approve">Set Adoption to Pending</a>
        </c:if>
        <c:if test="${currentUserIsShelter && orderStatus == 'Pending'}">
            <a class="btn btn-success" role="button" href="/adoption/${adoptionId}/complete">Complete Adoption</a>
        </c:if>
        <c:if test="${orderStatus == 'Requested' || orderStatus == 'Pending'}">
            <a class="btn btn-danger" role="button" href="/adoption/${adoptionId}/cancel">Cancel Adoption</a>
        </c:if>
    </div>

    <h2>Animal</h2>
    <dl class="row">
        <dt class="col-sm-2">Name</dt>
        <dd class="col-sm-10"><a href="/animal/${animal.id}/details">${animal.name}</a></dd>

        <dt class="col-sm-2">Species</dt>
        <dd class="col-sm-10">TODO</dd>

        <dt class="col-sm-2">Age</dt>
        <dd class="col-sm-10">${animal.age}</dd>

        <dt class="col-sm-2">Gender</dt>
        <dd class="col-sm-10">${animal.gender}</dd>

        <dt class="col-sm-2">Weight</dt>
        <dd class="col-sm-10">${animal.weight}</dd>

        <dt class="col-sm-2">Description</dt>
        <dd class="col-sm-10">${animal.description}</dd>
    </dl>

    <h2>Rescuer</h2>
    <dl class="row">
        <dt class="col-sm-2">Name</dt>
        <dd class="col-sm-10">${rescuer.name}</dd>

        <dt class="col-sm-2">Address</dt>
        <dd class="col-sm-10">${rescuer.address} ${rescuer.city}, ${rescuer.state} ${rescuer.zipcode}</dd>

        <dt class="col-sm-2">Email</dt>
        <dd class="col-sm-10">${rescuer.email}</dd>

        <dt class="col-sm-2">Phone</dt>
        <dd class="col-sm-10">${rescuer.phone}</dd>
    </dl>

    <h2>Shelter</h2>
    <dl class="row">
        <dt class="col-sm-2">Name</dt>
        <dd class="col-sm-10"><a href="/shelter/${shelter.id}/details">${shelter.name}</a></dd>

        <dt class="col-sm-2">Address</dt>
        <dd class="col-sm-10">${shelter.address} ${shelter.city}, ${shelter.state} ${shelter.zipcode}</dd>

        <dt class="col-sm-2">Email</dt>
        <dd class="col-sm-10">${shelter.email}</dd>

        <dt class="col-sm-2">Phone</dt>
        <dd class="col-sm-10">${shelter.phone}</dd>
    </dl>
</div>

<jsp:include page="../include/footer.jsp" />
