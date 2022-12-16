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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
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
						<h2>Ưu đãi ngập tràn</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container mb-4">
		<div class="row">
			<div class="col-12">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col" >STT</th>
								<th scope="col" class="text-center">Tên sản phẩm</th>
								<th scope="col" class="text-center">Số lượng</th>
								<th scope="col"></th>
								<th scope="col" class="text-center">Giá tiền</th>
								<th scope="col" class="text-center">Giảm</th>
								<th scope="col" class="text-center">Xóa</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="no" value="1"></c:set>
							<c:forEach var="item" items="${items}">
								<form action="/shoppingcart/update" method="post">
									<tr>
										<td>${no}</td>
										<td><a href="/user/add/${item.id}">${item.name}</a></td>
										<td><input type="hidden" name="id" value="${item.id}">
											<input type="number" value="${item.quantity}" name="quantity" onblur="this.form.submit()">
										</td>
										<td></td>
										<td>${item.price}+100</td>
										<td>${item.price - (item.price*(100-item.discount)*0.01)}</td>
										<td class="text-right"><a class="fa fa-trash" href="/remove/${item.id}"></a></td>
									</tr>
								</form>
								<c:set var="no" value="${no + 1}"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="col mb-2">
				<div class="row">
					<div class="col-sm-12  col-md-4"></div>
					<div class="col-sm-12 col-md-4 text-center">
						<br><br>
						<h2>Tổng tiền: ${total}</h2>
						<a class="btn btn-lg btn-block btn-success text-uppercase" href="/shoppingcart/save">Thanh toán</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Additional Scripts -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/owl.js"></script>
	<script src="/assets/js/slick.js"></script>
	<script src="/assets/js/isotope.js"></script>
	<script src="/assets/js/accordions.js"></script>
</body>
</html>