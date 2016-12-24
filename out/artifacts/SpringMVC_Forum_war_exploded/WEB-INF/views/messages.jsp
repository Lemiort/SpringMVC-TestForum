<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <title>All messages</title>
    <spring:url value="resources/css/bootstrap.css" var="bootstrap"/>
    <spring:url value="/resources/css/bootstrap-theme.css" var="startertemplate"/>
    <link href="${bootstrap}" rel="stylesheet" />
    <link href="${startertemplate}" rel="stylesheet" />
    <link href="../../resources/css/myStyle.css" rel="stylesheet" />
</head>

<body>



<section class="container">
    <section class="row clearfix">
        <section class="col-md-12 column">

            <ol class="breadcrumb">
                <li><a href="#">Forum</a></li>
                <li><a href="#">Web design</a></li>
                <li class="active">Help me in this code? </li>
            </ol>

        </section>
    </section>
    <section class="row clearfix">
        <section class="col-md-12 column">


            <c:forEach items="${messagesJSP}" var="message">
                <div class="row clearfix">
                    <div class="col-md-12 column">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <section class="panel-title">
                                    <time class="pull-right">
                                        <i class="fa fa-calendar"></i> 2014-09-15 , <i class="fa fa-clock-o"></i> 1:35 pm
                                    </time>
                                    <section class="pull-left" id="id">
                                        <abbr title="count of posts in this topic">#1</abbr>
                                    </section>
                                </section>
                            </div>
                            <section class="row panel-body">

                                <section id="user-description" class="col-md-3 ">
                                    <section class="well">

                                        <figure>
                                            <img class="img-rounded img-responsive" src="../../resources/images/av.jpg" alt="User avatar">
                                            <figcaption class="text-center"> <c:out value="${message.author.name}"/> </figcaption>
                                        </figure>

                                    </section>
                                </section>

                                <section class="col-md-9">
                                    <c:out value="${message.text}"/>
                                </section>

                            </section>
                            <div class="panel-footer">
                                <div class="row">
                                    <section class="col-md-3">
                                        <a href="#"> Редактировать </a> |
                                        <a href="#"> Удалить </a>|
                                        <a href="#"> Что-то ещё </a>
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </c:forEach>
        </section>
    </section>


    <form class="form-horizontal" action="messages" method="post">
        <fieldset>

            <!-- Form Name -->
            <legend>Добавить сообщение</legend>

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
    </form>


    <%--<form class="form-horizontal" action="messages" method="post">
        <fieldset>

            <!-- Form Name -->
            <legend>Добавить сообщение</legend>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-12 control-label" for="text">Текст сообщения</label>
                <div class="col-md-12">
                    <input id="text" name="text" type="text" placeholder="сообщение"
                           class="form-control input-md" required="">

                </div>
            </div>

            <!-- Button -->
            <div class="form-group">
                <label class="col-md-12 control-label" for="submitButton"></label>
                <div class="col-md-12">
                    <button type="submit" id="submitButton" name="submitButton" class="btn btn-success">
                        Отправить
                    </button>
                </div>
            </div>

        </fieldset>
    </form>--%>
</section>

</body>

</html>