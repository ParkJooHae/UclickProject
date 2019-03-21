<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script language="javascript" type="text/javascript" >

function submitForm(index){
		var i = index;
		var addNum1 = document.forms[i].addNum1.value;
		var addNum2 = document.forms[i].addNum2.value;
		var addNum3 = document.forms[i].addNum3.value;

		if(addNum1 == null || addNum1 == ""){
			alert('전화번호를 입력하세요.');
			return false;
		}
		if(addNum2 == null || addNum2 == ""){
			alert('전화번호를 입력하세요.');
			return false;
		}
		if(addNum3 == null || addNum3 == ""){
			alert('전화번호를 입력하세요.');
			return false;
		}
		if(addNum1.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			return false;
			}
		if(addNum2.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			return false;
			}
		if(addNum3.match(/[^0-9]/gi)){
			alert('숫자만 입력 가능합니다.');
			return false;
		}
	
}
</script>
</head>
<body>
<div style="height:200px;background-color:#819FF7;color:white;margin:10px;vertical-align:middle;">
		<div><a href="list" style="color:white;text-decoration:none;"><h1 class="display-1">JW컴퍼니 사내 연락 시스템</h1></a></div>	
</div>
<div class="container" >
중복 전화기 입력 불가<br>
숫자만 입력 가능
	<table class="table table-bordered" align="center" style="text-align:center; ">
			<tr align="center" bgcolor="#A9D0F5">
				<td width="10%">이름</td>
				<td width="10%">부서</td>
				<td width="10%">직급</td>
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
						<form name="addPhone" action="phoneSave" onsubmit="return submitForm(${status.index});">
							<input name="addNum1" maxlength="3" size="3" style="width:10%;" >
							<input name="addNum2" maxlength="4" size="4" style="width:15%;" >
							<input name="addNum3" maxlength="4" size="4" style="width:15%;" >
							<input type="hidden" name="userid" value="${users.id}" >
							<input type="submit" class="btn btn-primary" value="전화기 추가" >
						</form>
					</c:if>
					
					<c:if test="${fn:length(users.phones) == 3}">
						번호 등록은 3개 까지 가능합니다.	
						<form name="addPhone" action="phoneSave" onsubmit="return submitForm(${status.index});">
							<input type="hidden" name="addNum1">
							<input type="hidden" name="addNum2">
							<input type="hidden" name="addNum3">
							<input type="hidden" name="userid">
							<input type="hidden" class="btn btn-primary" value="전화기 추가" >
						</form></c:if>
				</td>	
			</tr>
		</c:forEach>
	</table>
</div>
<div class="text-center">
	<ul class="pagination">
	
	<c:choose>
		<c:when test="${searchOption==0}">
			<li><a href="list?page=1">&#9664;&#9664;</a></li>
			<li><a href="list?page=${prev}">&#9664;</a></li>
			<c:forEach var="i" begin="${start}" end="${end}" step="1">
				<li><a href="list?page=${i}">
					<c:choose>
						<c:when test="${viewpage == i}">
							<b>[${i}]</b>
						</c:when>
						<c:otherwise>
							${i}
						</c:otherwise>
					</c:choose>
				</a></li>
			</c:forEach>
			<li><a href="list?page=${next}">&#9654;</a></li>
			<li><a href="list?page=${lastpage}">&#9654;&#9654;</a></li>
		</c:when>
		<c:when test="${searchOption==1}">
		</c:when>
		<c:when test="${searchOption==2}">
		</c:when>

	</c:choose>
	
	</ul>
</div>
<br>
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
<br>
<div style="height:200px;background-color:#819FF7;color:white;left:0px; bottom:0px;width:100%;vertical-align:middle;">

</div >
</body>
</html>