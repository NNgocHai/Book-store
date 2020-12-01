<%@page import="java.sql.ResultSet"%>
<%@page import="com.bookstore.jdbc.ConnectDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<jsp:include page = "/common/admin/header.jsp" flush = "true" />
<%--    <%@ include file="/common/admin/menu.jsp" %>--%>
<dec:body/>
<jsp:include page = "/common/admin/footer.jsp" flush = "true" />