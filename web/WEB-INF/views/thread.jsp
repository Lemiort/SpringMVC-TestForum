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
                                        <img class="img-rounded img-responsive " src="../../resources/images/av.jpg" alt="User avatar">
                                        <figcaption class="text-center"> <c:out value="${message.idUser.name}"/> </figcaption>
                                    </figure>

                                </section>
                            </section>
                            <div class="col-md-9" id="divmessage<c:out value="${message.idMessage}"/>">
                                <section id="message<c:out value="${message.idMessage}"/>"  >
                                    <c:out value="${message.text}"/>
                                </section>
                            </div>

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
                                <section class="col-md-3" id="bottom-panel<c:out value="${message.idMessage}"/>">
                                    <%--<a href="#"> Редактировать </a> |--%>
                                    <div type="button"  class="btn btn-link"
                                         onclick="editMessage(
                                                 'message<c:out value="${message.idMessage}"/>',
                                                 'bottom-panel<c:out value="${message.idMessage}"/>')"
                                    >
                                        Редактировать
                                    </div>
                                    <%--<u onclick="editMessage<c:out value="${message.idMessage}"/>()">Редактировать</u>|--%>
                                    <a href="#"> Удалить </a>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            </c:forEach>
            <form class="row clearfix"  >
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
                            <div class="col-md-offset-3 col-md-9">
                                <button type="button" id="button" name="submitButton" class="btn btn-default" onclick="sendMessage()">
                                    Отправить
                                </button>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </form>

        </section>
    </section>
</section>
<script>

    function sendMessage() {

        var xhr = new XMLHttpRequest();

        var id = "<c:out value="${threadJSP.idThread}" />";
        var name = "/thread?id="+id;
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

    function sendChanges() {

        var xhr = new XMLHttpRequest();

        var id = "<c:out value="${threadJSP.idThread}" />";

        // TODO: name
        var name = "/thread?id="+id;

        var text = document.getElementById("editArea").value;

        // TODO: body
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


    function deleteMessage(messageId) {

        var xhr = new XMLHttpRequest();

        var id = "<c:out value="${threadJSP.idThread}" />";

        // TODO: name
        var name = "/thread?id="+id;

        // TODO: body
        var body = "";

        // POST?????
        xhr.open("POST", name, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                location.reload();
            }
        };
        xhr.send(body);
    }

    function editMessage(message, buttonPanelName) {

        // adding text area
        var text = document.getElementById(message).innerText;
        var div = document.getElementById("div"+message);
        var textarea = document.createElement("textarea");
        textarea.type = "text";
        textarea.name = "text";
        textarea.id = "editArea";
        textarea.className = "form-control input-md editArea"; // set the CSS class
        textarea.value = text;
        div.innerHTML = "";
        div.appendChild(textarea); // put it into the DOM
        textarea.focus();

        // adding button(s)
        var buttonPanel = document.getElementById(buttonPanelName);
        var sendChangesButton = document.createElement('div');
        sendChangesButton.type = "button";
        sendChangesButton.className = "btn btn-link";
        sendChangesButton.onclick = function () {console.log('send changes')};
        sendChangesButton.innerText = "Сохранить изменения";

        buttonPanel.innerHTML = "";
        buttonPanel.appendChild(sendChangesButton);

    }
</script>
</body>
</html>