<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy Pet Adoption</title>
    <link rel="icon" type="image/x-icon" href="../../pub/images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/30c6872bce.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../pub/style/main.css">
    <link rel="stylesheet" href="../../../pub/style/header.css">
</head>

<body class="bg-light">

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
                        <a class="nav-link ${requestScope['javax.servlet.forward.request_uri'] eq '/' or requestScope['javax.servlet.forward.request_uri'] eq '/home' ? ' active' : ''}" href="/home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/shelters') ? ' active' : ''}" href="/shelters">Shelters</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/animals') ? ' active' : ''}" href="/animals">Animals</a>
                    </li>
                    <li class="nav-item">
                        <sec:authorize access="hasAuthority('Shelter')">
                            <a class="nav-link ${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/shelter/home') ? ' active' : ''}" href="/shelter/home">My Page</a>
                        </sec:authorize>
                    </li>
                </ul>

                <span class="navbar-text">
                    <small>
                        <sec:authorize access="!isAuthenticated()">
                            <i class="fa-solid fa-circle-user fa-lg "></i> &nbsp
                            <a href="/user/login" class="login link-primary"> Login</a> /
                            <a href="/user/register" class="link-primary">Register</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <a href="/user/profile" class="link-primary">Welcome, <sec:authentication property="name"/>!</a>
                        </sec:authorize>
                    </small>
                </span>
            </div>
        </div>
    </nav>
</div>

