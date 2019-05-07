<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.wrapper {
		width: 99%;
		height: 475px;
		display: flex;
		justify-content: center;
		align-items: center;
		overflow: hidden;
		background-color: black;
		position: fixed;
	}
	img {
		position: absolute;
		min-height: 99%;
		max-height: 99%;
		z-index: -1;
		min-width: 99%;
		max-width: 99%;
		}
	button {
		width: 170px;
	}
	.login {
		margin-top: 175px;
	}
	h1 {
		position: relative;
		left: 10px;
		top: 100px;
		font-family: Verdana;
	}
	

</style>
	<meta charset="UTF-8">
	<title>Splash Page</title>
</head>
<body>
<div class="wrapper">
	<div class="links">
	<h1>PixPage!</h1>
		<a href="/login/page">Login</a>
		<a href="/register/page">Sign Up</a>
	</div>
	<img src="<c:out value="/image/starryNight.png" />"/>
</div>
	
</body>
</html>