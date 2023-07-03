<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <jsp:include page="../layout/_header.jsp"/>
    <title>Document</title>
</head>
<body>
<jsp:include page="../layout/_navbar.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-7">

            <div>Số điện thoại:${user.phoneNumber}</div>
            <div>Tên${user.name}</div>
            <div>Địa chỉ:${user.address}</div>
        </div>
        <div class="col-5">
            <p>Thanh toán COD</p>
            <p>Tổng tiền hóa đơn:
                <fmt:formatNumber value="${totalMoneyOrder}" type="currency"
                                  pattern="###,###đ" currencyCode="VND"/>
            </p>
            <form method="post">
                <button type="submit">Hoàn tất thanh toán</button>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../layout/_footer.jsp"/>
</body>
</html>
