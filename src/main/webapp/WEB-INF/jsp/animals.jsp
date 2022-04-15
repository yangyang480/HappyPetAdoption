<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<link rel="stylesheet" href="../../pub/style/animal.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>

<jsp:include page="include/header.jsp" />

<div class="container py-5">
    <div class="row py-5">
        <div class="col-lg-7 pb-5 pb-lg-0 px-3 px-lg-5">
            <h4 class="text mb-3">Happy-Pet</h4>
            <h1 class="display-4 mb-4"><span class="text-primary">Adoption</span> &amp; <span class="text-secondary">MISSION</span></h1>
            <h5 class="text-muted mb-3">We Rescue Animals.</h5>
            <p class="mb-4">We Commit to Our Animals through Adoption. We Inspire Change. It our responsiblity to help keep people & pets together! We can save lives while providing our beloved animal a sweet home.</p>
            <ul class="list-inline">
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Dogs for adoption</h5></li>
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>Cats for adoption</h5></li>
                <li><h5><i class="fa fa-check-double text-secondary mr-3"></i>To be volunteer</h5></li>
            </ul>
            <a href="/user/register" class="btn btn-lg btn-primary mt-3 px-4">Get involved</a>
        </div>
        <div class="col-lg-5">
            <div class="row px-3">
                <div class="col-12 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-1.jpg" alt="">
                </div>
                <div class="col-6 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-2.jpg" alt="">
                </div>
                <div class="col-6 p-0">
                    <img class="img-fluid w-100" src="../../pub/images/about-3.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="bg-light animal-section">
        <div class="search-box">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                           id="shelterSearchBox">
                    <button class="btn btn-outline-success" onclick="searchShelters()">Search</button>
                </div>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
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
</div>


<jsp:include page="include/footer.jsp" />



