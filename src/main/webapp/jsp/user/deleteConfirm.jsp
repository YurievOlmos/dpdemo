<%--
/*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
*  http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/
--%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Orders</title>
    <!-- Using a standard HTML link tag with JSP EL to get the contextPath may be simpler, but this is an equivalent for s:link -->
    <s:set var="pageContextPath"><%=((HttpServletRequest)request).getContextPath()%></s:set>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">

	        <div class="page-header">
		        <h1>Borrar Usuario ${id}</h1>
	        </div>
            <s:url action="delete" var="deleteUrl">
                <s:param name="id" value="%{id}"/>
            </s:url>
            <form action="<s:property value='%{deleteUrl}' />" method="post">
                <p> ¿Estas seguro que deseas borrar el usuario <s:property value="%{id}" />?</p>
                <div class="btn-group">
                    <input type="submit" value="Borrar" class="btn btn-danger" />
                    <input type="button" value="Cancelar" class="btn btn-success" onclick="window.location.href='<s:url action='list' />'" />
                </div>
            </form>
            <br />

            <a href="<s:url action='list' />" class="btn btn-info">
	            <span class="glyphicon glyphicon-arrow-left"></span> Regresar a Usuarios
            </a>
        </div><!--/col-md-12--->
    </div><!--/row-->
</div><!--/container-->
</body>
</html>
	