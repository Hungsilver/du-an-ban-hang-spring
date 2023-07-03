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

            <h1 class="text-center my-3">Danh sách tài khoản</h1>

            <div class="row">

                <div class="col-sm-12">
                    <form class="my-3 row">
                        <label for="searchAccount">Tên tài khoản</label>
                        <input type="search" class="form-control w-50 me-2" name="searchAccount"
                               id="searchAccount" value="${param.searchAccount}">
                        <button class="btn btn-outline-primary w-25" type="submit" value="submit">search</button>
                    </form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên người dùng</th>
                            <th>Địa chỉ</th>
                            <th>Số điện thoại</th>
                            <th>Ảnh</th>
                            <th>Trạng thái</th>
                            <th>Email</th>
                            <th>Mật khẩu</th>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="u" varStatus="i">
                            <tr>
                                <td>${i.index+1}</td>
                                <td>${u.name}</td>
                                <td>${u.address}</td>
                                <td>${u.phoneNumber}</td>
                                <td>${u.image}</td>
                                <td>${u.status}</td>
                                <td>${u.email}</td>
                                <td>${u.password}</td>
                                <td>

                                    <button class="btn btn-outline-success" data-bs-toggle="modal"
                                            data-bs-target="#updateModal_${u.id}">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <button class="btn btn-outline-success" data-bs-toggle="modal"
                                            data-bs-target="#deleteModal_${u.id}">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </tr>

                            <!-- Modal delete-->
                            <div class="modal fade" id="deleteModal_${u.id}" tabindex="-1"
                                 aria-labelledby="deleteModalLabel_${u.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel_${u.id}">Xóa sản phẩm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Bạn có chắc chắn muốn xóa sản phẩm này?</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Hủy
                                            </button>
                                            <a class="btn btn-danger" href="/admin/user/delete/${u.id}">Xác nhận</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal update-->
                            <div class="modal fade" id="updateModal_${u.id}" tabindex="-1"
                                 aria-labelledby="updateModalLabel_${u.id}" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="updateModalLabel_${u.id}">update sản phẩm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <form action="/admin/user/${u.id}" method="post">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="mb-3">
                                                            <label for="nameUpdate1" class="form-label">Tên sản
                                                                phẩm</label>
                                                            <input type="text" class="form-control" id="nameUpdate1"
                                                                   name="name"
                                                                   value="${u.name}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="giaUpdate1" class="form-label">email</label>
                                                            <input type="email" class="form-control" min="1"
                                                                   id="giaUpdate1"
                                                                   name="price"
                                                                   value="${u.email}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="slUpdate1" class="form-label">số điẹn
                                                                thoại</label>
                                                            <input type="number" class="form-control" min="1"
                                                                   id="slUpdate1"
                                                                   name="quantity"
                                                                   value="${u.phoneNumber}">
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6">


                                                        <div class="mb-3">
                                                            <label for="imgUpdate1" class="form-label">Ảnh</label>
                                                            <input type="file" class="form-control" id="imgUpdate1"
                                                                   name="image"
                                                                   value="${u.image}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="mtaUpdate1" class="form-label">mật khẩu</label>
                                                            <input type="password" class="form-control" id="mtaUpdate1"
                                                                   name="description"
                                                                   value="${u.password}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                    Hủy
                                                </button>
                                                <button class="btn btn-success" type="submit"
                                                        onclick="return confirm(`Bạn chắc chắn muốn update`)">Xác nhận
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </main>
    </div>
</div>