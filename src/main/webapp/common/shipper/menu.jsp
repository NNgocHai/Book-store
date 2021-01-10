<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/template/admin/" var="url"/>
<div id="sidebar-wrapper" data-simplebar="" data-simplebar-auto-hide="true">
    <div class="brand-logo">
        <a href="${pageContext.request.contextPath}/shipper/home">
            <img src="${url}images/iconp2.png" class="logo-icon" alt="logo icon">
            <h5 class="logo-text">SHIPPER BOOK STORE</h5>
        </a>
    </div>
    <ul class="sidebar-menu do-nicescrol">
        <li class="sidebar-header">Công việc</li>
        <li>
            <a href="${pageContext.request.contextPath}/shipper/home">
                <i class="zmdi zmdi-view-dashboard"></i> <span>Xem Đơn Hàng</span>
            </a>
        </li>


    </ul>
</div>