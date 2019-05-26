<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/albumView.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>View Album</title>
</head>
<body>
<div class="rightBar"></div>
<div class="leftBar"></div>
<div class="topBar"></div>
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

<p class="albumName"><c:out value="${ album.name }"/></p>
<div class="images">
<c:forEach items="${ album.images }" var="image">
	<div class="imgBorder">
		<a href="/image/view/${ image.id }"><img src="data:image/png;base64,${ image.base64 }" /></a>
	</div>
</c:forEach>
</div>
<hr/>

<c:choose>
<c:when test="${ album.creator.id == sessId }">
<form action="/image/upload/${ album.id }" method="post" enctype="multipart/form-data">
<h3>Add a picture to this album</h3>
<h5><c:out value="${ error }"/></h5>
<p>
	<label>Upload Images(s): </label>
	<input type="file" name="files"/>
</p>
<p>
	<label>Describe your picture: </label>
	<input type="text" name="description">
</p>
<p>
	<input type="submit" value="submit">
</p>
</form>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>
</div>

<%-- <div class="rightBar">
	<p class="albumName"><c:out value="${ album.name }"/></p>
	<div class="line"></div>
	<c:choose>
	<c:when test="${ album.creator.id == sessId }">
		<form action="/album/delete/${ album.id }">
			<input type="submit" value="Delete Album" onclick="return confirm('Are you sure you want to delete this album?');">
		</form>
	</c:when>
	<c:otherwise>
		<p><a href="/profile/view/${ album.creator.id }">Back to <c:out value="${ album.creator.firstName }"/>'s profile</a></p>
	</c:otherwise>
</c:choose>
</div> --%>


</body>
</html>