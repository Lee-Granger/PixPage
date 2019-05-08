<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<style>
		h2 {
			display: inline-block;
		}
		
		.home {
			float: right;
		}
	</style>
	<meta charset="UTF-8">
	<title>Friends List</title>
</head>
<body>
<div class="wrapper">
	<h2>My Friends:</h2> <a class="home" href="/home">Home</a>
	<hr>
	<ul>
		<c:forEach items="${ user.friends }" var="friend">
			<li><a href="/profile/view/${ friend.id }"><c:out value="${ friend.firstName } ${ friend.lastName }"/></a></li>
		</c:forEach>
	</ul>
</div>
	
</body>
</html>