<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<table class="table table-hover" align="center">
		<c:forEach items="${users}" var="users" >
			<tr align="center">
				<td>${users.id}</td>
				<td><a href="oneView?id=${users.id}">${users.name}</a></td>
				<td>${users.name}</td>
				<td>${users.depart}</td>
				<td>${users.position}</td>
				<c:forEach items="${users.phones}" var="phone">
					<td>${phone.num}</td>
				</c:forEach>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>