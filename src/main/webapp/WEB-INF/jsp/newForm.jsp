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
<form>
	<table class="table table-bordered" align="center" style="text-align:center;width:50%">
	
			<tr align="center"><td>이름</td><td> </td></tr>
			<tr align="center"><td>부서</td><td> </td></tr>
			<tr align="center"><td>직급</td><td> </td></tr>
			<tr align="center"><td>주소</td><td> </td></tr>
			<tr align="center"><td>비고</td><td> </td></tr>	
	</table>
	<table align="center" style="text-align:right;width:50%">
			<tr>
				<td>
					<input type=button class="btn btn-primary" value="뒤로가기" onClick="location.href='list'">
					<input type=button class="btn btn-primary" value="프로필 저장" onClick="location.href='save'">
				</td>
			</tr>
	</table>
</form>	
</div>
</body>
</html>