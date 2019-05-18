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
<div class="leftBar">
	<a href="/home">Home</a>
	<a href="/logout">Logout</a>
</div>



<div class="content">
<h1>Welcome <c:out value="${ user.firstName }"/>!</h1>

<%-- <img src="data:image/png;base64,${ user.albums[0].images[0].base64 }" width="200" height="150"/> --%>

<h4>My Albums:</h4>
<div class="albumsView">
	<c:forEach items="${ user.albums }" var="album">
		<div class="albumLink">
		<%-- <img class="firstImage" src="data:image/png;base64,${ album.images[0].base64 }"/> --%>
			<a href="/album/view/${ album.id }"><c:out value="${ album.name }"/></a>
			<p>Pics in album: <c:out value="${ album.images.size() }"/></p>
		</div>
	</c:forEach>
</div>



</div>
<h4><a href="/album/add/new">Add Album</a></h4>
<div class="rightBar">
	<a href="/home/friend/list"><c:out value="You have: ${ user.friends.size() } friend(s)"/></a>
	<p>Suggested Users:</p>
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