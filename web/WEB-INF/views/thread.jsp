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
                <li><a href="#">Forum</a></li>
                <li><a href="#">Web design</a></li>
                <li class="active">Help me in this code? </li>
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
                                    <i class="fa fa-calendar"></i> 2014-09-15 , <i class="fa fa-clock-o"></i> 1:35 pm
                                </time>
                                <section class="pull-left" idThread="idThread">
                                    <abbr title="count of posts in this topic">#1</abbr>
                                </section>
                            </section>
                        </div>
                        <section class="row panel-body">
                            <section class="col-md-9">
                                <c:out value="${message.text}"/>
                            </section>

                            <section idThread="user-description" class="col-md-3 ">
                                <section class="well">

                                    <figure>
                                        <img class="img-rounded img-responsive" src="../../resources/images/av.jpg" alt="User avatar">
                                        <figcaption class="text-center"> <c:out value="${message.idUser.name}"/> </figcaption>
                                    </figure>

                                </section>
                            </section>

                        </section>
                        <div class="panel-footer">
                            <div class="row">
                                <section class="col-md-3 ">

                                </section>
                                <section idThread="thanks" class="col-md-6">

                                </section>
                                <section class="col-md-3">
                                    <a href="#"> Reply With Quote </a> |
                                    <a href="#"> Reply </a>|
                                    <a href="#"> Edit Post </a>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            </c:forEach>
        </section>
    </section>
</section>


</body>

</html>