<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 1/5/2021
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.

  <%
                                String category_id=(String) request.getAttribute("category_id");
                                if (category_id==null) category_id="";
                            <%=category_id%
                            %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String category_id=(String)request.getAttribute("category_id");
    if (category_id==null) category_id="";
    String category_name=request.getParameter("category_name");
    if(category_name==null) category_name="";

%>
<!-- Start header section -->
<div class="content-wrapper">
    <div class="container-fluid">

        <div class="row mt-3">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Chuyên mục: Sửa</div>
                        <hr>

                        <form action="${pageContext.request.contextPath}/admin/cate/edit" method="post">

                            <div class="form-group">
                                <label for="input-1">ID</label>
                                <input type="text" class="form-control" readonly id="input-1" placeholder="ĐẦU SÁCH ID" name="category-id" value="${category.ma_DauSach}<%=category_id%>">
                            </div>

                            <div class="form-group">
                                <label for="input-4">Tên Đầu Sách</label>
                                <input type="text" class="form-control" id="input-4" placeholder="Tên Đầu sách" name="category-name" value="${category.ten_DauSach}<%=category_name%>">
                                <div><b> <span style="color:#f31818"> ${errorMessage}</span></b></div>
                            </div>

                            <div class="form-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-times"></i> <a href="${pageContext.request.contextPath}/admin/admin/list">Hủy</a> </button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Sửa </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
        <div class="overlay toggle-menu"></div>
    </div>
</div>

</body>
</html>