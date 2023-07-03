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
    <title>Profile</title>
</head>
<body>
<jsp:include page="../layout/_navbar.jsp"/>
<div>
    email: ${user.email} <br>
    anh: ${user.image} <br>
    ten: ${user.name} <br>
    sdt: ${user.phoneNumber} <br>
    dia chi: ${user.address} <br>

    <button class="btn btn-outline-success" data-bs-toggle="modal"
            data-bs-target="#updateModal_${user.id}">
        <i class="fa-solid fa-pen-to-square"></i>
    </button>

    <button class="btn btn-outline-success" data-bs-toggle="modal"
            data-bs-target="#updatePassModal_${user.id}"> đổi mật khẩu
        <i class="fa-solid fa-pen-to-square"></i>
    </button>

    <div class="modal fade" id="updateModal_${user.id}" tabindex="-1"
         aria-labelledby="updateModalLabel_${user.id}" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel_${user.id}">update profile
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <form action="/user/profile/${user.id}" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3">
                                    <label for="nameUpdate1" class="form-label">Tên
                                    </label>
                                    <input type="text" class="form-control" id="nameUpdate1"
                                           name="name"
                                           value="${user.name}">
                                </div>

                                <div class="mb-3">
                                    <label for="giaUpdate1" class="form-label">email</label>
                                    <input type="text" class="form-control" min="1"
                                           id="giaUpdate1"
                                           name="email"
                                           value="${user.email}">
                                </div>

                                <div class="mb-3">
                                    <label for="slUpdate1" class="form-label">Dia chi</label>
                                    <input type="text" class="form-control" min="1"
                                           id="slUpdate1"
                                           name="address"
                                           value="${user.address}">
                                </div>

                            </div>

                            <div class="col-sm-6">

                                <div class="mb-3">
                                    <label for="imgUpdate1" class="form-label">Ảnh</label>
                                    <input type="file" class="form-control" id="imgUpdate1"
                                           name="image"
                                           value="${user.image}">
                                </div>
                                <div class="mb-3">
                                    <label for="imgUpdate3" class="form-label">phone Number</label>
                                    <input type="text" class="form-control" id="imgUpdate3"
                                           name="phoneNumber"
                                           value="${user.phoneNumber}">
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
</div>

<%--    modal update pass--%>
<div class="modal fade" id="updatePassModal_${user.id}" tabindex="-1"
     aria-labelledby="updateModalLabel_${user.id}" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel_${user.id}">update pass
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <form action="/user/profile/changePass/${user.id}" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="passOld" class="form-label">mật khẩu cũ
                        </label>
                        <input type="password" class="form-control" id="passOld"
                               name="passOld">
                    </div>
                    <div class="mb-3">
                        <label for="passNew" class="form-label">mật khẩu mới
                        </label>
                        <input type="password" class="form-control" id="passNew"
                               name="passNew">
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
</div>

<jsp:include page="../layout/_footer.jsp"/>
</body>
</html>