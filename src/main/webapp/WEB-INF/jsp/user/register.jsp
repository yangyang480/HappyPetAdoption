<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register</title>
	<link rel="stylesheet" href="../../../pub/style/register.css">
<%--	<script src="../../../pub/js/register.js"></script>--%>
	<script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>

	<div class="wrapper">
		<div class="main">
			<p class="sign">Register</p>
			<%--@elvariable id="registerFormBean" type=""--%>
			<form:form class="form" action="/user/registerSubmit" modelAttribute="registerFormBean" method="POST" autocomplete="off">
				<div class="form-field">
					<form:input id="email" path="email" class="email" name="email" type="text" placeholder="Email"/>
						<c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
							<div style="color: red;">
									${error.getDefaultMessage()}
							</div>
						</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="password" path="password" class="password" name="password" type="password"
					    placeholder="Password"/>
					<c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<input id="confirmPassword" class="password" name="confirmPassword" type="password"
					    placeholder="Confirm Password">
					<c:forEach items="${bindingResult.getFieldErrors('confirmPassword')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="name" path="name" class="name" name="name" type="text" placeholder="Full Name"/>
					<c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<div id="roles" class="roles">Register As:
						<form:radiobutton path="userTypeId" value="0" label="Shelter" id="roles1" name="roles"/>
						<form:radiobutton path="userTypeId" value="1" label="Rescuer" id="roles2" name="roles"/>
					</div>
					<c:forEach items="${bindingResult.getFieldErrors('userTypeId')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="address" path="address" class="address" name="address" type="text"
				        placeholder="Address"/>
					<c:forEach items="${bindingResult.getFieldErrors('address')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="city" path="city" class="city" name="city" type="text" placeholder="City"/>
					<c:forEach items="${bindingResult.getFieldErrors('city')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>	

				<div class="form-field">
					<form:select name="state" path="state" id="state">
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
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="zipcode" path="zipcode" class="zipcode" name="zipcode" type="text"
					    placeholder="Zipcode"/>
					<c:forEach items="${bindingResult.getFieldErrors('zipcode')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<div class="form-field">
					<form:input id="phone" path="phone" class="phone" name="phone" type="tel"
					    placeholder="Phone Number"/>
					<c:forEach items="${bindingResult.getFieldErrors('phone')}" var="error">
						<div style="color: red;">
								${error.getDefaultMessage()}
						</div>
					</c:forEach>
				</div>

				<br>
				
				<button class="submit">Register</button>
				<p class="forgot"><a href="/user/login">Have account already?</a></p>
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
	</div>


</body>

</html>