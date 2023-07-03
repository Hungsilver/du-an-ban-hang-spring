<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="link" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <jsp:include page="layout/_header.jsp"/>
    <title>Trang chủ</title>
</head>
<body>

<jsp:include page="layout/_navbar.jsp"/>
<div class="container-fluid">

    <h2 class=" text-center color-primary">Móc Chìa Khóa HOT 2023</h2>


    <div class="row mt-5">
        <c:forEach items="${products.getContent()}" var="product">
            <a href="/detail/${product.id}" class="col-sm-3 mb-3 decoration">
                <div class="card p-3 hoverFocus">
                    <div class="card-image">
                        <img src="/asset/img/${product.image}" class="card-img-top " alt="...">
                    </div>
                    <div class="card-body" style="height: 150px">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text mt-3 text-danger">
                            <fmt:formatNumber value="${product.price}" type="currency"
                                              pattern="###,### đ" currencyCode="VND"/>
                        </p>
                    </div>
                </div>
            </a>
        </c:forEach>
    </div>

    <nav>
        <ul class="pagination justify-content-center ">
            <li class=" page-item">
                <a class="page-link decoration ${products.getNumber()==0?'disable':''} "
                   href="${pageContext.request.contextPath}/home?pageNumber=${products.getNumber()}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach begin="1" end="${products.getTotalPages()}" varStatus="i">
                <li class="page-item">
                    <a class="page-link decoration"
                       href="${pageContext.request.contextPath}/home?pageNumber=${i.index}">
                            ${i.index}
                    </a>
                </li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link decoration ${products.getNumber()+1==products.getTotalPages()?'disable':''}"
                   href="${pageContext.request.contextPath}/home?pageNumber=${products.getNumber() +2}"
                   aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
    <jsp:include page="layout/_footer.jsp"/>

</div>
</body>
</html>