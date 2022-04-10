<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Register</title>
	<link rel="stylesheet" href="../../../pub/style/register.css">
	<script src="../../../pub/js/register.js"></script>
	<script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>

	<div class="wrapper">
		<div class="main">
			<p class="sign">Register</p>
			<form class="form" action="/user/registerSubmit" method="post" autocomplete="off">
				<div class="form-field">
					<input id="email" class="email" name="email" type="email" placeholder="Email" value="${formbean.email}">
					<div id="emptyEmail" class="invalid-feedback">
						Please enter an email
					</div>					
					<div id="emailNoAnnotation" class="invalid-feedback">
						Email should have @.
					</div>
				</div>

				<div class="form-field">
					<input id="password" class="password" name="password" type="password" placeholder="Password"
						   value="${formbean.password}">
					<div id="emptyPassword" class="invalid-feedback">
						Please enter a password
					</div>
					<div id="passwordTooLong" class="invalid-feedback">
						6 ~ 20 with at least one numeric digit, one uppercase and one lowercase
					</div>
				</div>

				<div class="form-field">
					<input id="confirmPassword" class="password" name="confirmPassword" type="password"
						placeholder="Confirm Password" value="${formbean.confirmPassword}">
					<div id="passwordNotSame" class="invalid-feedback">
						Passwords do not match
					</div>
				</div>

				<div class="form-field">
					<input id="name" class="name" name="name" type="text"
						   placeholder="Full Name" value="${formbean.name}">
					<div id="emptyName" class="invalid-feedback">
						Please enter your name
					</div>
				</div>

				<div class="form-field">
					<div id="roles" class="roles">Register As:
						<input id="roles1" name="roles" type="radio">
						<form:radiobutton path="role" value="0" label="Shelter" id="roles"/>Shelter
						<input type="radio" id="roles2" name="roles">
						<form:radiobutton path="role" value="1" label="Rescuer" id="roles"/>Rescuer
					</div>
					<div id="emptyRegisterAs" class="invalid-feedback">
						Please select a role
					</div>
				</div>

<%--				<c:forEach items="${bindingResult.getFieldErrors('checkbox')}" var="error">--%>
<%--					<div style="color: red;">--%>
<%--							${error.getDefaultMessage()}--%>
<%--					</div>--%>
<%--				</c:forEach>--%>

				<div class="form-field">
					<input id="address" class="address" name="address" type="text" placeholder="Address"
						   value="${formbean.address}">
						<div id="emptyAddress" class="invalid-feedback">
							Please enter an address
						</div>
				</div>

				<div class="form-field">
					<input id="city" class="city" name="city" type="text" placeholder="City" value="${formbean.city}">
					<div id="emptyCity" class="invalid-feedback">
						Please enter a city
					</div>
				</div>	

				<div class="form-field">
					<select name="state" id="state" value="${formbean.state}">
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
					</select>
					<div id="emptySelectState" class="invalid-feedback">
						Please select a state
					</div>
				</div>

				<div class="form-field">
					<input id="zipcode" class="zipcode" name="zipcode" type="text" placeholder="Zipcode"
						   value="${formbean.zipcode}">
						<div id="emptyZipcode" class="invalid-feedback">
							Please enter a zipcode
						</div>
						<div id="zipNot5Digits" class="invalid-feedback">
							Zipcode should be 5 digits
						</div>
				</div>

				<div class="form-field">
					<input id="phone" class="phone" name="phone" type="tel" placeholder="Phone Number" value="${formBean.phone}">
					<div id="emptyPhone" class="invalid-feedback">
						Please enter a phone number
					</div>
					<div id="phoneNot10Digits" class="invalid-feedback">
						Phone should be 10 digits
					</div>
				</div>

				<br>
				
				<a class="submit" onclick="validate();">Register</a>
				<p class="forgot"><a href="/user/login">Have account already?</a></p>
			</form>
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