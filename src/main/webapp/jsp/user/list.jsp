<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Administración de Usuarios</title>
    <!-- Using a standard HTML link tag with JSP EL to get the contextPath may be simpler, but this is an equivalent for s:link -->
    <s:set var="pageContextPath"><%=((HttpServletRequest)request).getContextPath()%></s:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

                <div class="page-header">
                    <h1>Administración de Usuario</h1>
                </div>

                <div class="form-row" >
                    <s:url action="create" var="createUrl"/>
                    <a href="<s:property value='#createUrl' />" class="btn btn-primary">
                        <span class="glyphicon glyphicon-file"></span> Crear un nuevo usuario
                    </a>
                </div>

                <s:if test="hasActionMessages()">
                    <div class="success-message">
                        <s:actionmessage/>
                    </div>
                </s:if>

                <table class="table table-striped">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                    <s:iterator value="userList" var="model">
                        <tr>
                            <td><s:property value="#model.id"/></td>
                            <td><s:property value="#model.username"/></td>
                            <td><s:property value="#model.email"/></td>
                            <td>
                                <s:url action="edit" var="editUrl">
                                    <s:param name="id" value="#model.id"/>
                                </s:url>

                                <s:url action="deleteConfirm" var="deleteUrl">
                                    <s:param name="id" value="#model.id"/>
                                </s:url>
                                <div class="btn-group">
                                    <a href="<s:property value='#editUrl' />" class="btn btn-default">
                                        <span class="glyphicon glyphicon-edit"></span> Editar
                                    </a>
                                    <a href="<s:property value='#deleteUrl' />" class="btn btn-danger">
                                        <span class="glyphicon glyphicon-trash"></span> Borrar
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                </table>

                <s:url action="logout" var="logoutUrl"/>
                <a href="<s:property value='#logoutUrl' />" class="btn btn-primary">
                    <span class="glyphicon glyphicon-arrow-left"></span> Cerrar sesión
                </a>
        </div>
    </div>
</div>      
</body>
</html>