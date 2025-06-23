<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Crear Nuevo Usuario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>Crear Nuevo Usuario</h1>
    </div>

    <s:if test="hasActionErrors()">
        <div class="alert alert-danger">
            <s:actionerror />
        </div>
    </s:if>
    <div class="form-container">
        <s:form action="update">
            <s:hidden name="id" />
            <div class="form-row">
                <s:textfield name="username" label="Username" />
            </div>
            <div class="form-row">
                <s:password name="password" label="Password" />
            </div>
            <div class="form-row">
                <s:textfield name="email" label="Email" />
            </div>
            <div class="form-row">
                <s:submit value="Confirmar" cssClass="btn" />
            </div>
        </s:form>
    </div>
</body>
</html>