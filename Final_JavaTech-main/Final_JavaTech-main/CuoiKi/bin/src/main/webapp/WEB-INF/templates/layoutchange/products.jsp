<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
	<div class="page-heading products-heading header-text">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="text-content">
						<h2>Tất cả sản phẩm</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="filters">
						<form class="form-inline my-2 my-lg-0 " action="/product/search"
							method="post">
							<input type="search" class="form-control" value="${keywords}" name="keywords" placeholder="Bạn muốn tìm gì?"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="submit"
									id="button-addon2">Tìm</button>
							</div>
							<ul>
								<c:forEach var="cate" items="${categories}">
									<li><a href="/Product/add/${cate.id}">${cate.name}</a></li>
								</c:forEach>
								<li><a href="/Home/product/sort?field=price"
									style="color: #f33f3f">Từ thấp đến cao</a></li>
								<li><a href="/Home/product/sortdesc?field=price"
									style="color: #f33f3f">Từ cao đến thấp</a></li>
							</ul>
						</form>
					</div>
				</div>
				<c:forEach var="item" items="${page.content}">
					<div class="col-3">
						<div class="product-item">
							<a href="#"><img src="/static/upload/${item.image}" alt=""></a>
							<div class="down-content">
								<a href="/Home/product/about/${item.id}"><h4>${item.name}</h4></a>
								<a>Giá tiền: ${item.price}</a> <br>
								<h7>Giảm còn: ${item.price*(100-item.discount)*0.01}</h7>
								<ul class="stars">
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
									<li><i class="fa fa-star"></i></li>
								</ul>
								</br> <a class="filled-button" href="/Home/product/about/${item.id}">Xem</a>
							</div>
						</div>
					</div>
				</c:forEach>

				<div class="col-md-12">
					<ul class="pages">
						<li><a href="/Home/product?p=0">1</a></li>
						<li><a href="/Home/product?p=1">2</a></li>
						<li><a href="/Home/product?p=2">3</a></li>
						<li><a href="/Home/product?p=3">4</a></li>
						<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


	<!-- Additional Scripts -->
	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/owl.js"></script>
	<script src="/assets/js/slick.js"></script>
	<script src="/assets/js/isotope.js"></script>
	<script src="/assets/js/accordions.js"></script>
</body>
</html>