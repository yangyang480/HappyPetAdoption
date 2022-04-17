
<jsp:include page="../include/header.jsp"/>

//TODO add picture to the animal table...
<h1>Create Animal</h1>

<form action="/shelter/createSubmit" method="get">

    Image URL: <input type="text" name="imageURL">
    <br>
</form>

<jsp:include page="../include/footer.jsp"/>