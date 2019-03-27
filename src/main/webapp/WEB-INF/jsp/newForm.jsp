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
<script src="/webjars/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){ 

function readURL(input) { 
	if (input.files && input.files[0]) { 
		var reader = new FileReader();
			reader.onload = function (e) { 
				$('#blah').attr('src', e.target.result); 
				} 
		reader.readAsDataURL(input.files[0]); 
			} 
		 }
	$("#imgInp").change(function(){ 

		readURL(this); 

	}); 
});

function submitForm(){

		var incheck = RegExp(/[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s\.]/gi);
	
		if($("#name").val()=="" || $("#name").val()== null){
			alert('이름을 입력하세요.');
			$("#name").focus();
			return false;
		}
		if($("#depart").val()=="" || $("#depart").val()== null){
			alert('부서를 입력하세요.');
			$("#depart").focus();
			return false;
		}
		if($("#position").val()=="" || $("#position").val()== null){
			alert('직급을 입력하세요.');
			$("#position").focus();
			return false;
		}
		if($("#address").val()=="" || $("#address").val()== null){
			alert('주소를 입력하세요.');
			$("#address").focus();
			return false;
		}
		
		if(!incheck.test($("#name").val())){
			alert('특수문자를 사용할 수 없습니다.');
			$("#name").focus();
			return false;
		}
		if(!incheck.test($("#depart").val())){
			alert('특수문자를 사용할 수 없습니다.');
			$("#depart").focus();
			return false;
		}
		if(!incheck.test($("#position").val())){
			alert('특수문자를 사용할 수 없습니다.');
			$("#position").focus();
			return false;
		}
		if(!incheck.test($("#address").val())){
			alert('특수문자를 사용할 수 없습니다.');
			$("#address").focus();
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
</header>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div class="container text-center">
			<br>
			<h1>사원 추가</h1>
			<br>
		</div>
		<br>
	<form action="save"  class="form-inline" onsubmit="return submitForm();">
		<div class="container text-center">
		<img id="blah" src="#" onerror="this.src='/resources/p.png'" class="img-thumbnail"/><br>
		<input type='file' class="btn btn-outline-secondary" name="file" id="imgInp" />
		<table class="table table-bordered" align="center" style="text-align:center;width:50%;">
				<tr align="center"><td  style="width:30%">이름</td><td ><input class="form-control" type=text name="name" id="name" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>부서</td><td><input class="form-control" type=text name="depart" id="depart" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>직급</td><td><input class="form-control" type=text name="position" id="position" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>주소</td><td><input class="form-control" type=text name="address" id="address" maxlength="50" style="width:80%;"></td></tr>
				<tr align="center"><td>비고</td><td><input class="form-control" type=text name="special" id="special" maxlength="50" style="width:80%;"></td></tr>	
		</table>
		</div>
		<div class="container" style="text-align:center;">
				<input type=button class="btn btn-outline-secondary " value="뒤로가기" onClick="location.href='list'">
				<input type=submit class="btn btn-outline-success" value="프로필 저장">
		</div>
	</form>	
	</div>
</main>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">담당자 연락처 : xxxx-xxxx<br>e-mail : xxxx123@gmail.com<br>© 2017-2019 Company, Inc.</span>
  </div>
</footer>
</body>
</html>