<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
  <title>Index Page</title>
  <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
  <spring:url value="/resources/css/bootstrap-theme.css" var="startertemplate"/>
  <link href="${bootstrap}" rel="stylesheet" />
  <link href="${startertemplate}" rel="stylesheet" />
</head>

<body>


<!-- таблица тем  -->
<!-- TODO: сделать блочную вёрстку ну или другим способом сделать это дерьмо более презентабельным -->
<table class="table table-hover" align="center">
<!--<table class="table-bordered" align="center">-->
    <!-- шапка -->
    <thead class="thead-inverse">
    <tr class="alert-info">
       <!-- <td><div class="h3" align="center">Темы</div></td>
        <td><div class="h3" align="center">Кол-во cообщений</div></td>
        <td><div class="h3" align="center">Последнее сообщение</div></td>-->
        <th>Название темы</th>
        <th>Количество сообщений</th>
        <th>Последнее сообщение</th>
    </tr>
    </thead>
    <!-- тело -->
    <tbody>
    <c:forEach items="${forumJSP.threads}" var="thread">
        <tr>
            <td>
                <div class="h4" align="left">
                    <c:out value="${thread.title}"/>
                    <div class="small">
                        <c:out value="${thread.creator.name}"/>
                        <c:out value="${thread.timeCreated}"/>
                    </div>
                </div>
            </td>
            <td>
                <div class="h4" align="left">
                    1
                <div/>
            </td>
            <td>
                <div class="h4" align="left">
                    <c:out value="${thread.timeUpdated}"/>
                    <div class="small">
                        <c:out value="${thread.lastUser.name}"/>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>

</table>


</body>

</html>