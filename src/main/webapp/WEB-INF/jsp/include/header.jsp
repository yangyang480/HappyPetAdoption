<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="../../../pub/style/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
</head>

<body>
<div class="hf">
    <nav class="container-lg navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/home">Happy Pet Adoption</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/view/hospital">Hospital</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/view/animal">Animal</a>
                    </li>
                </ul>
                <span class="navbar-text">
                    <small>
                        <c:if test="${user == null}">
                            <i class="fa-solid fa-circle-user fa-lg "></i> &nbsp
                            <a href="/user/login" class="login link-primary"> Login</a> /
                            <a href="/user/register" class="link-primary">Register</a>
                        </c:if>
                        <c:if test="${user != null}">
                            <a href="/user/profile" class="link-primary">Welcome, ${user.name}!</a>
                        </c:if>
                    </small>
                </span>
            </div>
        </div>
    </nav>
</div>

</body>
</html>