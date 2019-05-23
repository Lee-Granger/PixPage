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
<div class="topBar"></div>
<div class="leftBar"></div>


<div class="content">
<div class="navBar">
	<p class="navText">PixPage</p>
	<span style="float:right; margin-top: 1em;" >
	<a href="/home">Home</a>
	<a href="/home/friend/list">Friends</a>
	<a href="/logout">Logout</a>	
	</span>
</div>
<h1 class="welcome">Welcome <c:out value="${ user.firstName }"/>!</h1>


<h4>My Albums: <span style="float:right"><a class="linkColor" href="/album/add/new">Add Album</a></span></h4>
<div class="albumsView">
	<c:forEach items="${ user.albums }" var="album">
		<div class="linkBorder">
			<c:choose>
				<c:when test="${ album.images.size() == 0 }">
					<div class="albumLink"><p>Empty Album</p></div>
				</c:when>
				<c:otherwise>
					<a class="linkColor" href="/album/view/${ album.id }"><div class="albumLink" style="background: url(data:image/png;base64,${ album.images[0].base64 }); background-size: 100% 100% "></div></a>
				</c:otherwise>
			</c:choose>		
		<a class="linkColor" href="/album/view/${ album.id }"><c:out value="${ album.name }"/></a>
 		<p>Pics in album: <c:out value="${ album.images.size() }"/></p> 
		</div>
	</c:forEach>
</div>



</div>

<div class="rightBar">
</div>
<div class="bottomBar"></div>
</body>
</html>
