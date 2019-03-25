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
<main>

</main>
<footer class="footer mt-auto py-3">
  <div class="container">
    <span class="text-muted">담당자 연락처 : xxxx-xxxx<br>e-mail : xxxx123@gmail.com<br>© 2017-2019 Company, Inc.</span>
  </div>
</footer>

</body>
</html>