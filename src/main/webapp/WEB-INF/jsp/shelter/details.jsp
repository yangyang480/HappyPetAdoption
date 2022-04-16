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
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Age</th>
                <th scope="col">Gender</th>
                <th scope="col">Weight</th>
                <th scope="col">Description</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${animals}" var="animal">
                <tr>
                    <th scope="row"><a href="/animal/${animal.id}/details">${animal.name}</a></th>
                    <td>${animal.age}</td>
                    <td>${animal.gender}</td>
                    <td>${animal.weight}</td>
                    <td>${animal.description}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../include/footer.jsp" />
