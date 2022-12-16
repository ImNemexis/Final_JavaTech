<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Minh Huy Computer</title>
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/assets/css/owl.css">


</head>
<body>
	<tiles:insertAttribute name="menu" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />

	<script src="/vendor/jquery/jquery.min.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/assets/js/custom.js"></script>
	<script src="/assets/js/owl.js"></script>
	<script src="/assets/js/slick.js"></script>
	<script src="/assets/js/isotope.js"></script>
	<script src="/assets/js/accordions.js"></script>

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