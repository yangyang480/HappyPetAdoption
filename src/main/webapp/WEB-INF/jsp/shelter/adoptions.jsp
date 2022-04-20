<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<link rel="stylesheet" href="../../../pub/style/shelter/home.css">
<link rel="stylesheet" href="../../../pub/style/shelter/manage.css">

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
<div class="shelter main-content">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="filters">
                    <ul>
                        <a href="/shelter/home" style="text-decoration: none; color: #121212"><li data-filter="*">All Animals</li></a>
                        <a href="/shelter/manage/animal" style="text-decoration: none; color: #121212"><li class="data-filter=.des" >Create Animals</li></a>
                        <a href="/shelter/adoptions" style="text-decoration: none; color: #121212"><li class="active" data-filter=".gra">Manage Adoptions</li></a>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>