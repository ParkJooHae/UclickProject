<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://getbootstrap.com/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://getbootstrap.com/docs/4.3/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet">
<style>
	footer {
	    position: fixed;
	    bottom:0;
	    width:100%;
		text-align:center;
	}
	.btn-space {
    	margin-right:5px;
	}
	table{
	  	vertical-align:middle;
	  	table-layout:fixed;
	}
	div {
		overflow-x:auto;
	}
	
</style>
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
</head>
<body>
 <header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="list">Uclick Project 사내 전화기 시스템</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
          <a class="nav-link" href="list">HOME<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="newForm">ADD USER</a>
        </li>
      </ul>
      <form class="form-inline mt-2 mt-md-0" action="list">
        <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="keyword">
        <select name="searchOption" class="custom-select mr-sm-2">
								<option value="1" >이름</option>
								<option value="2">전화기</option>
		</select>
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
</header>1
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div class="text-center" style="height:200px">
		<br>
		<br>
		프로필 영역
		<br>
		<br>
		</div>
	<form action="save"  class="form-inline" onsubmit="return submitForm();">
		<div class="container'">
		<table class="table table-bordered" align="center" style="text-align:center;width:50%;">
				<tr align="center"><td  style="width:30%">이름</td><td ><input class="form-control" type=text name="name" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>부서</td><td><input class="form-control" type=text name="depart" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>직급</td><td><input class="form-control" type=text name="position" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>주소</td><td><input class="form-control" type=text name="address" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>비고</td><td><input class="form-control" type=text name="special" maxlength="50" style="width:80%;"></td></tr>	
		</table>
		</div>
		<div class="container" style="text-align:center;">
				<input type=button class="btn btn-outline-secondary " value="뒤로가기" onClick="location.href='list'">
				<input type=submit class="btn btn-outline-secondary" value="프로필 저장">
		</div>
	</form>	
	</div>
</main>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">담당자 연락처 : xxxx-xxxx<br>e-mail : xxxx123@gmail.com</span>
  </div>
</footer>
</body>
</html>