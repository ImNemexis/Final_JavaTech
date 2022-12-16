<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="/cssadmin/styles.css" rel="stylesheet" />
</head>
<body>
	<div class="content">

		<div class="row">

			<div class="col-md-12">
				<div class="card">
					<ul class="nav nav-pills mb-1 mt-2 ml-2" id="pills-tab"
						role="tablist">
						<li class="nav-item" role="presentation"><a
							class="nav-link active" id="pills-home-tab" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">DANH SÁCH SẢN PHẨM</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
							role="tab" aria-controls="pills-profile" aria-selected="false">CHỈNH
								SỬA</a></li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<div class="card-header">
								<h4 class="card-title">Danh sách sản phẩm</h4>
								<form action="/product/search-and-page" method="post">
									<input class="col-3 form-control" name="keywords"
										value="${keywords}" />
									<button class="btn btn-primary">Tìm</button>
								</form>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered">

										<thead class=" text-primary">
											<th>ID sản phẩm</th>
											<th>Tên sản phẩm</th>
											<th>Hình ảnh</th>
											<th>Ngày thêm</th>
											<th>Số lượng</th>
											<th>Giảm giá</th>
											<th>ID danh mục</th>
											<th>Giá tiền</th>
											<th class="text-right">Sửa</th>
										</thead>
										<c:forEach var="item" items="${page.content}">
											<tbody>
												<tr>
													<td>${item.id}</td>
													<td>${item.name}</td>
													<td><img style="width: 70px; height: 40px"
														src="/static/upload/${item.image}" /></td>
													<td>${item.createDate}</td>
													<td>${item.quantity}</td>
													<td>${item.discount}</td>
													<td>${item.category.id}</td>

													<td>${item.price}</td>
													<td class="text-right"><i class="fas fa-trash-alt"><a
															href="/Admin/Tables/Edit/${item.id}">Sửa</a> </i> <i
														class="text-right"><a
															href="/Admin/Tables/Remove/${item.id}">Xóa</a></i></td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<div class="content">
								<div class="row">
									<div class="col-md-4">
										<div class="card card-user">
											<div class="image"></div>
											<div class="card-body">
												<div class="author">
													<a href="#"> <img class="avatar border-gray"
														src="${item.image}" alt="">
														<h5 class="title">${item.name}</h5>
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-8">
										<div class="card card-user">
											<div class="card-header">
												<h5 class="card-title">Sửa thông tin sản phẩm</h5>
											</div>
											<div class="card-body">
												<form:form action="/Admin/Table/Save" modelAttribute="item"
													method="post" enctype="multipart/form-data">

													<div class="form-group">
														<label>Tên sản phẩm</label>
														<form:input type="name" class="form-control" path="name"
															placeholder="Nhập tên sản phẩm" />
														<form:errors path="name" />

													</div>
													<div class="form-group">
														<label>Số lượng: </label>
														<form:input type="text" class="form-control"
															path="quantity" placeholder="Nhập số lượng sản phẩm" />
														<form:errors path="quantity" />
													</div>
													<div class="form-group">
														<label>Giá tiền: </label>
														<form:input type="text" class="form-control" path="price"
															placeholder="Nhập giá tiền" />
														<form:errors path="price" />
													</div>
													<div class="form-group">
														<label>Mô tả: </label>
														<form:input type="text" class="form-control" path="about"
															placeholder="Thêm mô tả sản phẩm" />
														<form:errors path="about" />
													</div>

													<div class="form-group">
														<label>Giảm giá: </label>
														<form:input type="text" class="form-control"
															path="discount" placeholder="Giảm giá sản phẩm" />
														<form:errors path="discount" />
													</div>

													<label>Ảnh sản phẩm: </label>
													<input type="file" class="form-control" name="photo"
														accept="image/png,image/jpeg" />

													<div class="form-group">
														<label>available</label>
														<form:input type="text" class="form-control"
															path="available" placeholder="..."/>
														<form:errors path="available" />
													</div>
													<div class="form-group">
														<label>ID danh mục hàng</label>
														<form:input type="text" class="form-control"
															path="category.id" placeholder="Nhập ID danh mục hàng"/>
														<form:errors path="category.id" />
													</div>
													<form:button type="submit" class="btn btn-primary">Sửa</form:button>
													<form:button type="reset" class="btn btn-primary">Thoát</form:button>
												</form:form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>