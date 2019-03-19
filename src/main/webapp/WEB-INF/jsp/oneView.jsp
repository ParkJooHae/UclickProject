<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<div style="height:200px;background-color:#819FF7;color:white;margin:10px"><h1 class="display-1">JW컴퍼니 사내 연락 시스템</h1></div>

<div class="text-center" style="height:200px">
프로필 영역
</div>

<div class="container">
	<c:forEach items="${oneView}" var="oneViews">
		<table class="table table-bordered" align="center" style="text-align:center;width:50%">
			<tr align="center" ><td style="width:30%">이름</td><td>${oneViews.name}</td></tr>
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
		</table> <br><br>
		<table class="table table-bordered" align="center" style="width:50%">
			<c:forEach items="${oneViews.phones}" var="phones">
					<tr>
					<td>${phones.num}</td>
						<td style="text-align:right">
							<input type=button class="btn btn-primary" value="삭제" onClick="location.href='phoneDelete?id=${phones.id}'">
						</td>
					</tr>
			</c:forEach>
		</table>
		<table align="center" style="text-align:right;width:50%">
			<tr>
				<td>
				<c:if test="${fn:length(oneViews.phones)  >= 1}">
					<input type=button class="btn btn-primary" value="전화기 수정" onClick="location.href='PhoneEdit?id=${oneViews.id}'">
				</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
</div>			
</body>
</html>