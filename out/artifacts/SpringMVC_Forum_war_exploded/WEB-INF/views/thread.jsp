<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>Thread page ${threadId}</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/bootstrap-theme.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
    <link href="resources/css/myStyle.css" rel="stylesheet" />


    <script>
        function brAll(s) {
            if(s.indexOf("\n",0) != -1){
                s = s.replace("\n", "");
            }
            while (s.indexOf("\n",0) != -1){
                s = s.replace("\n", "<br>");
            }
            return s;
        }
    </script>

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
    <c:forEach items="${threadJSP.messages}" var="message">
    <tr>
        <td>
            <div class="h4" align="left">
                <c:out value="${message.text}"/>
                <!--<div class="small">
                    <c:out value="${thread.creator.name}"/>
                    <c:out value="${thread.timeCreated}"/>
                    <c:out value="${thread.idThread}"/>
                </div>-->
            </div>
        </td>
        <!--<td>
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
        </td>-->
    </tr>
    </c:forEach>

</table>--%>
<%--
<div class="container">
    <c:forEach items="${threadJSP.messages}" var="message">
    <div class="row">
        <div class="col-xs-9">
            <!-- сообшение -->
            <p>  <c:out value="${message.text}"/> </p>
        </div>
        <div class="col-xs-3">
            <p> autor </p>
            <img src="../../resources/images/av.jpg" class="img-rounded">
        </div>
    </div>
    </c:forEach>




</div>--%>


<section class="container">
    <section class="row clearfix">
        <section class="col-md-12 column">

            <ol class="breadcrumb">
                <li><a href="../">Главная</a></li>
                <li><c:out value="${threadJSP.title}"></c:out></li>
                <%--<li><a href="#">Web design</a></li>
                <li class="active">Help me in this code? </li>--%>
            </ol>

        </section>
    </section>
    <section class="row clearfix">
        <section class="col-md-12 column">

            <c:forEach items="${threadJSP.messages}" var="message">
            <div class="row clearfix">
                <div class="col-md-12 column">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <section class="panel-title">
                                <time class="pull-right">
                                    <i class="fa fa-calendar"></i> <c:out value="${message.date_posted.time}"/>
                                </time>
                                <section class="pull-left" id="idThread">
                                    <abbr> #<c:out value="${message.idMessage}"/></abbr>
                                </section>
                            </section>
                        </div>
                        <section class="row panel-body">

                            <section id="user-description" class="col-md-3 ">
                                <section class="well">

                                    <figure>
                                        <img class="img-rounded img-responsive" src="../../resources/images/av.jpg" alt="User avatar">
                                        <figcaption class="text-center"> <c:out value="${message.idUser.name}"/> </figcaption>
                                    </figure>

                                </section>
                            </section>

                            <section id="message<c:out value="${message.idMessage}"/>" class="col-md-9" >
                                <c:out value="${message.text}"/>
                            </section>

                            <script>
                                function BR<c:out value="${message.idMessage}"/>() {
                                    var s = document.getElementById("message<c:out value="${message.idMessage}"/>").innerHTML;
                                    s = brAll(s);
                                    document.getElementById("message<c:out value="${message.idMessage}"/>").innerHTML = s;
                                }

                                document.addEventListener("DOMContentLoaded", BR<c:out value="${message.idMessage}"/>);
                            </script>


                        </section>
                        <div class="panel-footer">
                            <div class="row">
                                <section class="col-md-3">
                                    <%--<a href="#"> Редактировать </a> |--%>
                                    <div type="button"  class="btn btn-link" onclick="editMessage<c:out value="${message.idMessage}"/>()">
                                        Редактировать
                                    </div>
                                    <%--<u onclick="editMessage<c:out value="${message.idMessage}"/>()">Редактировать</u>|--%>
                                    <a href="#"> Удалить </a>

                                    <script>
                                        function editMessage<c:out value="${message.idMessage}"/>() {
                                            var container = document.getElementById("message<c:out value="${message.idMessage}"/>");
                                            var input = document.createElement("input");
                                            input.type = "text";
                                            input.className = "form-control input-md"; // set the CSS class
                                            container.innerText = "";
                                            container.appendChild(input); // put it into the DOM
                                        }
                                    </script>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            </c:forEach>
            <form class="row clearfix" action="thread?id=<c:out value="${threadJSP.idThread}"/>" method="post" >
                <div class="col-md-12 column">

                    <fieldset>

                        <!-- Form Name -->
                        <legend onclick="sendMessage()">Написать новое сообщение</legend>

                        <!-- Textarea -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="text">Текст сообшения</label>
                            <div class="col-md-9">
                    <textarea class="form-control input-md" id="text" name="text" type="text"
                              placeholder="сообщение" required="" ></textarea>
                            </div>
                        </div>

                        <!-- Button -->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="submitButton"></label>
                            <div class="col-md-9">
                                <button type="submit" id="submitButton" name="submitButton" class="btn btn-default">
                                    Отправить
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </form>

            <%--<form class="form-horizontal" action="messages" method="post">
                <fieldset>

                    <!-- Form Name -->
                    <legend>Добавить сообщение</legend>

                    <!-- Text input-->
                    <div class="form-group">
                        &lt;%&ndash;<label class="col-md-12 control-label" for="text">Текст сообщения</label>&ndash;%&gt;
                        <div class="col-md-12">
                            <input name="text" type="text" placeholder="сообщение"
                                   class="form-control input-md" required="">

                        </div>
                    </div>

                    <!-- Button -->
                    <div class="form-group">
                        <label class="col-md-12 control-label" for="submitButton"></label>
                        <div class="col-md-12">
                            <button type="submit" idThread="submitButton" name="submitButton" class="btn btn-success">
                                Отправить
                            </button>
                        </div>
                    </div>

                </fieldset>
            </form>--%>
        </section>
    </section>
</section>
<script>
    function deleteMessage(message) {


    }

    function sendMessage() {

        var xhr = new XMLHttpRequest();


        //var name = "thread?id=<c:out value="${threadJSP.idThread}" />";
        var name = "/thread";

        var id = "<c:out value="${threadJSP.idThread}" />";
        var text = document.getElementById("text").value;

        var body = "id="+id+"&"+
                "text="+encodeURIComponent(text);

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