<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card ">
					<div class="card-header ">
						<h5 class="card-title">Thống kê mặt hàng</h5>
					</div>
					<div class="card-body ">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col">Username</th>
									<th scope="col">Address</th>
									<th scope="col">Price</th>
									<th scope="col">Available</th>
									<th scope="col">Confirm</th>
									<th scope="col">CreateDate</th>
									<th scope="col">Details / Confirmed</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${items}">
								<tbody>
									<tr>
										<td>${item.username}</td>
										<td>${item.address}</td>
										<td>${item.price}</td>
										<td>${item.available?"Ordered":"Cancel"}</td>
										<td>${item.confirm?"Confirmed":"Cancel"}</td>
										<td>${item.createDate}</td>
										<th><a class="" href="/Admin/Order/Details/${item.id}">Details</a>
											<a class="" href="/Admin/Details/Confirmed/${item.id}">Confirmed</a></th>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="card-footer ">
						<hr>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card ">
					<div class="card-header ">
						<h5 class="card-title">Thống kê danh mục hàng</h5>
					</div>
					<div class="card-body ">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Category Name</th>
									<th>Total Price</th>
									<th>Count Product</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${rep}">
								<tbody>
									<tr>
										<td>${item.group.name}</td>
										<td>${item.sum}</td>
										<td>${item.count}</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="card-footer ">
						<hr>
						<div class="stats"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>