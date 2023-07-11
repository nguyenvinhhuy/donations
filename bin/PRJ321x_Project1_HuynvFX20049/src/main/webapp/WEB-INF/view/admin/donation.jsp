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
              <li class="nav-item dropdown">
                  <a th:if="${session.admin}" class="nav-link dropdown-toggle" href="/admin/logout" role="button" ><i class="fas fa-user fa-fw"></i><span> Logout</span></a>
                  <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown1">
                      <li><a class="dropdown-item" href="#">Settings</a></li>
                      <li><a class="dropdown-item" href="#">Activity Log</a></li>
                      <li>
                          <hr class="dropdown-divider" />
                      </li>
                      <li><a class="dropdown-item" href="/logout">Logout</a></li>
                  </ul>
              </li>
          </ul>
  </nav>
  </nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <div th:fragment="html_menu" id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
              <div class="nav">
                  <a class="nav-link" href="${pageContext.request.contextPath}/admin/listUsers">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý người dùng
                  </a>
                  <a class="nav-link" href="${pageContext.request.contextPath}/admin/listDonations">
                      <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                      Quản lý đợt quyên góp
                  </a>
              </div>
          </div>

      </nav>
  </div>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Danh sách đợt quyên góp</h1>
        <div class="card mb-4">
          <div class="card-header">
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModalAdd">
              Thêm mới
            </button>
            
            <!-- ------------------------------------------------- Modal Add --------------------------------------------------->
            <div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabelll">Thêm mới</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form:form action="saveDonation" modelAttribute="donation" method="post">
                      <div class="row">
                        <div class="col-6">
                          <label for="addname" class="col-form-label">Mã đợt quyên góp:</label>
                          <input type="text" class="form-control" id="addname" name="code" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost" class="col-form-label">Tên đợt quyên góp:</label>
                          <input type="text" class="form-control" id="addcost" name="name" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Ngày bắt đầu:</label>
                          <input type="date" class="form-control"
                                 id="addname" name="startDate" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Ngày kết thúc:</label>
                          <input type="date" class="form-control"
                                 id="addcost" name="endDate" required>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label for="addname"
                                 class="col-form-label">Tổ chức:</label>
                          <input type="text" class="form-control"
                                 id="addname" name="organizationName" required>
                        </div>
                        <div class="col-6">
                          <label for="addcost"
                                 class="col-form-label">Số điện thoại:</label>
                          <input type="number" class="form-control"
                                 id="addcost" name="phoneNumber" required>
                        </div>
                        <div class="col-12">
                          <label for="ct_id" class="col-form-label">Nội dung:</label>
                          <textarea name="description" class="form-control" cols="50" rows="5">Nhập nội dung</textarea>
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
            <!-- ------------------------------------------------- End Modal Add ------------------------------------------------- -->
          </div>
          <div class="card-body">
            <table id="datatablesSimple">
              <thead>
              	<tr style="background-color: gray !important;">
                	<th>Mã</th>
                	<th>Tên</th>
                	<th>Ngày bắt đầu</th>
                	<th>Ngày kết thúc</th>
                	<th>Tổ chức</th>
                	<th>Số điện thoại</th>
                	<th>Tổng tiền</th>
                	<th>Trạng thái</th>
                	<th style="width: 14%; ">Hành động</th>
              	</tr>
              </thead>
              <tfoot>
              	<tr>

              	</tr>
              </tfoot>
              <tbody>
              <c:forEach var="tempDonation" items="${donations}">
                <tr>
                  <td>${tempDonation.code}</td>
                  <td>${tempDonation.name}</td>
                  <td>${tempDonation.startDate}</td>
                  <td>${tempDonation.endDate}</td>
                  <td>${tempDonation.organizationName}</td>
                  <td>${tempDonation.phoneNumber}</td>
                  <td>${tempDonation.money}</td>
<!-- ----------------------------------------------- Status ----------------------------------------------- -->                  
                  <td>
					<c:choose>
						<c:when test="${tempDonation.status == 1}">
							<p style="color: #1c7430; font-weight: bold">Mới tạo</p>
						</c:when>
						<c:when test="${tempDonation.status == 2}">
							<p style="color: #1c7430; font-weight: bold">Đang quyên góp</p>
						</c:when>
						<c:when test="${tempDonation.status == 3}">
							<p style="color: #1c7430; font-weight: bold">Kết thúc</p>
						</c:when>
						<c:when test="${tempDonation.status == 0}">
							<p style="color: red; font-weight: bold">Đóng</p>
						</c:when>
					</c:choose>
                  </td>
<!-- --------------------------------------------- End Status --------------------------------------------- --> 

<!-- ----------------------------------------------- Action ----------------------------------------------- -->                 
                  <td style="">
                    <button type="button" style="width: 110px" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal${tempDonation.id}">Cập nhật
                    </button>                                  
					
					<form action="detailDonation" style="margin-left: 115px;margin-top: -38px">
						<input type="hidden" class="form-control" id="id" name="donationID" value="${tempDonation.id}">
						<button type="submit" style="width: 110px;" class="btn btn-warning">Chi tiết</button>         
					</form>
					
                    <button type="button" style="width: 110px" class="btn btn-danger mt-1" data-bs-toggle="modal"
                            data-bs-target="#idModelDel${tempDonation.id}">Xóa
                    </button>
					
					<c:choose>
						<c:when test="${tempDonation.status == 1}">
							<form:form modelAttribute="donation" action="activeDonation" method="post" style="margin-left: 115px;margin-top: -38px" >
                      			<input type="hidden" class="form-control" id="id" name="id" value="${tempDonation.id}">
                      			<button type="submit" style="width: 110px" class="btn btn-success">Quyên góp
                      			</button>
                    		</form:form>
						</c:when>
						<c:when test="${tempDonation.status == 2}">
							<form:form modelAttribute="donation" action="closeDonation" method="post" style="margin-left: 115px;margin-top: -38px">
                      			<input type="hidden" class="form-control" id="id" name="id" value="${tempDonation.id}">
                      			<button type="submit" style="width: 110px" class="btn btn-success">Kết thúc
                      			</button>
                    		</form:form>
						</c:when>
						<c:when test="${tempDonation.status == 3}">
							<form:form modelAttribute="donation" action="endDonation" method="post" style="margin-left: 115px;margin-top: -38px">
                      			<input type="hidden" class="form-control" id="id" name="id" value="${tempDonation.id}">
                      			<button type="submit" style="width: 110px" class="btn btn-danger">Đóng
                      			</button>
                    		</form:form>
						</c:when>
					</c:choose>                                                                                     
<!-- --------------------------------------------- End Action --------------------------------------------- -->    
                
<!-- ------------------------------------------------------------------- Modal Xóa ----------------------------------------------------------- -->                    
                    <div class="modal fade" id="idModelDel${tempDonation.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Bạn chắc chắn muốn xóa ?</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            Đợt quyên góp : <span>${tempDonation.name}</span>
                            <form action="deleteDonation" method="post">
                            	<input type="hidden" class="form-control" id="id" name="donationID" value="${tempDonation.id}">
                              <div class="modal-footer" style="margin-top: 20px">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-danger">Xóa</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
<!-- ----------------------------------------------------------------- End Modal Xóa --------------------------------------------------------- -->                      
                  </td>
                </tr>
<!-- ------------------------------------------------------------------ Modal Update --------------------------------------------------------- -->                 
                <div class="modal fade" tabindex="-1" id="exampleModal${tempDonation.id}" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabell">Cập nhật</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form:form modelAttribute="donation" action="updateDonation" method="post">
                          <input type="hidden" name="id" value="${tempDonation.id}">
                          <div class="row">
                            <div class="col-6">
                              <label for="addname" class="col-form-label">Mã đợt quyên góp:</label>
                              <input type="text" class="form-control" id="addname" name="code" value="${tempDonation.code}" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost" class="col-form-label">Tên đợt quyên góp:</label>
                              <input type="text" class="form-control" id="addcost" name="name" value="${tempDonation.name}" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname" class="col-form-label">Ngày bắt đầu:</label>
                              <input type="date" class="form-control" id="addname" name="startDate" value="${tempDonation.startDate}" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost" class="col-form-label">Ngày kết thúc:</label>
                              <input type="date" class="form-control" id="addcost" name="endDate" value="${tempDonation.endDate}" required>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-6">
                              <label for="addname" class="col-form-label">Tổ chức:</label>
                              <input type="text" class="form-control" id="addname" name="organizationName" value="${tempDonation.organizationName}" required>
                            </div>
                            <div class="col-6">
                              <label for="addcost" class="col-form-label">Số điện thoại:</label>
                              <input type="number" class="form-control" id="addcost" name="phoneNumber" value="${tempDonation.phoneNumber}" required>
                            </div>
                            <div class="col-12">
                              <label for="ct_id" class="col-form-label">Nội dung:</label>
                              <textarea name="description" class="form-control" cols="50" rows="5">${tempDonation.description}</textarea>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu </button>
                          </div>
                        </form:form>
                      </div>
                    </div>
                  </div>
                </div>
<!-- ---------------------------------------------------------------- End Modal Update ------------------------------------------------------- --> 
               
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
    <footer th:replace="admin/fragments :: footer" class="py-4 bg-light mt-auto">

    </footer>
  </div>
</div>

<script src="${pageContext.request.contextPath}/static/admin1/assets/js/JQuery3.3.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        
<script src="${pageContext.request.contextPath}/static/admin1/assets/js/scripts.js"></script>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/static/admin1/assets/js/datatables-simple-demo.js"></script>
</body>
</html>