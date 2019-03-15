<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<div style=" height:100px">상부 영역</div>

<div class="text-center" style="height:200px">
프로필 영역
</div>

<div class="container">
	<c:forEach items="${oneView}" var="oneViews">
		<table class="table table-bordered" align="center" style="text-align:center;width:50%">
			<tr align="center"><td>이름</td><td>${oneViews.name}</td></tr>
			<tr align="center"><td>부서</td><td>${oneViews.depart}</td></tr>
			<tr align="center"><td>직급</td><td>${oneViews.position}</td></tr>
			<tr align="center"><td>주소</td><td>${oneViews.address}</td></tr>
			<tr align="center"><td>비고</td><td>${oneViews.special}</td></tr>	
		</table>
		<table align="center" style="text-align:right;width:50%">
			<tr>
				<td>
					<input type=button class="btn btn-primary" value="뒤로가기" onClick="location.href='list'">
					<input type=button class="btn btn-primary" value="프로필 수정" onClick="location.href='editForm?id=${oneViews.id}'">
					<input type=button class="btn btn-primary" value="프로필 삭제" onClick="location.href='delete?id=${oneViews.id}'">
				</td>
			</tr>
		</table>
		<table class="table table-bordered" align="center" style="width:50%">
			<c:forEach items="${oneViews.phones}" var="phones">
					<tr><td>${phones.num}</td></tr><br><br>
			</c:forEach>
		</table>
	</c:forEach>
</div>			
</body>
</html>