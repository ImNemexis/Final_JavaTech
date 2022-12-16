<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<div class="card">
					<ul class="nav nav-pills mb-1 mt-2 ml-2" id="pills-tab"
						role="tablist">
						<li class="nav-item" role="presentation"><a
							class="nav-link active" id="pills-home-tab" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">TÀI KHOẢN</a></li>
						<li class="nav-item" role="presentation"><a class="nav-link"
							id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
							role="tab" aria-controls="pills-profile" aria-selected="false">CHỈNH
								SỬA</a></li>
					</ul>
					<div class="card-header">

						<h4 class="card-title">Danh sách tài khoản</h4>
						<form action="/Admin/account/search-and-page" method="post">
							<input class="col-3 form-control" name="keywords"
								value="${keywords}" />
							<button class="btn btn-primary">Tìm</button>
						</form>
					</div>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<div class="card-body">

								<div class="table-responsive">
									<table class="table table-bordered">

										<thead class=" text-primary">
											<th>ID tài khoản</th>
											<th>Tên đăng nhập</th>
											<th>Mật khẩu</th>
											<th>Họ và tên</th>
											<th>Email cá nhân</th>
											<th>Địa chỉ</th>
											<th>Ảnh</th>
											<th>Số điện thoại</th>
											<th>ADMIN?</th>
											<th class="text-right">Sửa</th>
										</thead>
										<c:forEach var="item" items="${page.content}">
											<tbody>
												<td>${item.id}</td>
												<td>${item.username}</td>

												<td>${item.password}</td>
												<td>${item.fullname}</td>
												<td>${item.email}</td>
												<td>${item.address}</td>
												<td>${item.photo}</td>
												<td>${item.phone}</td>
												<td>${item.admin}</td>
												<td class="text-right"><a
													href="/Admin/Account/Edit/${item.id}">Sửa</a> <a
													href="/Admin/Account/Remove/${item.id}">Xóa</a></td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<div class="col">
								<div class="card card-user">
									<div class="card-header">
										<h5 class="card-title">Chỉnh sửa thông tin</h5>
									</div>
									<div class="card-body">
										<form:form action="/Admin/Account/Save" modelAttribute="item"
											method="post" enctype="multipart/form-data">
											<div class="row">
												<div class="col-4">
													<div class="form-group">
														<label>ID tài khoản</label>
														<form:input type="text" class="form-control"
															placeholder="id" value="" readonly="true" path="id" />
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Tên đăng nhập</label>
														<form:input type="text" class="form-control"
															name="username" placeholder="Username" path="username" />
														<form:errors path="username" />
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Mật khẩu</label>
														<form:input type="password" class="form-control"
															placeholder="password" value="" path="password" />
														<form:errors path="password" />
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Họ và tên</label>
														<form:input type="text" class="form-control"
															placeholder="fullname" value="" path="fullname" />

													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Email cá nhân</label>
														<form:input type="text" class="form-control"
															placeholder="email" value="" path="email" />
														<form:errors path="email" />
													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Địa chỉ</label>
														<form:input type="text" class="form-control"
															placeholder="address" value="" path="address" />

													</div>
												</div>
												<div class="col-4">
													<div class="form-group">
														<label>Số điện thoại</label>
														<form:input type="text" class="form-control"
															placeholder="phone" value="" path="phone" />
													</div>
												</div>
												<div class="row">
													<div class="form-group">
														<form:label path="activated"> Chặn?</form:label>
														<form:radiobutton path="activated" value="True"
															label="True" />
														<form:radiobutton path="activated" value="False"
															label="False" />
														<form:errors path="activated" />

													</div>
												</div>
												<div class="row">
													<div class="create ml-auto mr-auto">
														<form:label path="admin">Admin?</form:label>
														<form:radiobutton path="admin" value="True" label="Admin" />
														<form:radiobutton path="admin" value="False" label="User" />
														<form:errors path="admin" />
														<form:button type="submit"
															class="btn btn-primary btn-round ml-4">Lưu</form:button>
													</div>
													<div class="update ml-auto mr-auto"></div>
												</div>
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
</body>
</html>