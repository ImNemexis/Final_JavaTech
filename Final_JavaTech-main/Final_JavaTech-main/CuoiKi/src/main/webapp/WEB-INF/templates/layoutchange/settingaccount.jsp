<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/assets/css/owl.css">
</head>
<body>
	<div class="banner header-text"></div>
	
	<div class="latest-products mt-5">
    <div class="container">

        <div class="content">
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="image">
                        </div>
                        <div class="card-body">
                            <div class="author">
                                <a href="/Admin/Views">
                                    <img class="avatar border-gray" src="https://img.icons8.com/ios-filled/512/cat-profile.png" style="width: 150px ; height: 150px; margin-left: auto; margin-right: auto; display: block;">
                                    <h5 class="text-center">${user.username}</h5>
                                </a>
                            </div>
							<p class="description text-center">${user.email}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card card-user">
                        <div class="card-header">
                            <h5 class="card-title">Chỉnh sửa tài khoản</h5>
                        </div>
                        <div class="card-body">
                            <form:form action="/Home/Account/Update" modelAttribute="item"  method="post" enctype="multipart/form-data">
                            <div class="row">

                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Tên tài khoản</label>
                                        <form:input type="text" class="form-control" name="username"  placeholder="Username"  path="username" readonly="true"/>
                                        <form:errors path="username"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Mật khẩu</label>
                                        <form:input type="password" class="form-control" placeholder="password" value="" path="password"/>
                                        <form:errors path="password"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Họ và tên</label>
                                        <form:input type="text" class="form-control" placeholder="fullname" value="" path="fullname"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Email cá nhân</label>
                                        <form:input type="text" class="form-control" placeholder="email" value="" path="email"/>
                                        <form:errors path="email"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Địa chỉ nhận hàng</label>
                                        <form:input type="text" class="form-control" placeholder="address" value="" path="address"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <form:input type="text" class="form-control" placeholder="phone" value="" path="phone"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <form:input type="hidden" class="form-control" placeholder="Username" value="" path="activated"/>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-group">
                                        <form:input type="hidden" class="form-control" placeholder="Username" value="" path="admin"/>
                                    </div>
                                </div>
								<div class="col-4"></div>
								<div class="col-4"></div>
                                <div class="col-4">
                                    <div class="create ml-auto mr-auto">
                                        <form:button style="margin-left: auto; margin-right: auto; display: block;" type="submit ml-4" class="btn btn-primary">Xác nhận</form:button>
                                    </div>
                                    <div class="update ml-auto mr-auto">
                                    </div>
                                </div>
                                <div class="col-4"></div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>