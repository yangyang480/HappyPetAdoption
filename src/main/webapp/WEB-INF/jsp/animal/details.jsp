<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp" />
<link rel="stylesheet" href="../../../pub/style/shelter/details.css">

<c:if test="${isCurrentUserShelterAndAnimalIsFromThere}">
    <jsp:include page="../include/shelter/header.jsp"/>
</c:if>

<%--animal detail--%>
<div class="container py-5 main-content">
    <h1>${animalFormBean.name}</h1>

<%--if is not current shelter and the animal is not belong to the current shelter, then can only see the info of the animal--%>
    <c:if test="${!isCurrentUserShelterAndAnimalIsFromThere}">
        <dl class="row">
            <dt class="col-sm-3 text-sm-end">From Shelter</dt>
            <dd class="col-sm-9"><a href="/shelter/${animalFormBean.id}/details">${animalFormBean.name}</a></dd>

            <dt class="col-sm-3 text-sm-end">Name</dt>
            <dd class="col-sm-9">${animalFormBean.name}</dd>

            <dt class="col-sm-3 text-sm-end">Species</dt>
            <dd class="col-sm-9">TODO</dd>

            <dt class="col-sm-3 text-sm-end">Age</dt>
            <dd class="col-sm-9">${animalFormBean.age}</dd>

            <dt class="col-sm-3 text-sm-end">Gender</dt>
            <dd class="col-sm-9">${animalFormBean.gender}</dd>

            <dt class="col-sm-3 text-sm-end">Weight</dt>
            <dd class="col-sm-9">${animalFormBean.weight}</dd>

            <dt class="col-sm-3 text-sm-end">Description</dt>
            <dd class="col-sm-9">${animalFormBean.description}</dd>
        </dl>
    </c:if>

    <%--if is current shelter and the animal is in current shelter, then can can be edit and delete--%>
    <c:if test="${isCurrentUserShelterAndAnimalIsFromThere}">
        <%--@elvariable id="animalFormBean" type=""--%>
        <form:form action="/animal/${animalFormBean.id}/detailsSubmit" modelAttribute="animalFormBean" method="POST">
            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label text-end">Name</label>
                <div class="col-sm-10">
                    <form:input type="text" id="name" class="form-control" name="name" path="name"/>
                    <c:forEach items="${errorFields.getFieldErrors('name')}" var="error">
                        <div class="error-message">
                                ${error.getDefaultMessage()}
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="age" class="col-sm-2 col-form-label text-end">Age</label>
                <div class="col-sm-10">
                    <form:input type="text" id="age" class="form-control" name="age" path="age"/>
                    <c:forEach items="${errorFields.getFieldErrors('age')}" var="error">
                        <div class="error-message">
                                ${error.getDefaultMessage()}
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="gender" class="col-sm-2 col-form-label text-end">Gender</label>
                <div class="col-sm-10">
                    <form:input type="text" id="gender" class="form-control" name="gender" path="gender"/>
                    <c:forEach items="${errorFields.getFieldErrors('gender')}" var="error">
                        <div class="error-message">
                                ${error.getDefaultMessage()}
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="weight" class="col-sm-2 col-form-label text-end">Weight</label>
                <div class="col-sm-10">
                    <form:input type="text" id="weight" class="form-control" name="weight" path="weight"/>
                    <c:forEach items="${errorFields.getFieldErrors('weight')}" var="error">
                        <div class="error-message">
                                ${error.getDefaultMessage()}
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="description" class="col-sm-2 col-form-label text-end">Description</label>
                <div class="col-sm-10">
                    <form:input name="description" class="form-control" id="description" path="description"/>
                    <c:forEach items="${errorFields.getFieldErrors('description')}" var="error">
                        <div class="error-message">
                                ${error.getDefaultMessage()}
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="speciesId" class="col-sm-2 col-form-label text-end">Species</label>
                <div class="col-sm-10">
                    <div class="form-check pe-2 mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="1" label="Dog" id="species1" name="speciesId"/></div>
                    <div class="form-check pe-2 mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="2" label="Cat" id="species2" name="speciesId"/></div>
                    <div class="form-check mb-0"><form:radiobutton path="speciesId" class="form-check-input" value="3" label="Rat" id="species3" name="speciesId"/></div>
                </div>
                <c:forEach items="${errorFields.getFieldErrors('speciesId')}" var="error">
                    <div class="error-message">
                            ${error.getDefaultMessage()}
                    </div>
                </c:forEach>
            </div>

            <div class="mb-3 row">
                <div class="col-sm-2"></div>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary mx-2 px-4">Save</button>
                    <a href="/animal/${animalFormBean.id}/delete" class="btn btn-link mx-2 px-4 float-end">Delete</a>
                </div>
            </div>
        </form:form>
    </c:if>

    <sec:authorize access="hasAuthority('Rescuer')">
        <c:if test="${!animalHasCompleteAdoption && empty currentRescuerAdoption && rescuerHasOpenAdoption == false}">
            <a class="btn btn-primary btn-lg" role="button" href="/adoption/request/animal/${animalFormBean.id}">Request to Adopt ${animalFormBean.name}</a>
        </c:if>

        <c:if test="${!animalHasCompleteAdoption && empty currentRescuerAdoption && rescuerHasOpenAdoption == true}">
            <button type="button" class="btn btn-secondary disabled">Request to Adopt ${animalFormBean.name}</button>
            <p class="text-secondary">*You currently have an open adoption. Please complete before opening another adoption request.</p>
        </c:if>

        <c:if test="${not empty currentRescuerAdoption}">
            <button type="button" class="btn btn-secondary disabled">Request to Adopt ${animalFormBean.name}</button>
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
        <p class="text-success">*${animalFormBean.name} has been adopted!</p>
    </c:if>
</div>

<jsp:include page="../include/footer.jsp" />
