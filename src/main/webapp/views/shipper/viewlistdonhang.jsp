<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%


    if (session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/shipper/login");
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
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Đơn Hàng Chưa Giao</h5>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th scope="col">Mã Đơn</th>
                                    <th scope="col">Tên Khách</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">SĐT</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Tình Trạng</th>
                                    <th scope="col">Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td scope="row">${list[0]}</td>
                                        <td>${list[1]}</td>
                                        <td>${list[2]}</td>
                                        <td>${list[3]}</td>
                                        <td>${list[4]}</td>
                                        <td>${list[5]}</td>
                                        <td>
                                            <button type="reset" class="btn btn-success"><a href="${pageContext.request.contextPath}/shipper/editDH?DH-id=${list[0]}">Hoàn Thành</a></button>
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
