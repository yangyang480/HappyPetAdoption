<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../../pub/style/shelter/details.css">

<div class="container py-5">
    <h1>${shelter.name}</h1>

    <address>
        <strong>${shelter.name}</strong><br>
        ${shelter.address}<br>
        ${shelter.city}, ${shelter.state} ${shelter.zipcode}<br>
        <br>
        Email: ${shelter.email}<br>
        Phone: ${shelter.phone}
    </address>

    <h2>Animals Available</h2>
    <c:forEach items="${animals}" var="animal">
        <div class="error-message">
            ${animal}
        </div>
    </c:forEach>
</div>

<jsp:include page="../include/footer.jsp" />
