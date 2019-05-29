<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/profileViewStyle.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title><c:out value="${ otherUser.firstName }"/>'s Profile</title>
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
<h1><c:out value="${ otherUser.firstName } ${ otherUser.lastName }'s Profile"/></h1>
<h4>Albums:</h4>
<div class="usersAlbums">
	<c:forEach items="${ otherUser.albums }" var="album">
		<div class="albumBox">
			<a class="linkColor" href="/album/view/${ album.id }"><div class="albumLink" style="background: url(data:image/png;base64,${ album.images[0].base64 }); background-size: 100% 100% "></div></a> 
		</div>
	</c:forEach>
	
	
	
</div>
<c:choose>
	<c:when test="${ status == false }">
		<a href="/friend/add/${ otherUser.id }">Make Friend</a>
	</c:when>
	<c:otherwise>
		<p>You are already Friends - <a href="/remove/friend/${ otherUser.id }">Remove friend?</a></p>
	</c:otherwise>
</c:choose>
</div>
</body>
</html>