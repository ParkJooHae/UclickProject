<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script language="javascript" type="text/javascript" >

function submitForm(){
		var i = 0;
	for(i=0;i<3;i++){
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
}
</script>
</head>
<body>
<div style="height:200px;background-color:#819FF7;color:white;margin:10px;><h1 class="display-1">JW컴퍼니 사내 연락 시스템</h1></div>

<div class="text-center" style="height:200px">
프로필 영역
</div>

<div class="container">
	<c:forEach items="${phoneEdit}" var="phoneEdit" >
		<table class="table table-bordered" align="center" style="text-align:center;width:50%">
			<tr align="center" ><td style="width:30%">이름</td><td>${phoneEdit.name}</td></tr>
			<tr align="center"><td>부서</td><td>${phoneEdit.depart}</td></tr>
			<tr align="center"><td>직급</td><td>${phoneEdit.position}</td></tr>
			<tr align="center"><td>주소</td><td>${phoneEdit.address}</td></tr>
			<tr align="center"><td>비고</td><td>${phoneEdit.special}</td></tr>	
		</table>
	 <br><br><br><br>
	 <form name="addPhone" action="phoneSave"">
		<table class="table table-bordered" align="center" style="width:50%">
			<c:forEach items="${phoneEdit.phones}" var="phones" varStatus="status">
					<tr>
						<td>
							<input name="addNum1"  size="3" style="width:10%;" value="${fn:split(phones.num,'-')[0]}">
							<input name="addNum2"  size="4" style="width:15%;" value="${fn:split(phones.num,'-')[1]}">
							<input name="addNum3"  size="4" style="width:15%;" value="${fn:split(phones.num,'-')[2]}">
							<input type=hidden name="phoneid" value="${phones.id}">
						</td>
					</tr>
			</c:forEach>
			</table>
				<table align="center" style="text-align:right;width:50%">
				<tr>
					<td>
						<input type=button class="btn btn-primary" value="뒤로가기" onClick="location.href='oneView?id=${phoneEdit.id}'">
						<input type=submit class="btn btn-primary" value="저장">
					</td>
				</tr>
			</table>
		</form>	
	</c:forEach>
	
</div>			
</body>
</html>