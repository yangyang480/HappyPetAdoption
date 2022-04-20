
<link rel="stylesheet" href="../../../../pub/style/shelter/home.css">

<!-- Page Content -->
<div class="page-heading products-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-content">
                    <h4>Hello, Shelter!</h4>
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
                        <a href="/shelter/home" class="text-decoration-none" style="color: #121212">
                            <li class="${requestScope['javax.servlet.forward.request_uri'] eq '/shelter/home' ? ' active' : ''}">All Animals</li>
                        </a>
                        <a href="/shelter/manage/animal" class="text-decoration-none" style="color: #121212">
                            <li data-filter=".des" class="${requestScope['javax.servlet.forward.request_uri'] eq '/shelter/manage/animal' ? ' active' : ''}">Create Animals</li>
                        </a>
                        <a href="/shelter/adoptions" class="text-decoration-none" style="color: #121212">
                            <li data-filter=".gra" class="${requestScope['javax.servlet.forward.request_uri'] eq '/shelter/adoptions' ? ' active' : ''}">Manage Adoptions</li>
                        </a>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>