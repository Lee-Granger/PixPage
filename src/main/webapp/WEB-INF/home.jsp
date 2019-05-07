<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/homeStyle.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
<h1>Welcome <c:out value="${ user.firstName }"/>!</h1>
<div class="logout"><a href="/logout">logout</a></div>
<div class="albumsView">
	<h4>Here are your albums</h4><a href="/album/add/new" class="addAlbumLink">Add Album</a>
	<br>
	<c:forEach items="${ user.albums }" var="album">
		<div class="albumLink">
			<a href="/album/view/${ album.id }"><c:out value="${ album.name }"/></a>
		</div>
	</c:forEach>
</div>

<div class="suggestedUsers">
	<p style="font-size: .9em; text-align:center">Here are some suggested users</p>
	<ul>
		<c:forEach items="${ userList }" var="person">
			<c:choose>
				<c:when test="${ user.id == person.id}">
				</c:when>
				<c:otherwise>
					<li><a href="/profile/view/${ person.id }"><c:out value="${ person.firstName }"/>  <c:out value="${ person.lastName }"/></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
</div>
	
</body>
</html>