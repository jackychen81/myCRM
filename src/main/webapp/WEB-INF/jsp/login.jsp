<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link type="text/css" rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="resources/css/signin.css">
<script type="text/javascript" src="resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.kickout{
	color:red;
}
</style>
</head>
<body>
<div class="content">
	<div>
		<form class="form-signin" action="login" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <c:if test="${kickoutMessage != null}">
        	<h5 class="kickout">${kickoutMessage }</h5>
        </c:if>
        <label for="inputEmail" class="sr-only">User name</label>
        <input type="text" id="username" name="username" class="form-control" value="" placeholder="InfoPath User name" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="password" name="password" value="" class="form-control" placeholder="InfoPath Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="1" name="remember" checked="checked"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
	</div>
</div>
</body>
</html>