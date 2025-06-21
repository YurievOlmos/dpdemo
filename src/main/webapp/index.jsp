<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <meta http-equiv="refresh" content="0;url=<s:url action='userAction_list'/>">
    </c:when>
    <c:otherwise>
        <meta http-equiv="refresh" content="0;url=<s:url action='login'/>">
    </c:otherwise>
</c:choose>