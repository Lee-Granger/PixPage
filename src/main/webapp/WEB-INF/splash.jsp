<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/splashStyle.css"/>
	<meta charset="UTF-8">
	<title>Splash Page</title>
</head>
<body>
<div class="wrapper">
<div class="header">
	<h1>Welcome to PixPage!</h1>
</div>

	<div class="links">

	<h4>Come join our community, show us what you're passionate about!</h4>
		<a href="/login/page">Login</a>
		<!-- <a href="/register/page">Sign Up</a> -->
	</div>
	<img src="<c:out value="/image/night_sky.jpg" />"/> 
</div>
</body>
</html>