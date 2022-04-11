<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Shelter Home</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="../../../pub/style/shelterHome.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>

</head>

<body>
<jsp:include page="../include/header.jsp"/>

<!-- Page Content -->
<div class="page-heading products-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-content">
                    <h4>Hello, Shelter</h4>
                    <h2>We are glad to have you</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- shelter function -->
<div class="shelter">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="filters">
                    <ul>
                        <li class="active" data-filter="*">All Animals</li>
                        <li data-filter=".des">Manage Animals</li>
                        <li data-filter=".dev">Customize Shelter</li>
                        <li data-filter=".gra">Manage Adoptions</li>
                    </ul>
                </div>
            </div>

            <!-- animal list -->
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

            <!-- page -->
            <div class="col-md-12">
                <ul class="pages">
                    <li><a href="#">1</a></li>
                    <li class="active"><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../include/footer.jsp"/>

</body>
</html>