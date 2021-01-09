<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/7/2021
  Time: 12:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
//    response.setHeader("Pragma" , "no-cache");
//    response.setHeader("Expires" , "0");


    if (session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="content-wrapper">
    <div class="container-fluid">
        <!--End Row-->


        <div class="row">
            <div class="col-lg-12">
                <button class="add-catalog"><a href="${pageContext.request.contextPath}/admin/product/add">Thêm Cuốn sách</a></button>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Danh sách Cuốn sách</h5>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Mã Đầu Sách</th>
                                    <th scope="col">Tên Cuốn Sách</th>
                                    <th scope="col">Tác Giả</th>
                                    <th scope="col">Số Lượng</th>
                                    <th scope="col">Ảnh Cuốn Sách</th>
                                    <th scope="col">Discount</th>
                                    <th scope="col">Giá Bán</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${cuonsachList}" var="cuonsach">
                                    <tr>
                                        <td scope="row">${cuonsach.ma_CuonSach}</td>
                                        <td>${cuonsach.ma_DauSach}</td>
                                        <td>${cuonsach.ten_CuonSach}</td>
                                        <td>${cuonsach.tacgia}</td>
                                        <td>${cuonsach.soluong}</td>
                                        <td>${cuonsach.anh_CuonSach}</td>
                                        <td>${cuonsach.discount}</td>
                                        <td>${cuonsach.giaban}</td>
                                        <td>
                                            <button type="reset" class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/product/delete?cuonsach_id=${cuonsach.ma_CuonSach}">Xóa</a></button>
                                            <button class="btn btn-success"><a href="${pageContext.request.contextPath}/admin/product/edit?cuonsach_id=${cuonsach.ma_CuonSach}">Sửa</a></button>
                                        </td>
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
