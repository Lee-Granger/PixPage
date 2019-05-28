<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/loginFormStyleSheet.css" rel="stylesheet"/>
	<meta charset="UTF-8">
	<title>Login</title>
</head>
<body>
<div class="wrapper">
<div class="loginBox">
		<h2>Login</h2>
		<form action="/login" method="post">
			<p>
				<c:out value="${ errors }"/>
			</p>
			<p>
				<label>Email</label>
				<input type="email" name="email">
			</p>
			<p>
				<label>Password</label>
				<input type="password" name="password"/>
			</p>	
			<p>
				<input type="submit" value="Login"/>
			</p>
		</form>
		
	</div>
	
	<img src="<c:out value="/image/night_sky.jpg" />"/>
 </div>


	
</body>
</html>