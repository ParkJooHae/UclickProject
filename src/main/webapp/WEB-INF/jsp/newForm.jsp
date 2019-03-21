<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
<div style="height:200px;background-color:#819FF7;color:white;vertical-align:middle;text-align:center;margin:auto;">
	<div style="padding:50px;color:white;vertical-align:middle;text-align:center;margin:auto;display:inline-block;">
		<a href="list" style="color:white;text-decoration:none;"><h1 class="display-1">JW컴퍼니 사내 연락 시스템</h1></a>	
	</div>
</div>
<script language="javascript" type="text/javascript" >
function submitForm(){
		var name = document.forms[0].name.value;
		var depart = document.forms[0].depart.value;
		var position = document.forms[0].position.value;
		var address = document.forms[0].address.value;
		var special = document.forms[0].special.value;

		if(name == null || name == ""){
				alert('이름을 입력하세요.');
				return false;
			}
		if(depart == null || depart == ""){
			alert('부서를 입력하세요.');
			return false;
		}
		if(position == null || position == ""){
			alert('직급을 입력하세요.');
			return false;
		}
		if(address == null || address == ""){
			alert('주소를 입력하세요.');
			return false;
		}
		if(name.match(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi)){
			alert('특수문자 사용이 불가능합니다.');
			document.forms[0].name.focus();
			return false;
		}
		if(depart.match(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi)){
			alert('특수문자 사용이 불가능합니다.');
			document.forms[0].depart.focus();
			return false;
		}
		if(position.match(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi)){
			alert('특수문자 사용이 불가능합니다.');
			document.forms[0].position.focus();
			return false;
		}
		if(address.match(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi)){
			alert('특수문자 사용이 불가능합니다.');
			document.forms[0].address.focus();
			return false;
		}
		if(special.match(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi)){
			alert('특수문자 사용이 불가능합니다.');
			document.forms[0].special.focus();
			return false;
		}
		
}
</script>
<div class="text-center" style="height:200px">
프로필 영역
</div>
<div class="container">
<form action="save" onsubmit="return submitForm();">
	<table class="table table-bordered" align="center" style="text-align:center;width:50%">
	
			<tr align="center"><td  style="width:30%">이름</td><td ><input type=text name="name" maxlength="50" style="width:80%;"> </td></tr>
			<tr align="center"><td>부서</td><td><input type=text name="depart" maxlength="50" style="width:80%;"></td></tr>
			<tr align="center"><td>직급</td><td><input type=text name="position" maxlength="50" style="width:80%;"></td></tr>
			<tr align="center"><td>주소</td><td><input type=text name="address" maxlength="50" style="width:80%;"></td></tr>
			<tr align="center"><td>비고</td><td><input type=text name="special" maxlength="50" style="width:80%;"></td></tr>	
	</table>
	<table align="center" style="text-align:right;width:50%">
			<tr>
				<td>
					<input type=button class="btn btn-primary  btn-sm " value="뒤로가기" onClick="location.href='list'">
					<input type=submit class="btn btn-primary  btn-sm" value="프로필 저장">
				</td>
			</tr>
	</table>
</form>	
</div>
<br>
<div style="height:200px;background-color:#819FF7;color:white;left:0px; bottom:0px;width:100%;vertical-align:middle;">

</div >
</body>
</html>