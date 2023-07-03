<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>

    <!-- Meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/621068b4a4.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="container">
    <form class="w-25 mx-auto mt-4 border-1" method="post" modelAttributes="user">
        <div class="mb-3">
            <label class="form-label"> Name</label>
            <input name="name" type="text" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input name="email" type="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input name="password" type="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input name="phoneNumber" type="number" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">address</label>
            <input name="address" type="text" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">address</label>
            <input name="image" type="file" class="form-control">
        </div>
        <button class="btn btn-success w-100 mt-3" type="submit">Register</button>
    </form>
</div>
</body>
</html>

