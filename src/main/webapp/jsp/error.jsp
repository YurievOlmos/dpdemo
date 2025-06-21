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
        <s:if test="hasActionErrors()">
            <div class="error-message">
                <h3>Application Errors:</h3>
                <s:actionerror/>
            </div>
        </s:if>

        <s:if test="hasActionMessages()">
            <div class="success-message">
                <h3>Notifications:</h3>
                <s:actionmessage/>
            </div>
        </s:if>

        <div class="nav-links">
            <p>Please try the following:</p>
            <ul>
                <li>Refresh the page</li>
                <li>Return to <s:a action="userAction_list" cssClass="btn">Home</s:a></li>
                <li>Contact support if the problem persists</li>
            </ul>
        </div>
    </div>
</body>
</html>