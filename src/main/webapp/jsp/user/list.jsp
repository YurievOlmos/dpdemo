<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>User Management System</h1>
    </div>

    <div class="nav-links">
        <s:a action="userAction_create" cssClass="btn">Add New User</s:a>
        <s:a action="logout" cssClass="btn">Logout</s:a>
    </div>

    <s:if test="hasActionMessages()">
        <div class="success-message">
            <s:actionmessage/>
        </div>
    </s:if>

    <table class="data-table">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <s:iterator value="userList">
            <tr>
                <td><s:property value="id"/></td>
                <td><s:property value="username"/></td>
                <td><s:property value="email"/></td>
                <td>
                    <s:url action="userAction_edit" var="editUrl">
                        <s:param name="id" value="id"/>
                    </s:url>
                    <s:a href="%{editUrl}" cssClass="btn">Edit</s:a>

                    <s:url action="userAction_delete" var="deleteUrl">
                        <s:param name="id" value="id"/>
                    </s:url>
                    <s:a href="%{deleteUrl}" cssClass="btn">Delete</s:a>
                </td>
            </tr>
        </s:iterator>
    </table>
    
    <s:a action="userAction_create">Add New User</s:a>
    <s:a action="logout">Logout</s:a>
</body>
</html>