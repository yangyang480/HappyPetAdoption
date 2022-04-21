
<jsp:include page="include/header.jsp" />

<link rel="stylesheet" href="../../pub/style/home.css">

<div id="homeCarousel">
    <div class="container-xxl carousel-container p-0">
        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="../../pub/images/carousel-1.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-flex flex-column h-100 align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 900px;">
                                <h3 class="text-white mb-3 d-none d-sm-block">Best home</h3>
                                <h1 class="display-3 text-white mb-3">Happy Pet Adoption</h1>
                                <h5 class="text-white mb-3 d-none d-sm-block">We hope our beloved animals can have a sweet home.</h5>
                                <a href="/user/register" class="btn btn-lg btn-primary mt-3 mt-md-4 px-4">JOIN US</a>
                            </div>
                        </div>
                </div>
                <div class="carousel-item">
                    <img src="../../pub/images/carousel-2.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>Happy Pet Adoption</h2>
                        <h5>Don't miss the chance to give them a home.</h5>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="../../pub/images/11.jpeg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>Happy Pet Adoption</h2>
                        <h5>Every animal deserve a sweet home.</h5>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>

<div class="container about py-5">
    <div class="row align-items-center">
        <div class="col-lg-6 py-3">
            <div class="subhead">About Us</div>
            <h2 class="title-section">We provide <span class="fg-primary">Most Convenient</span> animal adoption service</h2>

            <p>We have thousands of shelters available in this website. If you are animal lover and want to save life. Then you are in the right place.
                Adoption procedure is simple and easy. learn more by click on the button below.</p>
            <a href="../../pub/docs/Guide.pdf" target="_blank" class="btn btn-primary mt-4">Read More</a>
        </div>
        <div class="col-lg-6 py-3">
            <div class="about-img">
                <img src="../../pub/images/about.jpg" alt="about">
            </div>
        </div>
    </div>
</div>

<div id="ourServices" class="pt-5">
    <div class="container py-5">
        <div class="d-flex flex-column text-center mb-5">
            <h4 class="text-secondary mb-3">Our Services</h4>
            <h1 class="display-4 m-0">What you can do in this website</h1>
        </div>
        <div class="row pb-3">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                    <h3 class="flaticon-house display-3 font-weight-normal text-secondary mb-3"><i class="fa-solid fa-dog"></i></h3>
                    <h3 class="mb-3">Dogs Adoption</h3>
                    <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam eos, rebum sit vero stet ipsum justo</p>
                    <a class="text-uppercase font-weight-bold" href="/animals">Read More</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                    <h3 class="flaticon-food display-3 font-weight-normal text-secondary mb-3"><i class="fa-solid fa-cat"></i></h3>
                    <h3 class="mb-3">Cats Adoption</h3>
                    <p>Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet, diam sea est magna diam eos, rebum sit vero stet ipsum justo</p>
                    <a class="text-uppercase font-weight-bold" href="/animals">Read More</a>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="d-flex flex-column text-center bg-white mb-2 p-3 p-sm-5">
                    <h3 class="flaticon-grooming display-3 font-weight-normal text-secondary mb-3"><i class="fa-solid fa-heart"></i></h3>
                    <h3 class="mb-3">Volunteer</h3>
                    <p>Volunteers play a vital role in our organization, caring for animals, taking photos, writing bios and more.</p>
                    <a class="text-uppercase font-weight-bold" href="/shelters">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="team-members">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Our Shelter Members</h2>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client1.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="https://www.facebook.com/tricountyhumanesociety"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/tricountyhumane"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.linkedin.com/company/tricountyhumanesociety/"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="https://www.instagram.com/tricountyhumanesociety/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>TCHS</h4>
                        <span>Minnesota</span>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing itaque corporis nulla.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client2.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="https://www.facebook.com/PetHavenMN"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://instagram.com/PetHavenMN"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.youtube.com/user/PetHavenMN1"><i class="fa fa-youtube"></i></a></li>
                                    <li><a href="https://twitter.com/PetHaven_MN"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>Pet Haven</h4>
                        <span>Minnesota</span>
                        <p>Foster-Based Animal Rescue.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client3.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="https://www.facebook.com/PetHavenMN"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://instagram.com/PetHavenMN"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://twitter.com/PetHaven_MN"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="https://www.tiktok.com/@pawsshelter?"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>Paws Shelter</h4>
                        <span>Texas</span>
                        <p>Find your new best friend today.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client4.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>Animal Care Centers</h4>
                        <span>New York</span>
                        <p>Find lovely homes for homeless and abandoned animals.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client5.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="https://www.facebook.com/LAAnimalServices"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/lacitypets"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="https://www.laanimalservices.com/shelters/"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="https://www.instagram.com/laanimalservices/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>West LA Animal Shelter</h4>
                        <span>California</span>
                        <p>LA Animal Services operates six animal shelters throughout the City of Los Angeles.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="team-member">
                    <div class="thumb-container">
                        <img src="../../pub/images/client6.jpg" alt="">
                        <div class="hover-effect">
                            <div class="hover-content">
                                <ul class="social-icons">
                                    <li><a href="https://www.facebook.com/LakelandAnimalShelter/"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://www.youtube.com/user/LakelandAnimalShelte"><i class="fa fa-youtube"></i></a></li>
                                    <li><a href="https://lakelandanimalshelter.org"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="https://www.instagram.com/lakelandanimalshelter/"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="down-content">
                        <h4>Lakeland Animal Shelter</h4>
                        <span>Wisconsin</span>
                        <p>No-kill humane society and animal rescue.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="alert alert-light">
    <div class="container text-center">
        Server Health Status: <b id="healthStatus">...</b>
    </div>
</div>

<script src="../../../pub/js/health.js"></script>

<jsp:include page="include/footer.jsp" />
