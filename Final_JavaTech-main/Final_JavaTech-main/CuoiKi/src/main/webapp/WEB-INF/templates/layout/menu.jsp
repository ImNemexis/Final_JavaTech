<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/assets/css/owl.css">
<script src="/vendor/jquery/jquery.min.js"></script>
<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/assets/js/custom.js"></script>
<script src="/assets/js/owl.js"></script>
<script src="/assets/js/slick.js"></script>
<script src="/assets/js/isotope.js"></script>
<script src="/assets/js/accordions.js"></script>
</head>
<body>
	<header class="" style="background-color: #034694">
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a class="navbar-brand mt-1" href="/Home/views"><h2>Minh Huy Computer</h2></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">

						<li class=""><a class="nav-link" href="/Home/views">Trang chủ</a> <span class="sr-only">(current)</span> </a></li>
						<li class="nav-item "><a class="nav-link" href="/Home/product">Sản phẩm</a></li>
						<li class="nav-item"><a class="nav-link" href="/Home/contact">Liên hệ</a></li>
						<c:if test="${user==null}">
							<li class="nav-item"><a class="nav-link"
								href="/account/login">Đăng nhập</a> <%--                            <a class="nav-link" href="/account/register">Sign Up </a>--%>
							</li>
						</c:if>
						<li class="nav-item ml-1">
							<div class="dropdown">
								<a class="nav-link" href="" role="" id="dropdownMenuLink"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> ${user.username} </a>

								<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<a class="dropdown-item" href="/Home/Account/Edit/${user.username}">Cá nhân</a>
									<a class="dropdown-item" href="/Home/YourCart/${user.id}">Giỏ hàng</a>
									<a class="dropdown-item" href="/account/logout">Đăng xuất</a>
								</div>
							</div>
						</li>
						<li class="nav-item"><a style="padding-left: 10px;"
							class="nav-icon position-relative text-decoration-none"
							href="/shoppingcart/index"> <i
								class="fa fa-fw fa-cart-arrow-down text-white mr-1 mt-3"></i> <span
								style="margin-top: 15px; height: 15px; width: 13px; background: red;"
								class="position-absolute  badge rounded-pill text-dark"><b
									style="color: white; size: 11px; margin-left: -2px;">${NoOfItem}</b></span>
						</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<script>
		$(document).ready(function() {
			$("a[href*=lang]").on("click", function() {
				var param = $(this).attr("href");
				$.ajax({
					url : "/Home/views" + param,
					success : function() {
						location.reload();
					}
				});
				return false;
			})
		})
	</script>
</body>
</html>