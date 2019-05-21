<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/imageDetailStyle.css">
	<meta charset="UTF-8">
	<title>Image Detail</title>
</head>
<body>

<div class="leftBar">
	<a href="/home">Home</a>
	<a href="/logout">Logout</a>
</div>

<div class="content">
<div class="imageWrapper">
	<img src="data:image/png;base64,${ image.base64 }"/>
</div>
<p class="desc">
	<c:out value="${ image.description }"/>
</p>
<br />
<div class="comments">
<c:forEach items="${ image.comments }" var="comment">
	<p>
		<c:out value="${ comment.user.firstName } ${ comment.user.lastName }: ${ comment.comment }"/>
		<c:choose>
			<c:when test="${ comment.user.id == sessId }">
				<a href="/comment/delete/${ comment.id }/${ image.id }">- Delete this comment</a> 
			</c:when>
		</c:choose>
	</p>
</c:forEach>
</div>
<form:form action="/post/comment/${ image.id }" method="post" modelAttribute="newComment">
	<p>
		<form:label path="comment">Add A Comment: </form:label>
		<form:textarea cols="40" rows="10" path="comment"/>
		<form:errors path="comment"/>
	</p>
	<input type="submit" value="Add Message"/>
</form:form>
</div>

<div class="rightBar">
	<c:choose>
		<c:when test="${ sessId == image.owner.id }">	
			<form action="/image/delete/${ image.id }">
			<input type="submit" value="Delete Image" onclick="return confirm('Are you sure you want to delete this image?');">
		</form>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</div>
	
</body>
</html>