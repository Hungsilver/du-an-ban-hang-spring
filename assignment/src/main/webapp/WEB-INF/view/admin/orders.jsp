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
    <title>dash broard </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/621068b4a4.js" crossorigin="anonymous"></script>
</head>

<body>
<jsp:include page="../layout-dashbroad/_headerDB.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout-dashbroad/_asideDB.jsp"/>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <jsp:include page="../layout-dashbroad/_navbarDB.jsp"/>
            <%--            write here          --%>
            <h1 class="text-center mb-5">Hóa đơn</h1>
            <table class="table">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Tên người mua</th>
                    <th>địa chỉ</th>
                    <th>Số điện thoại</th>
                    <th>Tổng tiền hóa đơn</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th colspan="2"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order" varStatus="i">
                    <tr>
                        <td>${i.index+1}</td>
                        <td>${order.user.name}</td>
                        <td>${order.address}</td>
                        <td>${order.phoneNumber}</td>
                        <td>${order.totalMoney}</td>
                        <td>${order.createDate}</td>
                        <td>${order.status==1?"Đã thanh toán":"Đã hủy"}</td>
                        <td>
                            <button class="btn btn-outline-success" data-bs-toggle="modal"
                                    data-bs-target="#detailModal_${order.id}">
                                <i class="fa-solid fa-eye"></i>
                            </button>
                        </td>
                    </tr>
                    <!-- Modal detail-->
                    <div class="modal fade" id="detailModal_${order.id}" tabindex="-1"
                         aria-labelledby="detailModalLabel_${order.id}" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="deleteModalLabel_${order.id}">Chi tiết Hoa don</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <p class="my-3">Người mua:
                                                <span class="badge bg-primary"> ${order.user.name}</span>
                                            </p>
                                            <p class="mb-3">Địa chỉ:
                                                <span class="badge bg-primary"> ${order.user.address}</span>
                                            </p>
                                            <p class="mb-3">Số điện thoại:
                                                <span class="badge bg-primary"> ${order.user.phoneNumber}</span>
                                            </p>
                                            <p class="mb-3">Tổng tiền hóa đơn:
                                                <span class="badge bg-primary"> ${order.totalMoney}</span>
                                            </p>
                                            <p class="mb-3">Ngày tạo:
                                                <span class="badge bg-primary"> ${order.createDate}</span>
                                            </p>
                                            <p class="mb-3">Trạng thái:
                                                <span class="badge bg-primary"> ${order.status==1?"Đã thanh toán":"Đã hủy"}</span>
                                            </p>
                                        </div>
                                        <div class="col-6">
                                            <h4>Danh sách sản phẩm trong hóa đơn</h4>
                                            <c:forEach items="${order.ordersDetails}" var="item">
                                                <p>Tên sản phẩm: ${item.product.name}</p>
                                                <p>Số lượng sản phẩm: ${item.quantity}</p>
                                                <p>Giá sản phẩm: ${item.price}</p>
                                                <hr>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</div>