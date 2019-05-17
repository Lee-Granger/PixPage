<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Image Detail</title>
</head>
<body>
<a href="/home" style="float:right">Home</a>
<c:out value="id: ${ image.id }"/>
<h3>This photo belongs to: <c:out value="${ image.owner.firstName }  ${ image.owner.lastName }"/></h3>
<img src="data:image/png;base64,${ image.base64 }" width="200" height="150"/>
<p>
	<c:out value="${ image.description }"/>
</p>
<br />
<hr>
<c:forEach items="${ image.comments }" var="comment">
	<p>
		<c:out value="${ comment.user.firstName } ${ comment.user.lastName }: ${ comment.comment }"/>
		<c:choose>
			<c:when test="${ comment.user.id == sessId }">
				<a href="/comment/delete/${ comment.id }">- Delete this comment</a> 
			</c:when>
		</c:choose>
	</p>
</c:forEach>
<hr>
<c:choose>
	<c:when test="${ sessId == image.owner.id }">	
		<a href="/image/delete/${ image.id }"> DELETE</a>
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>
<form:form action="/post/comment/${ image.id }" method="post" modelAttribute="newComment">
	<p>
		<form:label path="comment">Add A Comment: </form:label>
		<form:textarea cols="40" rows="10" path="comment"/>
		<form:errors path="comment"/>
	</p>
	<input type="submit" value="Add Message"/>
</form:form>
	
</body>
</html>