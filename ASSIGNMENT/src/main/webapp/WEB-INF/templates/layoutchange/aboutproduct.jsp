<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/assets/css/owl.css">
</head>
<body>
	<div class="page-heading about-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h2>Thông tin sản phẩm</h2>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="best-features about-features">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>Sản phẩm đã chọn</h2>
					</div>
				</div>
				<div class="col-md-6">
					<div class="right-image">
						<img src="/static/upload/${item.image}" alt="">
					</div>
				</div>
				<div class="col-md-6">
					<div class="left-content">
						<h4>${item.name}</h4>
						<p>${item.about}</p>
						<p>Giá tiền: ${item.price}</p>
						<p>Giảm giá: ${item.discount}%</p>
						<p>Giảm còn: ${item.price*(100-item.discount)*0.01}</p>
						<%--                    <p>${item.available}</p>--%>
						<a class="filled-button" href="/shoppingcart/add/${item.id}">Đặt hàng</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="team-members">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h2>Các sản phẩm tương tự</h2>
					</div>
				</div>
				<c:forEach var="pro" items="${procate}">
					<div class="col-md-4">
						<div class="team-member">
							<div class="thumb-container">
								<img src="/static/upload/${pro.image}" alt="">
							</div>
							<div class="down-content">
								<h4 href="/Home/product/about/${pro.id}">
									<h4>${pro.name}</h4>
								</h4>
								<span>${pro.category.name}</span>
								<p>${pro.about}</p>
								</br>
								<a class="filled-button" href="/Home/product/about/${pro.id}">Xem</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/owl.js"></script>
	<script src="/assets/js/slick.js"></script>
	<script src="/assets/js/isotope.js"></script>
	<script src="/assets/js/accordions.js"></script>
</body>
</html>