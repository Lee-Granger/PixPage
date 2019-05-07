<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Test Upload Page</title>
</head>
<body>
<h1>Test Page</h1>
<h3>Trying the upload image form:</h3>
<form method="post" action="/test/upload/chicken" enctype="multipart/form-data">
	<p>
		<label>File:</label>
		<input type="file" name="files" multiple>
	</p>
	<input type="submit" value="submit">
</form>
	
</body>
</html>