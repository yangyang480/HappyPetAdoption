<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../pub/style/main.css">
	<link rel="stylesheet" href="../../../pub/style/register.css">
<%--	<script src="../../../pub/js/register.js"></script>--%>
	<script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>

	<div class="wrapper">
		<div class="card">
			<p class="sign">Register</p>
			<%--@elvariable id="registerFormBean" type=""--%>
			<form:form class="form" action="/user/registerSubmit" modelAttribute="registerFormBean" method="POST" autocomplete="off">
				<div class="form-field">
					<form:input id="email" path="email" class="email form-control" name="email" type="text" placeholder="Email"/>
						<c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                            <div class="error-message">
									${error.getDefaultMessage()}
							</div>
						</c:forEach>
				</div>

				<div class="form-row form-field d-inline-block">
				    <div class="d-flex gap-3 justify-content-center">
				        <div class="col">
                            <form:input id="password" path="password" class="form-control" name="password" type="password"
                                placeholder="Password"/>
                            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                <div class="error-message">
                                    ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
				        </div>
				        <div class="col">
                            <form:input path="confirmPassword" id="confirmPassword" class="form-control" name="confirmPassword" type="password"
                                placeholder="Confirm Password"/>
                            <c:forEach items="${bindingResult.getFieldErrors('confirmPassword')}" var="error">
                                <div class="error-message">
                                    ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
				        </div>
				    </div>
				</div>

				<div class="form-field">
					<form:input id="name" path="name" class="name form-control" name="name" type="text" placeholder="Full Name"/>
					<c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
                        <div class="error-message">
						    ${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<div id="roles" class="roles d-flex justify-content-center form-control">
					    <div class="pe-2">Register As:</div>
						<div class="form-check pe-2 mb-0"><form:radiobutton path="userTypeId" class="form-check-input" value="0" label="Shelter" id="roles1" name="roles"/></div>
						<div class="form-check mb-0"><form:radiobutton path="userTypeId" class="form-check-input" value="1" label="Rescuer" id="roles2" name="roles"/></div>
					</div>
					<c:forEach items="${bindingResult.getFieldErrors('userTypeId')}" var="error">
                        <div class="error-message">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="address" path="address" class="address form-control" name="address" type="text"
				        placeholder="Address"/>
					<c:forEach items="${bindingResult.getFieldErrors('address')}" var="error">
                        <div class="error-message">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="city" path="city" class="city form-control" name="city" type="text" placeholder="City"/>
					<c:forEach items="${bindingResult.getFieldErrors('city')}" var="error">
                        <div class="error-message">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

                <div class="form-row form-field d-inline-block">
                    <div class="d-flex gap-3 justify-content-center">
                        <div class="col">
                            <form:select name="state" class="form-control" path="state" id="state">
                                <option value="-1">--State--</option>
                                <option value="AL">Alabama</option>
                                <option value="AK">Alaska</option>
                                <option value="AZ">Arizona</option>
                                <option value="AR">Arkansas</option>
                                <option value="CA">California</option>
                                <option value="CO">Colorado</option>
                                <option value="CT">Connecticut</option>
                                <option value="DE">Delaware</option>
                                <option value="DC">District Of Columbia</option>
                                <option value="FL">Florida</option>
                                <option value="GA">Georgia</option>
                                <option value="HI">Hawaii</option>
                                <option value="ID">Idaho</option>
                                <option value="IL">Illinois</option>
                                <option value="IN">Indiana</option>
                                <option value="IA">Iowa</option>
                                <option value="KS">Kansas</option>
                                <option value="KY">Kentucky</option>
                                <option value="LA">Louisiana</option>
                                <option value="ME">Maine</option>
                                <option value="MD">Maryland</option>
                                <option value="MA">Massachusetts</option>
                                <option value="MI">Michigan</option>
                                <option value="MN">Minnesota</option>
                                <option value="MS">Mississippi</option>
                                <option value="MO">Missouri</option>
                                <option value="MT">Montana</option>
                                <option value="NE">Nebraska</option>
                                <option value="NV">Nevada</option>
                                <option value="NH">New Hampshire</option>
                                <option value="NJ">New Jersey</option>
                                <option value="NM">New Mexico</option>
                                <option value="NY">New York</option>
                                <option value="NC">North Carolina</option>
                                <option value="ND">North Dakota</option>
                                <option value="OH">Ohio</option>
                                <option value="OK">Oklahoma</option>
                                <option value="OR">Oregon</option>
                                <option value="PA">Pennsylvania</option>
                                <option value="RI">Rhode Island</option>
                                <option value="SC">South Carolina</option>
                                <option value="SD">South Dakota</option>
                                <option value="TN">Tennessee</option>
                                <option value="TX">Texas</option>
                                <option value="UT">Utah</option>
                                <option value="VT">Vermont</option>
                                <option value="VA">Virginia</option>
                                <option value="WA">Washington</option>
                                <option value="WV">West Virginia</option>
                                <option value="WI">Wisconsin</option>
                                <option value="WY">Wyoming</option>
                            </form:select>
                            <c:forEach items="${bindingResult.getFieldErrors('state')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>

                        <div class="col">
                            <form:input id="zipcode" path="zipcode" class="zipcode form-control" name="zipcode" type="text"
                                placeholder="Zipcode"/>
                            <c:forEach items="${bindingResult.getFieldErrors('zipcode')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

				<div class="form-field">
					<form:input id="phone" path="phone" class="phone form-control" name="phone" type="tel"
					    placeholder="Phone Number"/>
					<c:forEach items="${bindingResult.getFieldErrors('phone')}" var="error">
                        <div class="error-message">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<button class="submit btn btn-primary py-2 px-4">Register</button>
			</form:form>

<%--			<c:if test="${not empty errorMessages}">--%>
<%--				<c:forEach items="${errorMessages}" var="message">--%>
<%--					<div style="color:red">${message}</div>--%>
<%--				</c:forEach>--%>
<%--			</c:if>--%>

            <div id="iconHomeContainer">
                <div id="iconHomeWhitespace"></div>
                <div id="homeLink">
                    <a class="back-home" href="/home"><i class="home fa-solid fa-house"></i></a>
                </div>
                <div class="hover-text">
                    <span title="home link"> -Back to home</span>
                </div>
            </div>
		</div>
        <div class="create-new card">
            <div>Already have an account? <a href="/user/login">Login to your account</a></div>
        </div>
	</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</body>

</html>