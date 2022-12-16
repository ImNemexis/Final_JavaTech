<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                <a href="#">
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
                            <h5 class="card-title">Sản phẩm của bạn</h5>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col">Tài khoản</th>
                                    <th scope="col">Ngày mua</th>
                                    <th scope="col">Địa chỉ nhận hàng</th>
                                    <th scope="col">Tình trạng đơn hàng</th>
                                    <th scope="col">Xác nhận</th>
                                    <th scope="col">Giá tiền</th>
                                    <th scope="col">Thêm</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${items}">
                                <tr>
                                    <td>${item.username}</td>
                                    <td>${item.createDate}</td>
                                    <td>${item.address}</td>
                                    <td>${item.available?"Ordered":"Cancel"}</td>
                                    <td>${item.confirm?"Confirmed":"Cancel"}</td>
                                    <td>${item.price}</td>
                                    <td><a href="/Home/YourCart/Details/${item.id}">Chi tiết</a>
                                        <a href="/Home/YourCart/Cancel/${item.id}">Hủy đơn</a></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>