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
<jsp:include page="../layout/_navbar.jsp"/>
<div class="container mt-4">
    <div class="row">
        <div class="col-sm-8 border">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Sản phẩm</th>
                    <th></th>
                    <th scope="col">Đơn giá</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${carts}" var="c" varStatus="i">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>
                            <img class="rouded" src="<c:url value="/asset/img/${c.product.image}"/>" alt=""
                                 style="height: 60px">
                        </td>
                        <td>${c.product.name}</td>
                        <td>
                            <fmt:formatNumber value="${c.product.price}" type="currency"
                                              pattern="###,###đ" currencyCode="VND"/>
                        </td>
                        <td>${c.quantityBuy}</td>
                        <td>
                            <fmt:formatNumber value="${c.product.price*c.quantityBuy}" type="currency"
                                              pattern="###,###đ" currencyCode="VND"/></td>
                        <td>
                            <a href="/cart/delete/${c.product.id}"><i class="fa-solid fa-trash-can"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
        <div class="col-sm-4 border">
            <span>Tổng tiền thanh toán:</span>
            <span class="float-end text-danger">
              <fmt:formatNumber value="${totalMoneyCart}" type="currency"
                                pattern="###,### đ" currencyCode="VND"/>
                </span>
            <br>
            <a href="/check-out" class="btn btn-outline-primary mt-3">Thanh Toán ngay </a>

        </div>
    </div>

    <div class="mt-5">
        <c:if test="${alert eq 'error'}">
            <div id="custom-alert" class="alert alert-danger custom-alert" role="alert">
                    ${alertMessage}
            </div>
        </c:if>
    </div>
</div>
<jsp:include page="../layout/_footer.jsp"/>
</body>
</html>