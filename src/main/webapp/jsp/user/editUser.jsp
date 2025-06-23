<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Edit User</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>Editar Usuario</h1>
    </div>

    <s:if test="hasActionErrors()">
        <div class="alert alert-danger">
            <s:actionerror />
        </div>
    </s:if>
    
    <div class="form-container">
        <s:form action="update">
            <!-- Read Only field for the user ID -->
            <s:textfield name="id" label="User ID" value="%{model.id}" readonly="true" />
            <div class="form-row">
                <!-- Pre-populate the username field -->
                <s:textfield name="username" label="Username" value="%{model.username}" />
            </div>
            <div class="form-row">
                <!-- Pre-populate the password field -->
                <s:password name="password" label="Password" />
            </div>
            <div class="form-row">
                <!-- Pre-populate the email field -->
                <s:textfield name="email" label="Email" value="%{model.email}" />
            </div>
            <div class="form-row">
                <s:submit value="Update User" cssClass="btn" />
            </div>
        </s:form>
    </div>
</body>
</html>