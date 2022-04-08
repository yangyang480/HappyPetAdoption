<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="/src/main/webapp/pub/style/home.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
    <style>
        .description {
            color: rgb(238, 143, 102);
            font-weight: 500;
        }
    </style>
</head>

<body>
<div class="hf">
    <nav class="container-lg navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Happy Pet Adoption</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="hospital.html">Hospital</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Animal</a>
                    </li>
                </ul>
                <span class="navbar-text">
                        <small>
                            <i class="fa-solid fa-circle-user fa-lg "></i> &nbsp
                            <a href="../../webapp/WEB-INF/jsp/user/login.jsp" class="login link-primary"> Login</a> /
                            <a href="../../webapp/WEB-INF/jsp/user/register.jsp" class="link-primary">Register</a>
                        </small>
                    </span>
            </div>
        </div>
    </nav>
</div>

<div class="welcome-container">
    <div class="welcome container-lg p-5 rounded-3">
        <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">WELCOME</h1>
            <p class="description col-md-8 fs-4">
                We hope our beloved animals can have a sweet home. However, not everyone have one.
                If you love animal, please don't miss the chance to provide a real home to the animals.</p>
            <a href="../../webapp/WEB-INF/jsp/user/register.jsp" class="link-primary">
                <button class="btn btn-primary btn-lg" type="button">Join us</button>
            </a>
        </div>
    </div>
</div>

<div class="bg-light animal-section">
    <div class="container-lg album py-5 ">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placedog.net/506/506?r" alt="dog">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placekitten.com/401/401" alt="cat">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placekitten.com/400/400" alt="cat">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placekitten.com/460/460" alt="cat">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placedog.net/500/500" alt="dog">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://placedog.net/499/499" alt="dog">
                        <div class="card-body">
                            <p class="card-text">
                                My name is Coco. I am 2 years old. I love playing throw and catch.
                                Happy pet Adoption saved me in a cold day.
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                </div>
                                <small class="text-muted">create date</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<footer id="footer" class="text-muted py-4">
    <div class="container text-center">
        <div class="row title">
            <div class="col-6">
                Contact
            </div>
            <div class="col-6">
                Follow
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                yangyangzhao1213@gmail.com
            </div>
            <div class="col-6">
                <a href="https://www.facebook.com/YangyangTwantwan/"><i class="fa-brands fa-facebook"></i></a>
            </div>
        </div>

        <div class="row">
            <div class="col-6">
                +1 (838)-200-0616
            </div>
            <div class="col-6">
                <a href="https://www.youtube.com/c/YangyangTwantwan"><i class="fa-brands fa-youtube"></i></a>
            </div>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>

</html>