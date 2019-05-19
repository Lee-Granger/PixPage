<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/albumViewStyle.css" rel="stylesheet">
	<meta charset="UTF-8">
	<title>View Album</title>
</head>
<body>
<a href="/home" style="float:right">Home</a>
<h1>Album Name: <c:out value="${ album.name }"/></h1>
<c:choose>
	<c:when test="${ album.creator.id == sessId }">
		<form action="/album/delete/${ album.id }">
			<input type="submit" value="Delete Album" onclick="return confirm('Are you sure you want to delete this album?');">
		</form>
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>
<h4>This album belongs to: <c:out value="${ album.creator.firstName }"/> <c:out value="${ album.creator.lastName }"/></h4>
<h6><c:out value="${message}"/></h6>



<c:forEach items="${ album.images }" var="image">
	<div class="img">
		<a href="/image/view/${ image.id }"><img src="data:image/png;base64,${ image.base64 }" width="200" height="150"/></a>
		<c:choose>
			<c:when test="${ album.creator.id == sessId }">
				<form action="/image/delete/${ image.id }">
					<input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this picture?');">
				</form>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
	</div>
</c:forEach>


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

</body>
</html>