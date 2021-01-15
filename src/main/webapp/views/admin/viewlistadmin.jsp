<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
//    response.setHeader("Pragma" , "no-cache");
//    response.setHeader("Expires" , "0");


    if (session.getAttribute("user_admin") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="owner" value="haibmt" scope="page"/>
<div class="content-wrapper">
    <div class="container-fluid">
        <!--End Row-->


        <div class="row">
            <c:if test="${sessionScope.user_admin == sessionScope.owner}">
                <div class="col-lg-12">
                    <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/admin/add">Thêm Admin</a></button>
                </div>
            </c:if>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách Admin</h5>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tên đăng nhập</th>
                                    <c:if test="${sessionScope.user_admin == sessionScope.owner}">
                                        <th scope="col">Mật khẩu</th>
                                    </c:if>
                                    <th scope="col">Tên Admin</th>
                                    <th scope="col">Email</th>
                                    <c:if test="${sessionScope.user_admin == sessionScope.owner}">
                                        <th scope="col">Hành động</th>
                                    </c:if>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${adminList}" var="admin">
                                    <tr>
                                        <td scope="row">${admin.ma_Admin}</td>
                                        <td>${admin.taikhoan_Admin}</td>
                                        <c:if test="${sessionScope.user_admin == sessionScope.owner}">
                                            <td>${admin.matkhau_Admin}</td>
                                        </c:if>
                                        <td>${admin.hoten_Admin}</td>
                                        <td>${admin.gmail_Admin}</td>
                                        <c:if test="${sessionScope.user_admin == sessionScope.owner}">
                                            <td>
                                                <button type="reset" class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/admin/delete?admin-id=${admin.ma_Admin}">Xóa</a></button>
                                                <button class="btn btn-success"><a href="${pageContext.request.contextPath}/admin/admin/edit?admin-id=${admin.ma_Admin}">Sửa</a></button>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
