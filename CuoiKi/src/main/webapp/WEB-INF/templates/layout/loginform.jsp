<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<style>
.login-form {
	width: 340px;
	margin: 50px auto;
	font-size: 15px;
}

.login-form form {
	margin-bottom: 15px;
	background: #f7f7f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.login-form h2 {
	margin: 0 0 15px;
}

.form-control, .btn {
	min-height: 38px;
	border-radius: 2px;
}

.btn {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="login-form">
		<form action="/account/login" method="post">
			<h2 class="text-center">Đăng nhập</h2>
			<div class="form-group">
				<input type="text" class="form-control" name="username" placeholder="Tên đăng nhập" required="required">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="password" placeholder="Mật khẩu" required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
			</div>
			<div class="clearfix">
				<label class="float-left form-check-label"><input type="checkbox">Lưu tài khoản</label>
				<a href="/account/passwordMail" class="float-right">Quên mật khẩu?</a>
			</div>
		</form>
		<p class="text-center">
			Bạn có muốn<a href="/account/register"> đăng ký </a>tài khoản?
		</p>
		<b><i>${message}${param.error}</i></b>
	</div>
</body>
</html>