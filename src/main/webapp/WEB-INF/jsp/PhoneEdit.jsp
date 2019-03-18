<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	<c:forEach items="${phoneEdit}" var="phoneEdit">
		<table class="table table-bordered" align="center" style="text-align:center;width:50%">
			<tr align="center" ><td style="width:30%">이름</td><td>${phoneEdit.name}</td></tr>
			<tr align="center"><td>부서</td><td>${phoneEdit.depart}</td></tr>
			<tr align="center"><td>직급</td><td>${phoneEdit.position}</td></tr>
			<tr align="center"><td>주소</td><td>${phoneEdit.address}</td></tr>
			<tr align="center"><td>비고</td><td>${phoneEdit.special}</td></tr>	
		</table>
		<table align="center" style="text-align:right;width:50%">
			<tr>
				<td>
					<input type=button class="btn btn-primary" value="뒤로가기" onClick="location.href='oneView?id=${phoneEdit.id}'">
				</td>
			</tr>
		</table> <br><br>
		<table class="table table-bordered" align="center" style="width:50%">
		<form action="phoneSave">
			<c:forEach items="${phoneEdit.phones}" var="phones">
					<tr>
					<td>
								<input name="addNum1"  size="3" style="width:10%;" value="${fn:split(phones.num,'-')[0]}">
								<input name="addNum2"  size="4" style="width:15%;" value="${fn:split(phones.num,'-')[1]}">
								<input name="addNum3"  size="4" style="width:15%;" value="${fn:split(phones.num,'-')[2]}">
					
							<input type=hidden name="phoneid" value="${phones.id}">
					</td>
						<td style="text-align:right">
							<input type=submit class="btn btn-primary" value="저장"">
						</td>
					</tr>
			</c:forEach>
		</form>	
		</table>
	</c:forEach>
</div>			
</body>
</html>