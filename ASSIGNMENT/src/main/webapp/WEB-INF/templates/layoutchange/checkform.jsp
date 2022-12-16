<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/docs/4.0/assets/img/favicons/favicon.ico">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/checkout/">
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link href="form-validation.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')
</script>
<script src="../../assets/js/vendor/popper.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<script src="../../assets/js/vendor/holder.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="py-5 text-center"></div>

		<div class="row">
			<div class="col-md-4 order-md-2 mb-4">

				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Sản phẩm của bạn</span> <span
						class="badge badge-secondary badge-pill">3</span>
				</h4>

				<ul class="list-group mb-3">
					<c:forEach var="item" items="${items}">
						<li
							class="list-group-item d-flex justify-content-between lh-condensed">
							<div>
								<h6 class="my-0">${item.name}</h6>
								<small class="text-muted">Số lượng: ${item.quantity}</small>
							</div> <span class="text-muted">${item.price}</span>
						</li>

						<li
							class="list-group-item d-flex justify-content-between bg-light">
							<div class="text-success">
								<small>Giảm giá: </small>
							</div> <span class="text-success">-${item.discount}%</span>
						</li>
					</c:forEach>
					<li class="list-group-item d-flex justify-content-between"><span>Tổng
							tiền</span> <strong>${total}</strong></li>
				</ul>
				
			</div>
			<div class="col-md-8 order-md-1">
			
				<h4 class="mb-3">Thông tin đặt hàng</h4>
				<form:form action="save/order" modelAttribute="item" method="POST">
					<div class="row">
						<div class="col-md-12 mb-6">
							<label>Họ và tên:</label> <input type="text" class="form-control"
								id="fullname" placeholder="" value="${user.fullname}" />
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
					</div>
					<div class="mb-3">
						<label>ID tài khoản:</label>
						<div class="input-group">
							<div class="input-group-prepend" readonly="true">
								<span class="input-group-text">@</span>
							</div>
							<form:input type="text" class="form-control" readonly="true" placeholder=""
								value="${user.id}" path="account.id" />
							<div class="invalid-feedback" style="width: 100%;">Your
								username is required.</div>
						</div>
					</div>
					<div class="mb-3">
						<label>Địa chỉ nhận hàng:</label>
						<form:input type="text" class="form-control"
							value="${user.address}" path="address" />
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>
					<div class="mb-3">
						<label>Tên tài khoản</label>
						<form:input type="text" class="form-control" readonly="true"
							value="${user.username}" path="username" />
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>
					<button class="btn btn-primary btn-lg btn-block" type="submit">Thanh toán</button>
					<h>${message}</h>
			</div>
			
			</form:form>
		</div>
	</div>
</body>
</html>