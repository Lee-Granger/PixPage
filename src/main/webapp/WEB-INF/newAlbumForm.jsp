<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/newAlbumFormStyle.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>Create Album</title>
</head>
<body>
<div class="topBar"></div>
<div class="leftBar"></div>
<div class="bottomBar"></div>
<div class="rightBar"></div>
<div class="content">
<div class="navBar">
	<p class="navText">PixPage</p>
	<span style="float:right; margin-top: 1em;" >
	<a href="/home">Home</a>
	<a href="/home/friend/list">Friends</a>
	<a href="/logout">Logout</a>	
	</span>
</div>
<h1>Hey <c:out value="${ user.firstName }"/> let's create a new album!</h1>
<div class="form">
	<form:form action="/post/new/album" method="post" modelAttribute="newAlbum">
		<p>
			<form:label path="name">Name your album:</form:label>
			<form:input path="name"/>
			<form:errors path="name"/>
		</p>
		<p>
			<form:label path="description">Describe your Album: </form:label>
			<form:input path="description"/>
			<form:errors path="description"/>
		</p>
		<form:input  path="creator" type="hidden" value="${ user.id }"/>
		<p>
			<input type="submit" value="Create Album"/>
		</p>
	</form:form>
</div>
</div>
	
</body>
</html>