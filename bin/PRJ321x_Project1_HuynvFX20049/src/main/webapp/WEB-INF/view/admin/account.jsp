<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Quản trị</title>
<link type="text/css" href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />

<link type="text/css" href="${pageContext.request.contextPath}/static/admin1/assets/css/styles.css" rel="stylesheet" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/static/admin1/assets/js/scripts.js"></script>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/static/admin1/assets/js/datatables-simple-demo.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<nav th:fragment="html_nav" class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
			<!-- Navbar Brand-->
			<a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/admin/">QUẢN TRỊ</a>
			<!-- Sidebar Toggle-->
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
				<i class="fas fa-bars"></i>
			</button>
			<!-- Navbar Search-->
			<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"></form>
			<!-- Navbar-->
			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown"><a th:if="${session.admin}"
					class="nav-link dropdown-toggle" href="/admin/logout" role="button"><i
						class="fas fa-user fa-fw"></i><span> Logout</span></a>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="navbarDropdown1">
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Activity Log</a></li>
						<li>
							<hr class="dropdown-divider" />
						</li>
						<li><a class="dropdown-item" href="/logout">Logout</a></li>
					</ul></li>
			</ul>
		</nav>
	</nav>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<div th:fragment="html_menu" id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-dark"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link" href="${pageContext.request.contextPath}/admin/listUsers">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý người dùng
							</a> <a class="nav-link" href="${pageContext.request.contextPath}/admin/listDonations">
								<div class="sb-nav-link-icon">
									<i class="fas fa-tachometer-alt"></i>
								</div> Quản lý đợt quyên góp
							</a>
						</div>
					</div>

				</nav>
			</div>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Danh sách người dùng</h1>
					<div class="card mb-4">
						<div class="card-header">
							<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
								Thêm mới</button>
<!-- ------------------------------------------------------------------ Modal add --------------------------------------------------------- -->
							<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<form:form action="saveUser" modelAttribute="user" method="post" >
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Họ và tên:</label>
														<input type="text" class="form-control" id="addname" name="fullName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Email:</label>
														<input type="email" class="form-control" id="addcost" name="email" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Số điện thoại:</label> 
														<input type="number" class="form-control" id="addname" name="phoneNumber" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Địa chỉ:</label> 
														<input type="text" class="form-control" id="addcost" name="address" required>
													</div>
												</div>
												<div class="row">
													<div class="col-6">
														<label for="addname" class="col-form-label">Tài khoản:</label> 
														<input type="text" class="form-control" id="addname" name="userName" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Mật khẩu:</label> 
														<input type="password" class="form-control" id="addcost" name="password" required>
													</div>
													<div class="col-6">
														<label for="addcost" class="col-form-label">Ghi chú:</label> 
														<input type="text" class="form-control" id="addcost" name="note" required>
													</div>
													<div class="col-6">
														<label for="ct_id" class="col-form-label">Vai trò:</label>
														<select class="form-control" id="role" name="role" required>
															<option value="1" selected>ADMIN</option>
															<option value="2">USER</option>
														</select>
													</div>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
													<button type="submit" class="btn btn-primary">Thêm </button>
												</div>
											</form:form>
										</div>

									</div>
								</div>
							</div>
<!-- ------------------------------------------------------------------ End Modal Add ------------------------------------------------------------------ -->
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr style="background-color: gray !important;">
										<th>Họ tên</th>
										<th>Email</th>
										<th>Số điện thoại</th>
										<th>Tài khoản</th>
										<th>Vai trò</th>
										<th>Trạng thái</th>
										<th style="width: 220px" >Hành động</th>
									</tr>
								</thead>
								<tfoot>
									<tr>

									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="tempUser" items="${users}">
<%-- 										<c:url var="updateLink" value="/admin/ShowFormForUpdate"> --%>
<%-- 											<c:param name="userID" value="${tempUser.id}"></c:param> --%>
<%-- 										</c:url> --%>
<%-- 										<c:url var="deleteLink" value="/admin/delete"> --%>
<%-- 											<c:param name="userID" value="${tempUser.id}"></c:param> --%>
<%-- 										</c:url> --%>
										<tr>
											<td>${tempUser.fullName}</td>
											<td>${tempUser.email}</td>
											<td>${tempUser.phoneNumber}</td>
											<td>${tempUser.userName}</td>
											<td>${tempUser.role.roleName}</td>
											<td>
												<c:choose>
													<c:when test="${tempUser.status == 1}">
														<p style="color: #1c7430; font-weight: bold">Hoạt động</p>
													</c:when>
													<c:when test="${tempUser.status == 0}">
														<p style="color: red; font-weight: bold">Đã khóa</p>
													</c:when>
												</c:choose>
											</td>
											<td style="width: 270px">
											
												<button type="button" style="width: 80px"
													class="btn btn-success" data-bs-toggle="modal"
													data-bs-target="#idModelMail${tempUser.id}">Gửi
												</button>
												
												<button type="button" style="width: 80px"
													class="btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#exampleModal${tempUser.id}">Sửa
												</button>
													
												<button type="button" style="width: 80px"
													class="btn btn-warning" data-bs-toggle="modal"
													data-bs-target="#idModelDetail${tempUser.id}">Chi tiết
												</button>
													
												<button type="button" style="width: 80px"
													class="btn btn-danger mt-1" data-bs-toggle="modal"
													data-bs-target="#idModelDel${tempUser.id}">Xóa
												</button>
										
												<c:choose>
													<c:when test="${tempUser.status == 1}">
														<form:form modelAttribute="user" action="lockUser" method="POST">
															<input type="hidden" class="form-control" id="id" name="id" value="${tempUser.id}">
															<button type="submit" style="width: 80px" class="btn btn-danger">Khóa</button>
														</form:form>
													</c:when>
													<c:when test="${tempUser.status == 0}">
														<form action="unLockUser" method="POST">
															<input type="hidden" class="form-control" id="id" name="id" value="${tempUser.id}">
															<button type="submit" style="width: 80px"
																class="btn btn-success">Mở</button>
														</form>
													</c:when>
												</c:choose> 
												
<!-- ------------------------------------------------------------------ Modal Xóa --------------------------------------------------------- -->
												<div class="modal fade" id="idModelDel${tempUser.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																${tempUser.role.roleName} : <span>${tempUser.fullName}</span>
																<form action="deleteUser">
																	<input type="hidden" class="form-control" id="id"
																		name="userID" value="${tempUser.id}">
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Close</button>
																		<button type="submit" class="btn btn-danger">Xóa</button>
																	</div>
																</form>
															</div>

														</div>
													</div>
												</div>
												
<!-- ------------------------------------------------------------------ Modal Gửi --------------------------------------------------------- -->
												<div class="modal fade" id="idModelMail${tempUser.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">Gửi đến: 
																	<span>${tempUser.email}</span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<form th:action="@{/ql-user/send-mail}" method="post">
																	<input type="hidden" class="form-control" id="id"
																		name="userID" th:value="${tempUser.id}"> 
																		<label for="addname" class="col-form-label">Nội dung:</label>
																	<textarea rows="10" class="form-control" id="addname"
																		name="note"></textarea>
																	<div class="modal-footer" style="margin-top: 20px">
																		<button type="button" class="btn btn-secondary"
																			data-bs-dismiss="modal">Đóng</button>
																		<button type="submit" class="btn btn-success">Gửi</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
												
<!-- ------------------------------------------------------------------ Modal chi tiết --------------------------------------------------------- -->
												<div class="modal fade" id="idModelDetail${tempUser.id}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="exampleModalLabel">
																	Chi tiết : <span>${tempUser.fullName}</span>
																</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-6">
																		<h5>Họ tên :</h5>
																		<p>${tempUser.fullName}</p>
																		<h5>Email:</h5>
																		<p>${tempUser.email}</p>
																		<h5>Số điện thoại:</h5>
																		<p>${tempUser.phoneNumber}</p>
																		<h5>Tài khoản:</h5>
																		<p>${tempUser.userName}</p>
																	</div>
																	<div class="col-6">
																		<h5>Địa chỉ :</h5>
																		<p th:text="${tempUser.address}">${tempUser.address}</p>
																		<h5>Vai trò:</h5>
																		<p>${tempUser.role.roleName}</p>
																		<h5>Lần đăng nhập gần nhất:</h5>
																		<p>${tempUser.created}</p>
																		<h5>Note:</h5>
																		<p>${tempUser.note}</p>
																	</div>

																</div>
															</div>
														</div>
													</div>
												</div>
											</td>

<!-- ------------------------------------------------------------------ Modal Update ------------------------------------------------------------------ -->
										<div class="modal fade" id="exampleModal${tempUser.id}"
											tabindex="-1" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog modal-lg ">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form:form modelAttribute="user" action="updateUser" method="POST">
															<input type="hidden" class="form-control" id="id" name="id" value="${tempUser.id}">
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Họ và tên:</label> 
																	<input type="text" class="form-control"
																		id="addname" name="fullName" value="${tempUser.fullName}" required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Email:</label>
																	<input readonly type="email" class="form-control"
																		id="addcost" name="email" value="${tempUser.email}" required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Số điện thoại:</label> 
																	<input type="number" class="form-control"
																		id="addname" name="phoneNumber" value="${tempUser.phoneNumber}" required>
																</div>
																<div class="col-6">
																	<label for="addcost" class="col-form-label">Địa chỉ:</label> 
																	<input type="text" class="form-control"
																		id="addcost" name="address" value="${tempUser.address}" required>
																</div>
															</div>
															<div class="row">
																<div class="col-6">
																	<label for="addname" class="col-form-label">Tài khoản:</label> 
																		<input readonly type="text"
																		class="form-control" id="addname" name="userName" value="${tempUser.userName}"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="idUser" value="${tempUser.id}"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="password" value="${tempUser.password}"
																		required> <input readonly type="hidden"
																		class="form-control" id="addname" name="status" value="${tempUser.status}"
																		required>
																</div>
																	<div class="col-6">
																		<label for="ct_id" class="col-form-label">Vai
																			trò:</label> <select class="form-control" id="role"
																			name="role" required>
																			<option value="1" selected>ADMIN</option>
																			<option value="2">USER</option>
																		</select>
																	</div>
																</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Đóng</button>
																<button type="submit" class="btn btn-primary">Lưu
																</button>
															</div>
														</form:form>
													</div>

												</div>
											</div>
										</div>
										<!-- Modal Update-->
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

			</main>

			<script>

      ClassicEditor.create(document.querySelector('#editor')).then(eidt => {
        console.log("da" + eidt);
      })
              .catch(error => {
                console.error(error);
              });

    </script>
			<script>

      var dodai = document.getElementById("dodai").value;
      var a = parseInt(dodai);
      for(var i = 1;i<=a+10;i++){
        var name = "#editor"  + i
        ClassicEditor.create(document.querySelector(name)).then(eidt => {
          console.log("da" + eidt);
        })
                .catch(error => {
                  console.error(error);
                });
      }


    </script>
			<footer th:replace="admin/fragments :: footer"
				class="py-4 bg-light mt-auto"> </footer>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/JQuery3.3.1.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	
	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/scripts.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	
	<script src="${pageContext.request.contextPath}/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>
</html>