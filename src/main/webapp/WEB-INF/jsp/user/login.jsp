<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/src/main/webapp/pub/style/login.css">
    <script src="/src/main/webapp/pub/js/login.js"></script>
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="wrapper">
        <div class="main">
            <p class="sign">Sign in</p>
            <form class="form">
                <div class="form-field">
                    <input id="username" class="username " name="username" type="text" placeholder="Email"></input>
                    <div id="emptyUsername" class="invalid-feedback">
                        Please enter an email
                    </div>
                    <div id="usernameNoAnnotation" class="invalid-feedback">
                        Email should have @ .
                    </div>
                </div>

                <div class="form-field"> 
                    <input id="password" class="password" name="password" type="password"
                        placeholder="Password"></input>
                    <div id="emptyPassword" class="invalid-feedback">
                        Please enter a password
                    </div>
                    <div id="passwordTooLong" class="invalid-feedback">
                        6 ~ 20 with at least one numeric digit, one uppercase and one lowercase
                    </div>
                </div>
                <a class="submit" onclick="validate();">Sign in</a>
                <p class="forgot"><a href="#">Forgot Password?</a></p>
            </form>

            <div id="iconHomeContainer">
                <div id="iconHomeWhitespace"></div>
                <div id="homeLink">
                    <a class="back-home" href="../../../../resources/templates/home.html"><i class="home fa-solid fa-house"></i></a>
                </div>
                <div class="hover-text">
                    <span title="home link">Back to home</span>
                </div>
            </div>

        </div>
        <div class="create-new">
            <p>Don't have a account yet?</p>
            <a href="register.jsp">Create a
                new account</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>