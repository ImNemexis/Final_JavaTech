<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="apple-touch-icon" sizes="76x76"
	href="/assets2/imgadmin/apple-icon.png">
<link rel="icon" type="image/png" href="/assets2/imgadmin/favicon.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">

<link href="/assets2/cssadmin/bootstrap.min.css" rel="stylesheet" />
<link href="/assets2/cssadmin/paper-dashboard.css?v=2.0.1"
	rel="stylesheet" />

<link href="/assets2/demoadmin/demo.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper ">
		<div class="sidebar" data-color="white" data-active-color="danger">
		<br><br><br><br>
			<div class="logo">
				<a href="" class="simple-text logo-mini">
					<div class="logo-image-small">
						<img
							src="https://thumbs.dreamstime.com/b/admin-icon-trendy-design-style-isolated-white-background-vector-simple-modern-flat-symbol-web-site-mobile-logo-app-135742404.jpg">
					</div>
				</a> <a href="/Admin/Views" class="simple-text logo-normal">ADMIN</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li><a href="/Admin/Category"><p>Danh mục hàng</p>
					</a></li>
					<li><a href="/Admin/Table"><p>Danh sách sản phẩm</p>
					</a></li>
					<li><a href="/Admin/Account"><p>Quản lí tài khoản</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<tiles:insertAttribute name="menuadmin" />
			<tiles:insertAttribute name="bodyadmin" />
			<tiles:insertAttribute name="footeradmin" />
		</div>

	</div>
	<script src="/assets2/jadmin/core/jquery.min.js"></script>
	<script src="/assets2/jadmin/core/popper.min.js"></script>
	<script src="/assets2/jadmin/core/bootstrap.min.js"></script>
	<script src="/assets2/jadmin/plugins/perfect-scrollbar.jquery.min.js"></script>

	<script>
    $(document).ready(function() {
        demo.initChartsPages();
    });
</script>
</body>
</html>