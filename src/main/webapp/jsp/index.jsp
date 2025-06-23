<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    This JSP page serves as the main entry point for the application.
1    It checks if a user is logged in and redirects accordingly.
    If the user is logged in, it redirects to the user list page.
    If not, it redirects to the login page.
<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <meta http-equiv="refresh" content="0;url=<s:url action='list'/>">
    </c:when>
    <c:otherwise>
        <meta http-equiv="refresh" content="0;url=<s:url action='login'/>">
    </c:otherwise>
</c:choose>
-->
<html>
<head>
    <title>Main Application Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>Struts2 Demo Page</h1>
    </div>
    
    <div class="content">
        <p>¡Te haz logueado exitosamente!</p>
        <!-- Button to redirect to the list action -->
        <form action="<s:url action='list'/>" method="get">
            <button type="submit" class="btn">Administrar Usuarios</button>
        </form>
    </div>
</body>
</html>