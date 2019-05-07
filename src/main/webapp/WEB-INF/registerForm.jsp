<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/css/registerFormStyle.css" rel="stylesheet"/>
	<meta charset="UTF-8">
	<title>Register Form</title>
</head>
<body>
<div class="registerBox">
		<h2>Register</h2>
		<form:form action="/register/user" method="post" modelAttribute="newUser">
			<p>
				<form:label path="firstName">First Name:</form:label>
				<form:input path="firstName"/>
				<form:errors path="firstName"/>
			</p>
			<p>
				<form:label path="lastName">Last Name: </form:label>
				<form:input path="lastName"/>
				<form:errors path="lastName"/>
			</p>
			<p>
				<form:label path="location">Location: </form:label>
				<form:select path="location">
					<option>Mars</option>
					<option>Your Mom</option>
				</form:select>
				<form:errors path="location"/>
			</p>
			<p>
				<form:label path="email">Email: </form:label>
				<form:input path="email"/>
				<form:errors path="email"/>
			</p>
			<p>
			<form:label path="bio">Tell Us About Yourself: </form:label>
			</p><p>
			<form:textarea cols="40" rows="6" path="bio"/>
			<form:errors path="bio"/>
			</p>
			<p>
				<form:label path="password">Password: </form:label>
				<form:input type="password" path="password"/>
				<form:errors path="password"/>
			</p>
			<p>
				<form:label path="passwordConfirmation">Confirm Password: </form:label>
				<form:password path="passwordConfirmation"/>
			</p>
			<input type="submit" value="submit"/>
		</form:form>
	</div>
	
</body>
</html>