<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>User Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1><s:if test="id == null">Create</s:if><s:else>Edit</s:else> User</h1>
    </div>

    <s:if test="hasActionErrors()">
        <div class="error-message">
            <s:actionerror/>
        </div>
    </s:if>

    <div class="form-container">
        <s:if test="id == null">
            <s:form action="userAction_create">
                <s:hidden name="id"/>
                <div class="form-row">
                    <s:textfield name="username" label="Username"/>
                </div>
                <div class="form-row">
                    <s:password name="password" label="Password"/>
                </div>
                <div class="form-row">
                    <s:textfield name="email" label="Email"/>
                </div>
                <div class="form-row">
                    <s:submit value="Save" cssClass="btn"/>
                </div>
            </s:form>
        </s:if>
    </div>

    <div class="nav-links">
        <s:a action="userAction_list" cssClass="btn">Back to List</s:a>
    </div>
</body>
</html>