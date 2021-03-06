<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../../WEB-INF/jsp/include/header.jsp"/>

<link rel="stylesheet" href="../../../pub/style/profile.css">
<script src="../../../pub/js/register.js"></script>

<style>
    .invalid-feedback {
        display: none;
        font-family: sans-serif;
        width: 100%;
        margin-top: 0.25rem;
        font-size: small;
        color: #dc3545;
    }
</style>

<div class="main-content container-lg my-2 my-lg-4">
    <%--different views on title--%>
    <c:if test="${profileFormBean.userTypeId == 0}">
        <h1>Shelter Profile</h1>
        <a class="btn btn-primary mx-2 px-4" role="button" href="/shelter/home">Go to Shelter</a>
    </c:if>
    <c:if test="${profileFormBean.userTypeId == 1}">
        <h1>Rescuer Profile</h1>

        <c:if test="${not empty currentAdoption}">
            <a class="btn btn-primary mx-2 px-4" role="button" href="/adoption/${currentAdoption.getId()}/details">Current Adoption</a>
        </c:if>
        <a class="btn btn-primary mx-2 px-4" role="button" href="/user/adoptions">Historical Adoptions</a>

    </c:if>

    <%--@elvariable id="profileFormBean" type=""--%>
    <form:form action="/user/profileSubmit" modelAttribute="profileFormBean" method="POST">
        <fieldset class="mt-2 mt-lg-4">
            <div class="mb-3 row">
                <label for="email" class="col-sm-2 col-form-label text-end">Email</label>
                <div class="col-sm-10">
                    <form:input type="text" id="email" class="form-control" name="email" path="email"/>
                    <div id="emptyEmail" class="invalid-feedback">
                        Please enter an email
                    </div>
                    <div id="emailNoAnnotation" class="invalid-feedback">
                        Email should have @ .
                    </div>
                </div>
            </div>

            <div class="mb-3 row">
                <label for="name" class="col-sm-2 col-form-label text-end">Full Name</label>
                <div class="col-sm-10">
                    <form:input type="text" id="name" class="form-control" name="name" path="name"/>
                </div>
                <div id="emptyName" class="invalid-feedback">
                    Please enter your name
                </div>
            </div>

            <div class="mb-3 row">
                <label for="address" class="col-sm-2 col-form-label text-end">Address</label>
                <div class="col-sm-10">
                    <form:input type="text" id="address" class="form-control" name="address" path="address"/>
                </div>
                <div id="emptyAddress" class="invalid-feedback">
                    Please enter an address
                </div>
            </div>

            <div class="mb-3 row">
                <label for="city" class="col-sm-2 col-form-label text-end">City</label>
                <div class="col-sm-10">
                    <form:input type="text" id="city" class="form-control" name="city" path="city"/>
                </div>
                <div id="emptyCity" class="invalid-feedback">
                    Please enter a city
                </div>
            </div>

            <div class="mb-3 row">
                <label for="state" class="col-sm-2 col-form-label text-end">State</label>
                <div class="col-sm-10">
                    <form:select name="state" class="form-control" id="state" path="state">
                        <form:option label="--State--" value=""/>
                        <form:option label="Alabama" value="AL"/>
                        <form:option label="Alaska" value="AK"/>
                        <form:option label="Arizona" value="AZ"/>
                        <form:option label="Arkansas" value="AR"/>
                        <form:option label="California" value="CA"/>
                        <form:option label="Colorado" value="CO"/>
                        <form:option label="Connecticut" value="CT"/>
                        <form:option label="Delaware" value="DE"/>
                        <form:option label="District Of Columbia" value="DC"/>
                        <form:option label="Florida" value="FL"/>
                        <form:option label="Georgia" value="GA"/>
                        <form:option label="Hawaii" value="HI"/>
                        <form:option label="Idaho" value="ID"/>
                        <form:option label="Illinois" value="IL"/>
                        <form:option label="Indiana" value="IN"/>
                        <form:option label="Iowa" value="IA"/>
                        <form:option label="Kansas" value="KS"/>
                        <form:option label="Kentucky" value="KY"/>
                        <form:option label="Louisiana" value="LA"/>
                        <form:option label="Maine" value="ME"/>
                        <form:option label="Maryland" value="MD"/>
                        <form:option label="Massachusetts" value="MA"/>
                        <form:option label="Michigan" value="MI"/>
                        <form:option label="Minnesota" value="MN"/>
                        <form:option label="Mississippi" value="MS"/>
                        <form:option label="Missouri" value="MO"/>
                        <form:option label="Montana" value="MT"/>
                        <form:option label="Nebraska" value="NE"/>
                        <form:option label="Nevada" value="NV"/>
                        <form:option label="New Hampshire" value="NH"/>
                        <form:option label="New Jersey" value="NJ"/>
                        <form:option label="New Mexico" value="NM"/>
                        <form:option label="New York" value="NY"/>
                        <form:option label="North Carolina" value="NC"/>
                        <form:option label="North Dakota" value="ND"/>
                        <form:option label="Ohio" value="OH"/>
                        <form:option label="Oklahoma" value="OK"/>
                        <form:option label="Oregon" value="OR"/>
                        <form:option label="Pennsylvania" value="PA"/>
                        <form:option label="Rhode Island" value="RI"/>
                        <form:option label="South Carolina" value="SC"/>
                        <form:option label="South Dakota" value="SD"/>
                        <form:option label="Tennessee" value="TN"/>
                        <form:option label="Texas" value="TX"/>
                        <form:option label="Utah" value="UT"/>
                        <form:option label="Vermont" value="VT"/>
                        <form:option label="Virginia" value="VA"/>
                        <form:option label="Washington" value="WA"/>
                        <form:option label="West Virginia" value="WV"/>
                        <form:option label="Wisconsin" value="WI"/>
                        <form:option label="Wyoming" value="WY"/>
                    </form:select>
                </div>
                <div id="emptySelectState" class="invalid-feedback">
                    Please select a state
                </div>
            </div>

            <div class="mb-3 row">
                <label for="zipcode" class="col-sm-2 col-form-label text-end">Zipcode</label>
                <div class="col-sm-10">
                    <form:input type="text" id="zipcode" class="form-control" name="zipcode" path="zipcode"/>
                </div>
                <div id="emptyZipcode" class="invalid-feedback">
                    Please enter a zipcode
                </div>
                <div id="zipNot5Digits" class="invalid-feedback">
                    Zipcode should be 5 digits
                </div>
            </div>

            <div class="mb-3 row">
                <label for="phone" class="col-sm-2 col-form-label text-end">Phone Number</label>
                <div class="col-sm-10">
                    <form:input type="text" id="phone" class="form-control" name="phone" path="phone"/>
                </div>
                <div id="emptyPhone" class="invalid-feedback">
                    Please enter a phone number
                </div>
                <div id="phoneNot10Digits" class="invalid-feedback">
                    Phone should be 10 digits
                </div>
            </div>
        </fieldset>
    </form:form>

    <div class="mb-3 row">
        <div class="col-sm-2"></div>
        <div class="col-sm-10">
            <button class="btn btn-primary mx-2 px-4" onclick="validate();">Save</button>
            <a class="btn btn-primary mx-2 px-4" role="button" href="/user/logout">Logout</a>
            <button class="btn btn-link mx-2 px-4 float-end">Delete</button>
        </div>
    </div>

</div>

<jsp:include page="../../../WEB-INF/jsp/include/footer.jsp"/>