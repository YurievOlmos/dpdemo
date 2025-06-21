<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>User Login</h1>
    </div>

    <div class="form-container">
        <s:if test="hasActionErrors()">
            <div class="error-message">
                <s:actionerror/>
            </div>
        </s:if>

        <s:form action="login">
            <div class="form-row">
                <s:textfield name="username" label="Username"/>
            </div>
            <div class="form-row">
                <s:password name="password" label="Password"/>
            </div>
            <div class="form-row">
                <s:submit value="Login" cssClass="btn"/>
            </div>
        </s:form>
    </div>

    <div class="nav-links">
        <p>Default credentials: admin/admin123</p>
    </div>
</body>
</html>