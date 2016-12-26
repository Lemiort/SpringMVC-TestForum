<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>Index Page</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="resources/css/bootstrap-theme.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
    <link href="../../resources/css/myStyle.css" rel="stylesheet" />
</head>

<body>


<!-- таблица тем  -->
<!-- TODO: сделать блочную вёрстку ну или другим способом сделать это дерьмо более презентабельным -->
<%--<table class="table table-hover" align="center">
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
                    <a href="/thread?idThread=<c:out value="${thread.idThread}"/>"><c:out value="${thread.title}"/></a>
                    <div class="small">
                        <c:out value="${thread.creator.name}"/>
                        <c:out value="${thread.timeCreated}"/>
                    </div>
                </div>
            </td>
            <td>
                <div class="h4" align="left">
                    1
                </div>
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

</table>--%>

<div class="container">
        <section class="panel panel-info">
            <header class="panel-heading">
                <section class="panel-title">
                    <section class="col-md-9">
                        Название темы
                    </section>
                    <section class="col-md-3">
                        Количество сообщений
                    </section>
                   <%-- <section class="col-md-4">
                        Последнее сообщение
                    </section>--%>
                </section>
            </header>
            <section class="clearfix">
                <c:forEach items="${threadsJSP}" var="thread" >
                <div class="panel-body row topic-body col-md-12">
                    <section class="col-md-9">
                        <a href="/thread?id=<c:out value="${thread.idThread}"/>">
                            <c:out value="${thread.title}"/>
                        </a>
                    </section>
                    <section class="col-md-2">
                        <c:out value="${thread.messages.size()}"/>
                    </section>
                    <section class="col-md-1">
                        <div type="button"  class="btn btn-link"
                             onclick="deleteThread('<c:out value="${thread.idThread}"/>')"
                        >
                            Удалить
                        </div>
                    </section>
                   <%-- <section class="col-md-4">
                        dfdfdfs
                    </section>--%>
                </div>
                </c:forEach>
            </section>
        </section>

    <form class="form-horizontal" method="post">
        <fieldset>

            <!-- Form Name -->
            <legend>Добавить тему</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-12 control-label" for="title">Название темы</label>
                <div class="col-md-12">
                    <input  id="title" name="title"
                            class="form-control input-md" required="">
                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-12 control-label" for="submitButton"></label>
                <div class="col-md-12">
                    <button type="submit" id="submitButton" class="btn btn-success">
                        Создать
                    </button>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<script>
    function deleteThread(threadId) {
        var xhr = new XMLHttpRequest();

        var id = threadId;

        var name = "/delete_thread";

        var body = "id="+id;

        // POST
        xhr.open("POST", name, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                location.reload();
            }
        };
        xhr.send(body);
    }
</script>

</body>

</html>