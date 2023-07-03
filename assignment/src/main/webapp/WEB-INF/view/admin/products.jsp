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
            <h1 class="text-center my-3">Danh sách sản phẩm chính</h1>

            <div class="row">
                <button type="button" class="btn btn-primary mb-2 mx-auto w-25" data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    Thêm sản phẩm mới
                </button>
<%--                excel--%>
                <form action="/admin/products/importByExcel" method="post" enctype="multipart/form-data">
                    <input type="file" name="excel" placeholder="import excel">
                    <button type="submit" class="btn btn-primary">import By excel</button>
                </form>

                <div class="col-sm-12">
                    <form class="my-3 row">
                        <label for="nameSearch">Tên sản phẩm</label>
                        <input type="search" class="form-control w-50 me-2" name="searchProduct"
                               id="nameSearch" value="${param.searchProduct}">
                        <button class="btn btn-outline-primary w-25" type="submit" value="submit">search</button>
                    </form>

                    <form>
                        <label>Khoảng giá</label>
                        <input type="number" class=" w-25 me-2" name="firstPrice"
                               id="gia1" value="${param.firstPrice}" required> đến
                        <input type="number" class=" w-25 me-2" name="endPrice"
                               id="gia2" value="${param.endPrice}" required>
                        <button class="btn btn-outline-primary w-25" type="submit" value="submit">search</button>
                    </form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Image</th>
                            <th>Hãng</th>
                            <th>Màu Sắc</th>
                            <th>Danh mục</th>
                            <th>Mô tả</th>
                            <th>Ngày tạo</th>
                            <th>Trạng thái</th>
                            <th colspan="2"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products.getContent()}" var="product" varStatus="i">
                            <tr>
                                <td>${i.index+1}</td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>${product.quantity}</td>
                                <td>${product.image}</td>
                                <td>${product.brand.name}</td>
                                <td>${product.color.name}</td>
                                <td>${product.category.name}</td>
                                <td>${product.description}</td>
                                <td>${product.createDate}</td>
                                <td>${product.status eq 1?"Đang bán":"Ngừng bán"}</td>
                                <td>
                                    <button class="btn btn-outline-success" data-bs-toggle="modal"
                                            data-bs-target="#detailModal_${product.id}">
                                        <i class="fa-solid fa-eye"></i>
                                    </button>

                                    <button class="btn btn-outline-success" data-bs-toggle="modal"
                                            data-bs-target="#updateModal_${product.id}">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <button class="btn btn-outline-success" data-bs-toggle="modal"
                                            data-bs-target="#deleteModal_${product.id}">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <!-- Modal detail-->
                            <div class="modal fade" id="detailModal_${product.id}" tabindex="-1"
                                 aria-labelledby="detailModalLabel_${product.id}" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel_${product.id}">Chi tiết sản
                                                phẩm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close">
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-6">
                                                    <img src="<c:url value="/asset/img/${product.image}"/>"
                                                         class="img-fluid rounded" alt="có thể chứa 1 hình ảnh">
                                                </div>
                                                <div class="col-6">
                                                    <h3>${product.name}</h3>
                                                    <p class="my-3">Màu sắc:
                                                        <span class="badge bg-primary"> ${product.color.name}</span>
                                                    </p>
                                                    <p class="mb-3">Thương hiệu:
                                                        <span class="badge bg-primary"> ${product.brand.name}</span>
                                                    </p>
                                                    <p class="mb-3">Thể loại:
                                                        <span class="badge bg-primary"> ${product.category.name}</span>
                                                    </p>
                                                    <p class="mb-3">Giá bán:
                                                        <span class="badge bg-primary"> ${product.price}</span>
                                                    </p>
                                                    <p class="mb-3">Số lượng:
                                                        <span class="badge bg-primary"> ${product.quantity}</span>
                                                    </p>
                                                    <p class="mb-3">Tên ảnh:
                                                        <span class="badge bg-primary"> ${product.image}</span>
                                                    </p>
                                                    <p class="mb-3">Ngày tạo sản phẩm:
                                                        <span class="badge bg-primary"> ${product.createDate}</span>
                                                    </p>
                                                    <p class="mb-3">Ngày sửa sản phẩm:
                                                        <span class="badge bg-primary"> ${product.updatedDate}</span>
                                                    </p>
                                                    <p class="mb-3">Mô tả: <br>
                                                            ${product.description}
                                                    </p>
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
                            <!-- Modal delete-->
                            <div class="modal fade" id="deleteModal_${product.id}" tabindex="-1"
                                 aria-labelledby="deleteModalLabel_${product.id}" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteModalLabel_${product.id}">Xóa sản
                                                phẩm</h5>
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
                                            <a class="btn btn-danger" href="/admin/products/delete/${product.id}">Xác
                                                nhận</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal update-->
                            <div class="modal fade" id="updateModal_${product.id}" tabindex="-1"
                                 aria-labelledby="updateModalLabel_${product.id}" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="updateModalLabel_${product.id}">update sản
                                                phẩm</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <form action="/admin/products/${product.id}" method="post">
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <div class="mb-3">
                                                            <label for="nameUpdate1" class="form-label">Tên sản
                                                                phẩm</label>
                                                            <input type="text" class="form-control" id="nameUpdate1"
                                                                   name="name"
                                                                   value="${product.name}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="giaUpdate1" class="form-label">Giá</label>
                                                            <input type="number" class="form-control" min="1"
                                                                   id="giaUpdate1"
                                                                   name="price"
                                                                   value="${product.price}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label for="slUpdate1" class="form-label">Số lượng</label>
                                                            <input type="number" class="form-control" min="1"
                                                                   id="slUpdate1"
                                                                   name="quantity"
                                                                   value="${product.quantity}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Màu sắc</label>
                                                            <select class="form-select" name="color" id="msUpdate1">
                                                                <c:forEach items="${colors}" var="color">
                                                                    <option ${product.color.name eq color.name?"selected":""}
                                                                            value="${color.id}">${color.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <div class="form-label">Trạng thái</div>

                                                            <input id="dangBan" type="radio"
                                                                   name="status" ${product.status eq 1?"checked":""}
                                                                   value="1">
                                                            <label for="dangBan" class="form-label me-3">Đang
                                                                bán</label>

                                                            <input id="ngungBan" type="radio"
                                                                   name="status" ${product.status eq 0?"checked":""}
                                                                   value="0">
                                                            <label for="ngungBan" class="form-label">Ngưng bán</label>
                                                        </div>

                                                    </div>

                                                    <div class="col-sm-6">

                                                        <div class="mb-3">
                                                            <label class="form-label">Hãng</label>
                                                            <select class="form-select" name="brand">
                                                                <c:forEach items="${brands}" var="brand">
                                                                    <option ${product.brand.name eq brand.name?"selected":""}
                                                                            value="${brand.id}">${brand.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Danh mục</label>
                                                            <select class="form-select" name="category">
                                                                <c:forEach items="${categories}" var="category">
                                                                    <option ${product.category.name eq category.name?"selected":""}
                                                                            value="${category.id}">${category.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="imgUpdate1" class="form-label">Ảnh</label>
                                                            <input type="file" class="form-control" id="imgUpdate1"
                                                                   name="image"
                                                                   value="${product.image}">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="mtaUpdate1" class="form-label">Mô tả sản
                                                                phẩm</label>
                                                            <input type="text" class="form-control" id="mtaUpdate1"
                                                                   name="description"
                                                                   value="${product.description}">
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
                    <ul class="pagination justify-content-center ">
                        <li class=" page-item">
                            <a class="page-link ${products.getNumber() eq 0?"disable":""}"
                               href="?pageNumber=${products.getNumber()}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class=" page-item">
                    <span class="page-link">
                        <span aria-hidden="true">${products.getNumber()+1}</span>
                    </span>
                        </li>
                        <li class=" page-item">
                    <span class="page-link">
                        <span aria-hidden="true">${products.getTotalPages()}</span>
                    </span>
                        </li>

                        <li class="page-item">
                            <a class="page-link  ${products.getNumber() +1 eq products.getTotalPages()?"disable":""}"
                               href="?pageNumber=${products.getNumber()+2}"
                               aria-label="Next"

                            >
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <%--modal add product--%>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="false">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm sản phẩm</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <%--body  add product new --%>
                        <div class="modal-body">
                            <form action="/admin/products" method="post">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="mb-3">
                                            <label for="name" class="form-label">Tên sản phẩm</label>
                                            <input type="text" class="form-control" id="name" name="name" required>
                                        </div>

                                        <div class="mb-3">
                                            <label for="2" class="form-label">Giá</label>
                                            <input type="number" class="form-control" min="1" id="2" name="price"
                                                   required>
                                        </div>

                                        <div class="mb-3">
                                            <label for="sl" class="form-label">Số lượng</label>
                                            <input type="number" class="form-control" min="1" id="sl" name="quantity"
                                                   required>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Màu sắc</label>
                                            <select class="form-select" name="color">
                                                <c:forEach items="${colors}" var="color">
                                                    <option value="${color.id}">${color.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">

                                        <div class="mb-3">
                                            <label class="form-label">Hãng</label>
                                            <select class="form-select" name="brand">
                                                <c:forEach items="${brands}" var="brand">
                                                    <option value="${brand.id}">${brand.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Danh mục</label>
                                            <select class="form-select" name="category">
                                                <c:forEach items="${categories}" var="category">
                                                    <option value="${category.id}">${category.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="34" class="form-label">Ảnh</label>
                                            <input type="file" class="form-control" id="34" name="image" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="mta" class="form-label">Mô tả sản phẩm</label>
                                            <input type="text" class="form-control" id="mta" name="description"
                                                   required>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" onclick="return confirm(`Bạn chắc chắn muốn thêm`)"
                                        class="btn btn-primary">Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </main>
    </div>
</div>