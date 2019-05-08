<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		.usersAlbums {
			border: 2px solid black;
		}
		.albumBox {
			display: inline-block;
			border: 2px solid red;
			height: 65px;
			width: 65px;
			text-align: center;
		}
	</style>
	<meta charset="UTF-8">
	<title><c:out value="${ otherUser.firstName }"/>'s Profile</title>
</head>
<body>
<a href="/home" style="float:right">Home</a>
<h1><c:out value="${ otherUser.firstName } ${ otherUser.lastName }'s Profile"/></h1>
<div class="usersAlbums">
	<c:forEach items="${ otherUser.albums }" var="album">
		<div class="albumBox">
			<a href="/album/view/${ album.id }"><c:out value="${ album.name }"/></a> 
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

</body>
</html>