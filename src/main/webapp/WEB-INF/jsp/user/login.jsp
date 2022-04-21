<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="../../../pub/style/main.css">
    <link rel="stylesheet" href="../../../pub/style/login.css">
    <script src="../../../pub/js/login.js"></script>
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="wrapper">
        <div class="card">
            <p class="sign">Sign in</p>
			<form class="form" action="/user/loginSubmit" method="POST">
                <div class="form-field">
                    <input id="email" class="email form-control" name="email" type="text" placeholder="Email">
                    <div id="emptyEmail" class="invalid-feedback">
                        Please enter an email
                    </div>
                </div>

                <div class="form-field"> 
                    <input id="password" class="password form-control" name="password" type="password"
                        placeholder="Password">
                    <div id="emptyPassword" class="invalid-feedback">
                        Please enter a password
                    </div>
                </div>
                <button class="submit btn btn-primary py-2 px-5" onclick="validate();">Sign in</button>
                <div id="formOptions" class="d-flex justify-content-evenly pt-3">
                    <div class="form-field form-check d-flex justify-content-end">
                        <input class="form-check-input" type="checkbox">
                        <label class="form-check-label ms-2" for="flexCheckDefault">Remember me</label>
                    </div>
                    <a href="#">Forgot Password?</a>
                </div>
            </form>

            <div id="iconHomeContainer">
                <div id="iconHomeWhitespace"></div>
                <div id="homeLink">
                    <a class="back-home" href="/home"><i class="home fa-solid fa-house"></i></a>
                </div>
                <div class="hover-text">
                    <span title="home link">Back to home</span>
                </div>
            </div>
        </div>
        <div class="create-new card">
            <div>Don't have a account yet?</div>
            <a href="/user/register">Create a new account</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</body>

</html>