<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<jsp:include page="include/header.jsp" />
<link rel="stylesheet" href="../../pub/style/shelter.css">


<div class="page-heading products-heading header-text">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-content">
                    <h4>Hello!</h4>
                    <h2>Feel free to check it out!</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="main-content bg-light">
    <div class="container-lg album py-5">
        <form class="row row-cols-lg-auto g-3 mb-3 align-items-center" action="/shelters" method="get">
            <div class="col-12">
                <div class="input-group">
                <div class="input-group-text">Name</div>
                    <input class="form-control me-2" type="text" name="name" placeholder="Hospital Name"
                        aria-label="Search" id="shelterSearchBox" value="${name}">
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Search</button>
            </div>
        </form>

        <c:if test="${not empty name}">
            <h5>Search Results Found ${userModelKey.size()}</h5>
            <br>
        </c:if>

        <table class="table" id="shelterTable">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Email</th>
                    <th scope="col">Phone</th>
                </tr>

                <c:forEach items="${userModelKey}" var="user">
                    <tr scope = "row">
                        <td>${user.name}</td>
                        <td>${user.address}</td>
                        <td>${user.email}</td>
                        <td>${user.phone}</td>
                    </tr>
                </c:forEach>

            </thead>
        </table>
    </div>
</div>

<jsp:include page="include/footer.jsp" />

