<%--
  Created by IntelliJ IDEA.
  User: HIEU
  Date: 11/24/2020
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/template/web" var="url"/>
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/">TRANG CHỦ</a></li>
                        <li><a href="${pageContext.request.contextPath}/view/client/introduce">GIỚI THIỆU</a></li>
                        <li><a href="${pageContext.request.contextPath}/web/product">SẢN PHẨM</span></a>
                            <ul class="dropdown-menu">
                                <li><a href="product.jsp">RAU CỦ QUẢ</a></li>
                                <li><a href="product.jsp">CÁC LOẠI HẠT</a></li>
                                <li><a href="product.jsp">TINH DẦU</a></li>
                                <li><a href="product.jsp">MẬT ONG</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/view/client/news-list">TIN TỨC</a></li>
                        <li><a href="${pageContext.request.contextPath}/view/client/security">CHÍNH SÁCH</a></li>
                        <li><a href="${pageContext.request.contextPath}/view/client/contact">LIÊN HỆ</a></li>
                        <li class="aa-search"><!-- search box -->
                            <a class="aa-search-box">
                                <form action="${pageContext.request.contextPath}/web/product/Search" method="Get">
                                    <input type="text" name="TuKhoa" id="" placeholder="Tìm kiếm sản phẩm..">
                                    <button class="serach-box"><span class="fa fa-search"></span></button>
                                </form>
                            </a>
                            <!-- / search box -->
                        </li>
                    </ul>
                </div><!--/.nav-collapse -->

            </div>
        </div>
    </div>
</section>