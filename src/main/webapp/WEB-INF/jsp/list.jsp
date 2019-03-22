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
 <header>
  <!-- Fixed navbar -->
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="list">Uclick Project 사내 전화기 시스템</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
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

	<div class="container" >
		<div>
		중복 전화기 입력 불가<br>
		숫자만 입력 가능
		</div>
		<table class="table table-bordered" align="center" style="text-align:center;">
				<thead>
				<tr align="center">
					<td width="15%">이름</td>
					<td width="10%">부서</td>
					<td width="10%">직급</td>
					<td width="15%">전화 번호</td>
					<td >번호 추가</td>
				</tr>
				</thead>
				<tbody>
			<c:forEach items="${users}" var="users" varStatus="status">
				<tr align="center">
					<td><a style="color:black;text-decoration:none;" href="oneView?id=${users.id}"><b>${users.name}</b></a></td>
					<td>${users.depart}</td>
					<td>${users.position}</td>
					<td width="20%">
					<c:forEach items="${users.phones}" var="phones">
						${phones.num}<br>
					</c:forEach>
					</td>
					<td width="45%">
						<c:if test="${fn:length(users.phones) < 3}">
							<form class="form-inline" name="addPhone" action="phoneSave" onsubmit="return submitForm(${status.count});">
								<input class="form-control" name="addNum1" maxlength="3" size="3" style="width:15%;" >&nbsp;&nbsp;-&nbsp;&nbsp;
								<input class="form-control" name="addNum2" maxlength="4" size="4" style="width:20%;" >&nbsp;&nbsp;-&nbsp;&nbsp;
								<input class="form-control" name="addNum3" maxlength="4" size="4" style="width:20%;" >
								<input type="hidden" name="userid" value="${users.id}" >&nbsp;&nbsp;
								<input type="submit" class="btn btn-outline-success" value="전화기 추가" >
							</form>
						</c:if>
						<c:if test="${fn:length(users.phones) == 3}">
							번호 등록은 3개 까지 가능합니다.	
							<form name="addPhone" action="phoneSave" onsubmit="return submitForm(${status.index});">
								<input type="hidden" name="addNum1">
								<input type="hidden" name="addNum2">
								<input type="hidden" name="addNum3">
								<input type="hidden" name="userid">
								<input type="hidden" value="전화기 추가" >
							</form></c:if>
					</td>	
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="container">
		<ul class="pagination pagination-sm" style="text-align:center;width:20%;margin-left:auto;margin-right:auto;">
		<c:choose>
			<c:when test="${searchOption==0}">
				<li class="page-item"><a style="color:black;" class="page-link" href="list?page=1">&#9664;&#9664;</a></li>
				<li class="page-item"><a style="color:black;" class="page-link" href="list?page=${prev}">&#9664;</a></li>
				<c:forEach var="i" begin="${start}" end="${end}" step="1">
					<li class="page-item"><a style="color:black;" class="page-link" href="list?page=${i}">
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
				<li class="page-item"><a style="color:black;" class="page-link" href="list?page=${next}">&#9654;</a></li>
				<li class="page-item"><a style="color:black;" class="page-link" href="list?page=${lastpage}">&#9654;&#9654;</a></li>
			</c:when>
			<c:when test="${searchOption==1}">
			</c:when>
			<c:when test="${searchOption==2}">
			</c:when>
		</c:choose>
		</ul>
	</div>
</main>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">담당자 연락처 : xxxx-xxxx<br>e-mail : xxxx123@gmail.com</span>
  </div>
</footer>

</body>
</html>