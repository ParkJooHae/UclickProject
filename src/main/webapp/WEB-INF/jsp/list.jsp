<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script language="javascript" type="text/javascript" >
var i =0;
function submitForm(){

	
		var addNum1 = document.forms[i].addNum1.value;
		var addNum2 = document.forms[i].addNum2.value;
		var addNum3 = document.forms[i].addNum3.value;

		if(addNum1.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			document.forms[i].addNum1.focus();
			return false;
			}
		if(addNum2.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			document.forms[i].addNum2.focus();
			return false;
			}
		if(addNum3.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			document.forms[i].addNum3.focus();
			return false;
			}
	return true;
}
</script>
</head>
<body>
<div style=" height:200px">상부 영역</div>
<div class="container">
	<table class="table table-bordered" align="center" style="text-align:center;vertical-align:middle'">
			<tr align="center">
				<td>이름</td>
				<td>부서</td>
				<td>직급</td>
				<td colspan="2">전화 번호</td>
			</tr>
		<c:forEach items="${users}" var="users" varStatus="status">
			<tr align="center">
				<td><a href="oneView?id=${users.id}">${users.name}</a></td>
				<td>${users.depart}</td>
				<td>${users.position}</td>
				<td>
				<c:forEach items="${users.phones}" var="phones">
					${phones.num}<br>
				</c:forEach>
				</td>
				<td>
					<c:if test="${fn:length(users.phones) < 3}">
						<form name="addPhone" action="phoneSave" onsubmit="return submitForm();">
							<input name="addNum1" maxlength="3" size="3" style="width:10%;">
							<input name="addNum2" maxlength="4" size="4" style="width:15%;">
							<input name="addNum3" maxlength="4" size="4" style="width:15%;">
							<input type="hidden" name="userid" value="${users.id}" >
							<input type="submit" class="btn btn-primary" value="전화기 추가" >
						</form>
					</c:if>
					<c:if test="${fn:length(users.phones) == 3}">번호 등록은 3개 까지 가능합니다.</c:if>
				</td>	
			</tr>
		</c:forEach>
	</table>
</div>
<div class="container">
	<table width="100%">
		<tr>
			<td width="90%">
				<form name="search" action="list">
					<input name="keyword">
						<select name="searchOption">
							<option value="1">이름</option>
							<option value="2">전화기</option>
						</select>
					<input type="submit" class="btn btn-primary" value="검색">
				</form>
			</td>
			<td>
				<input type=button class="btn btn-primary" value="사용자 추가" onClick="location.href='newForm'">	
			</td>
		</tr>
	</table>
</div>
</body>
</html>