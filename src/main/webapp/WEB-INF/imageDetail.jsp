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
<h3>This photo belongs to: <c:out value="${ image.owner.firstName }  ${ image.owner.lastName }"/></h3>
<img src="data:image/png;base64,${ image.base64 }" width="200" height="150"/>
<p>
	<c:out value="${ image.description }"/>
</p>
	
</body>
</html>