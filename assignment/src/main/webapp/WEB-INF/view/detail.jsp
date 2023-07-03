<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/621068b4a4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/css/alert.css"/>">
    <title>Chi tiết sản phẩm</title>
</head>
<body>

<jsp:include page="layout/_navbar.jsp"/>
<div class="container mt-4">
    <div class="row">
        <div class="col-sm-5">
            <div class="card">
                <img src="/asset/img/${product.image}" class="card-img-top">
            </div>
        </div>
        <div class="col-sm-7 ps-4">

            <p>Thương Hiệu: <span class="badge bg-black"> ${product.brand.name}</span></p>

            <h3>${product.name}</h3>

            <h2 class="my-5 text-danger">
                <fmt:formatNumber value="${product.price}" type="currency"
                                  pattern="###,### đ" currencyCode="VND"/>
            </h2>
            <p class="mb-3">Màu sắc: <span class="badge bg-primary"> ${product.color.name}</span>
            </p>

            <p class="mb-5">Loại: <span class="badge bg-info">${product.category.name}</span></p>

            <%--            //add cart--%>
            <form action="/cart/${product.id}" method="post">
                <div class="input-group flex-nowrap my-5 w-50">
                    <span class="input-group-text" id="addon-wrapping">Số lượng:</span>
                    <input type="number" name="quantityBuy" class="form-control" min="1" value="1"
                           aria-describedby="addon-wrapping">
                </div>
                <button type="submit" class="btn btn-success me-2">Thêm vào giỏ hàng</button>
                <%-- <a href="/cart" type="button" class="btn btn-danger">Đi tới giỏ hàng</a>--%>
            </form>
        </div>
    </div>

    <jsp:include page="layout/_footer.jsp"/>

    <script src="<c:url value="/js/alert.js"/>"></script>
</div>
</body>
</html>