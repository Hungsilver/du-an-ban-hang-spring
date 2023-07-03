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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
<jsp:include page="../layout-dashbroad/_headerDB.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout-dashbroad/_asideDB.jsp"/>
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <jsp:include page="../layout-dashbroad/_navbarDB.jsp"/>
            <%--            write here          --%>
            <div class="btn-group float-end" role="group">
                <input class="input me-2" type="date" name="date">
                <button id="btnGroupDrop1" type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle"
                        data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                         class="feather feather-calendar align-text-bottom" aria-hidden="true"
                         data-darkreader-inline-stroke="" style="--darkreader-inline-stroke: currentColor;">
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                        <line x1="16" y1="2" x2="16" y2="6"></line>
                        <line x1="8" y1="2" x2="8" y2="6"></line>
                        <line x1="3" y1="10" x2="21" y2="10"></line>
                    </svg>
                    Theo
                </button>
                <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <li><a class="dropdown-item" href="/admin">Tổng</a></li>
                    <li><a class="dropdown-item" href="/admin/forDay">Theo ngày</a></li>
                    <li><a class="dropdown-item" href="/admin/forWeek">Theo tuần</a></li>
                    <li><a class="dropdown-item" href="/admin/forMonth">Theo tháng</a></li>
                </ul>
            </div>
            <table>
                <thead>
                <tr>
                    <th>ID sp</th>
                    <th>Tên sp</th>
                    <th>số lượng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listSP}" var="item">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.totalQuantity}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <canvas id="columnChart"></canvas>

            <script type="text/javascript">
                // truyền từ Spring Boot
                var data =
                ${listTotal}
                /*  truyền từ Spring Boot */
                var customLabels = ${listId};

                /* Tạo biểu đồ cột */
                var ctx = document.getElementById('columnChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: customLabels, // Tên các sản phẩm
                        datasets: [{
                            label: 'Số lượng sp bán được',
                            data: data,
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 1,
                                    precision: 0
                                }
                            }
                        }
                    }
                });
            </script>
        </main>
    </div>
</div>