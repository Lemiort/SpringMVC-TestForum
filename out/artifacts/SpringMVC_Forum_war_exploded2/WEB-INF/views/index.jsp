<!-- обратите внимание на spring тэги -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
  <title>Index Page</title>
  <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/js/bootstrap.min.js">
</head>

<body>
<spring:form method="post"  modelAttribute="userJSP" action="check-user">

  Name: <spring:input path="name"/> (path="" - указывает путь, используемый в modelAttribute=''. в нашем случае User.name)  <br/>
  Password: <spring:input path="password"/>   <br/>
  <spring:button>Next Page</spring:button>

</spring:form>

<div class="container">
  <div class="row">
    <div class="col-sm-offset-4 col-sm-4">
      <form class="form-horizontal" method="post" action="login">
        <fieldset>

          <!-- Form Name -->
          <legend>Введите логин и пароль</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-md-4 control-label" for="user">Имя пользователя</label>
            <div class="col-md-4">
              <input id="user" name="user" type="text" placeholder="Имя пользователя"
                     class="form-control input-md"
                     required="">

            </div>
          </div>

          <!-- Password input-->
          <div class="form-group">
            <label class="col-md-4 control-label" for="pass">Пароль</label>
            <div class="col-md-4">
              <input id="pass" name="pass" type="password" placeholder="Пароль"
                     class="form-control input-md"
                     required="">

            </div>
          </div>

          <!-- Button -->
          <div class="form-group">
            <label class="col-md-4 control-label" for="btn"></label>
            <div class="col-md-4">
              <button type="submit" id="btn" name="btn" class="btn btn-primary">Войти</button>
            </div>
          </div>

        </fieldset>
      </form>
    </div>
  </div>
</div>

</body>

</html>