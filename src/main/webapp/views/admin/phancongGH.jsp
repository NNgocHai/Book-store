<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%--%>
<%--    //    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");--%>
<%--//    response.setHeader("Pragma" , "no-cache");--%>
<%--//    response.setHeader("Expires" , "0");--%>
<%

    if (session.getAttribute("user") == null){
        response.sendRedirect(request.getContextPath() + "/admin/login");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    select option{
        background-color: white !important;
    }
</style>
<body>
<div class="content-wrapper">
    <div class="container-fluid">

        <div class="row mt-3">
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Phân công giao hàng</div>
                        <hr>
                        <form action="${pageContext.request.contextPath}/admin/giaohang/phancong" method="post">
                            <div class="form-group">
                                <span>Mã shipper: </span><select name="maSP" class="add-catalogg" class="cbb">
                                    <c:forEach items="${listSP}" var="list">
                                        <option color="red" value="${list}" name="maSP"selected>${list}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <span>Mã đơn hàng: </span><select name="maDHCG" class="add-catalogg" class="cbb">
                                    <c:forEach items="${listDHCG}" var="list">
                                        <option color="red" value="${list}" name="maDHCG" selected>${list}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-footer">
                                <button type="reset" class="btn btn-danger"><i class="fa fa-times"></i><a href="${pageContext.request.contextPath}/admin/giaohang/list">Hủy</a></button>
                                <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> Phân công</button>
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
