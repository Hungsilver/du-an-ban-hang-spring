<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="description" content="elopers">
    <meta name="author" content="ssd">
    <script src="https://kit.fontawesome.com/621068b4a4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


</head>

<body>
<div class="container">
    <%--    alert error--%>
    <c:if test="${not empty alert}">
        <div class="alert alert-warning text-center mt-2" role="alert">
                ${alert}
        </div>
    </c:if>
    <%--    form--%>
    <form class="w-25 mx-auto mt-4 border-1" method="post">
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input name="email" type="text" class="form-control">
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input name="password" type="password" class="form-control">
        </div>

        <button class="btn btn-success w-100 " type="submit">Login</button>

    </form>

    <button class="" data-bs-toggle="modal"
            data-bs-target="#forgotModal"> Quên mật khẩu
    </button>
    <div class="mb-4">
        <a href="/register" class="form-label float-center">register</a>
    </div>

    <div class="modal fade" id="forgotModal" tabindex="-1"
         aria-labelledby="forgotModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="forgotModal1">Quên mật khẩu
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <form action="/forgot-pass" method="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="passOld" class="form-label">Email
                            </label>
                            <input type="text" class="form-control" id="passOld"
                                   name="email">
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
</body>
</html>

