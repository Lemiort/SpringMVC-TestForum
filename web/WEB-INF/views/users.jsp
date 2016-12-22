<%--
  Created by IntelliJ IDEA.
  User: Nikita
  Date: 22.12.2016
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All users</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/bootstrap-theme.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
    <link href="../../resources/css/myStyle.css" rel="stylesheet" />
</head>
<body>
<div class="container">
    <section class="panel panel-info">
        <header class="panel-heading">
            <section class="panel-title">
                <section class="col-md-12">
                    Ник
                </section>
            </section>
        </header>
        <section class="clearfix">
            <c:forEach items="${usersJSP}" var="user">
                <div class="panel-body row topic-body col-md-12">
                    <c:out value="${user.name}"/>
                </div>
            </c:forEach>
        </section>
    </section>
</div>

</body>
</html>
