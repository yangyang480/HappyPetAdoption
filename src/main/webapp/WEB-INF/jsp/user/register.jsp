<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register</title>
    <link rel="icon" type="image/x-icon" href="../../pub/images/favicon.ico">
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
            <%-- since the confirm password depending on two fields, so they get confused where to put the message, so I put on the global  --%>
            <c:forEach items="${bindingResult.getGlobalErrors()}" var="error">
                <p class="error-message text-center">
                    ${error.getDefaultMessage()}
                </p>
            </c:forEach>
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
                            <form:input id="password" path="password" class="form-control" name="password"
                                type="password" placeholder="Password"/>
                            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                <div class="error-message">
                                    ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
				        </div>
				        <div class="col">
                            <form:input path="confirmPassword" id="confirmPassword" class="form-control"
                                name="confirmPassword" type="password" placeholder="Confirm Password"/>
                            <c:forEach items="${bindingResult.getFieldErrors('confirmPassword')}" var="error">
                                <div class="error-message">
                                    ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
				        </div>
				    </div>
				</div>

				<div class="form-field">
					<form:input id="name" path="name" class="name form-control" name="name" type="text"
					    placeholder="Full Name"/>
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
                            <c:forEach items="${bindingResult.getFieldErrors('state')}" var="error">
                                <div class="error-message">
                                        ${error.getDefaultMessage()}
                                </div>
                            </c:forEach>
                        </div>

                        <div class="col">
                            <form:input id="zipcode" path="zipcode" class="zipcode form-control" name="zipcode"
                                type="text" placeholder="Zipcode"/>
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

				<button class="submit btn btn-primary py-2 px-5">Register</button>
			</form:form>

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