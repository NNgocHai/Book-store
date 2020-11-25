<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Admin Page"/></title>
    <%@ include file="/common/admin/style.jsp" %>
    <dec:head/>
</head>
<body id="page-top">
<%--    <%@ include file="/common/admin/header.jsp" %>--%>
<%--    <%@ include file="/common/admin/menu.jsp" %>--%>
<%--    <%@ include file="/common/admin/footer.jsp" %>--%>
    <div id="wrapper">

        <!-- Sidebar -->
        <%@ include file="/common/admin/menu.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@ include file="/common/admin/header.jsp" %>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <dec:body/>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <%@ include file="/common/admin/footer.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <%@ include file="/common/admin/script.jsp" %></body>
</html>