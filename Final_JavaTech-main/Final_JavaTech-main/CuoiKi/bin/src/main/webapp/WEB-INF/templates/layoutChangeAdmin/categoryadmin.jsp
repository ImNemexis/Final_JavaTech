<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<ul class="nav nav-pills mb-1 mt-2 ml-2" id="pills-tab"
					role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="pills-home-tab" data-toggle="pill"
						href="#pills-home" role="tab" aria-controls="pills-home"
						aria-selected="true">DANH MỤC HÀNG</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
						role="tab" aria-controls="pills-profile" aria-selected="false">CHỈNH SỬA</a>
					</li>

				</ul>
				<div class="card-header">
					<h4 class="card-title">Danh mục hàng</h4>
					<form action="/Admin/category/search-and-page" method="post">
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
										<th>ID sản phẩm</th>
										<th>Tên sản phẩm</th>
										<th>Tình trạng</th>

									</thead>
									<c:forEach var="item" items="${page.content}">
										<tbody>
											<tr>
												<td>${item.id}</td>
												<td>${item.name}</td>
												<td>${item.status}</td>
												<td><a href="/Admin/Category/Edit/${item.id}">Sửa</a>
												<a href="/Admin/Category/Remove/${item.id}">Xóa</a></td>
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
									<h5 class="card-title">Chỉnh sửa danh mục hàng</h5>
								</div>
								<div class="card-body">
									<form:form action="/Admin/Category/Add" modelAttribute="item">
										<div class="row">
											<div class="col-md-6 pr-1">
												<div class="form-group">
													<label>Tên danh mục</label>
													<form:input type="text" class="form-control"
														placeholder="Tên danh mục hàng" value="" path="name" />
													<form:errors path="name" />
												</div>
											</div>
											<div class="col-md-5 pr-1">
												<div class="form-group">

													<form:input type="hidden" class="form-control"
														placeholder="Id" value="" path="id" />

												</div>
											</div>

											<div class="col-md-6 pr-1">
												<div class="form-group">

													<form:label path="status">Tình trạng: </form:label>

													<form:radiobutton path="status" value="True"
														label="Còn hàng" />
													<form:radiobutton path="status" value="False"
														label="Đã hết" />
													<form:errors path="status" />
												</div>
											</div>
											<div class="row">
												<div class="create ml-auto mr-auto">
													<button type="submit" class="btn btn-primary btn-round"
														formaction="/Admin/Category/Add">Save</button>
													<button type="submit" class="btn btn-primary btn-round"
														formaction="/Admin/Category/Update">Update</button>
												</div>
												<div class="update ml-auto mr-auto"></div>
											</div>
									</form:form>
								</div>
								<h>${message}</h>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>
