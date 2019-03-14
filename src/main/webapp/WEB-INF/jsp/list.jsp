<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<table class="table table-hover" align="center">
		<c:forEach items="${users}" var="user">
			<tr align="center">
				<td>${user.id}</td>
				<td><a href="oneView?id=${user.id}">${user.name}</a></td>
				<td>${user.name}</td>
				<td>${user.depart}</td>
				<td>${user.position}</td>
				<td>${user.address}</td>
				<td>${user.special}</td>
				<td>
				${user.phone.num}
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>