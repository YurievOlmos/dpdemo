<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="header">
        <h1>Error Occurred</h1>
    </div>

    <div class="form-container">
            <div class="error-message">
                <h3>Application Errors:</h3>
                <s:actionerror />
            </div>

            <div class="success-message">
                <h3>Notifications:</h3>
                <s:actionmesage />
            </div>


        <div class="nav-links">
            <p>Please try the following:</p>
            <ul>
                <li>Refrescar la págin</li>
                <li>Regresar al <s:a action="list" cssClass="btn">Inicio</s:a></li>
                <li>Contacta a sporte</li>
            </ul>
        </div>
    </div>
</body>
</html>