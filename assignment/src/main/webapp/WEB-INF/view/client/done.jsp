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
        <h1 class="text-center">Thanh toán đơn hàng thành công</h1>
    </div>

    <jsp:include page="../layout/_footer.jsp"/>

    <script src="<c:url value="/js/alert.js"/>"></script>
</div>
</body>
</html>