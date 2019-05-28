<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/friendListStyle.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>Friends List</title>
</head>
<body>
<div class="topBar"></div>
<div class="leftBar"></div>
<div class="rightBar"></div>
<div class="bottomBar"></div>
<div class="content">
	<div class="navBar">
		<p class="navText">PixPage</p>
		<span style="float:right; margin-top: 1em;" >
		<a href="/home">Home</a>
		<a href="/home/friend/list">Friends</a>
		<a href="/logout">Logout</a>	
		</span>
	</div>
<div class="box">
	<h2>My Friends</h2>
	<hr>
	<ul>
		<c:forEach items="${ user.friends }" var="friend">
			<li><a href="/profile/view/${ friend.id }"><c:out value="${ friend.firstName } ${ friend.lastName }"/></a></li>
		</c:forEach>
	</ul>
</div>
<div class="box">
	<h2>Suggested Friends</h2>
	<hr>
	<ul>
		<c:forEach items="${ suggested }" var="friend">
			<li><a href="/profile/view/${ friend.id }"><c:out value="${ friend.firstName } ${ friend.lastName }"/></a></li>
		</c:forEach>
	</ul>
</div>
</div>

	
</body>
</html>