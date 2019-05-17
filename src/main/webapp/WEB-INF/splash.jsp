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
		height: 900px;
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
		width: 150px;
		height: 25px;
		border-radius: 5px;
		justify-content: center;
		align-items: center;
		
	}
	.login {
		margin-top: 175px;
	}
	h1 {
		/* position: relative; */
		left: 10px;
		top: 100px;
		font-family: Verdana;
		color:white;
		justify-content: center;
		font-size: 50px;
	}
	h4 {
		color:white;
	}
	.header {
		background-color: black;
		height: 65px;
		justify-content:center;
		text-align:center;
	}
	

</style>
	<meta charset="UTF-8">
	<title>Splash Page</title>
</head>
<body>
<div class="header">
	<h1>Welcome to PixPage!</h1>
</div>
<div class="wrapper">
	<div class="links">

	<h4>Come join our community, show us what you're passionate about!</h4>
		<button><a href="/login/page">Login</a></button>
		<button><a href="/register/page">Sign Up</a></button>
	</div>
	<img src="<c:out value="/image/night_sky.jpg" />"/>
</div>
	
</body>
</html>