<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
        <li class="nav-item">
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
		<div class="text-center" style="height:200px">
		<br>
		<br>
		프로필 영역
		<br>
		<br>
		
		</div>
		<c:forEach items="${phoneEdit}" var="phoneEdit" >
			<table class="table table-bordered" align="center" style="text-align:center;width:50%">
				<tr align="center" ><td style="width:30%">이름</td><td>${phoneEdit.name}</td></tr>
				<tr align="center"><td>부서</td><td>${phoneEdit.depart}</td></tr>
				<tr align="center"><td>직급</td><td>${phoneEdit.position}</td></tr>
				<tr align="center"><td>주소</td><td>${phoneEdit.address}</td></tr>
				<tr align="center"><td>비고</td><td>${phoneEdit.special}</td></tr>	
			</table>
		 <br><br><br><br>
		 <form name="addPhone" action="phoneSave" class="form-inline">
			<table class="table table-bordered" align="center" style="width:50%">
			<c:forEach items="${phoneEdit.phones}" var="phones" varStatus="status">
						<tr>
							<c:choose>
							<c:when test="${phoneid == phones.id}">
								<td>
									<input class="form-control" name="addNum1"  size="3" style="width:25%;" value="${fn:split(phones.num,'-')[0]}">
									<input class="form-control" name="addNum2"  size="4" style="width:30%;" value="${fn:split(phones.num,'-')[1]}">
									<input class="form-control" name="addNum3"  size="4" style="width:30%;" value="${fn:split(phones.num,'-')[2]}">
									<input type=hidden name="phoneid" value="${phones.id}">
									<input type=hidden name="userid" value="${phoneEdit.id}">
								</td>
								<td style="text-align:right">
								<input type=button class="btn btn-outline-secondary" value="뒤로가기" onClick="location.href='oneView?id=${phoneEdit.id}'">
								<input type=submit class="btn btn-outline-success" value="저장"></td>
							</c:when>
							<c:otherwise>
								<td>${phones.num}</td>
								<td><input type=hidden name="phoneid" value="${phones.id}"></td>
							</c:otherwise>
							</c:choose>
						</tr>
				</c:forEach>
				</table>
			</form>		
			</c:forEach>	
	</div>	
</main>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">담당자 연락처 : xxxx-xxxx<br>e-mail : xxxx123@gmail.com<br>© 2017-2019 Company, Inc.</span>
  </div>
</footer>	
</body>
</html>