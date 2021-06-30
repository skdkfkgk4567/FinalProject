<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="assets/css/admin.css">
</head>
<body>
<div class="wrapper">
<%@include file="../sidebar.jsp"%>
	<div class="main-content">
		<div class="title-bbs"><a>전체 사용자 수 : ${total_bm} / 전체 사업자 수 : ${total_mb}</a></div>
		<div class="content-bbs">
			<div class="bbs-table">
				<h1 class="h1-title">사용자 정보</h1>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>별명</th>
								<th>전화번호</th>
								<th>관리</th>
							</tr>
	  					</thead>
						<tbody>
							<c:if test="${empty list_mb}">
								<tr>
									<td colspan="6" align="center">등록된 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="mdto" items="${list_mb}">
								<tr>
									<td>${mdto.id}</td>
									<td>${mdto.nm}</td>
									<td>${mdto.email}</td>
									<td>${mdto.ncnm}</td>
									<td>${mdto.telno}</td>
									<td><a href="modiBlackList.pi?id=${mdto.id}">블랙리스트 등록</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pdt20 pagenation">
						<div id="CampPaging" class="pagebox01">${pageStr }</div>
					</div>
					<h1 class="h1-title">사업자 정보</h1>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>별명</th>
								<th>전화번호</th>
								<th>관리</th>
							</tr>
	  					</thead>
						<tbody>
							<c:if test="${empty list_bm}">
								<tr>
									<td colspan="6" align="center">등록된 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="bdto" items="${list_bm}">
								<tr>
									<td>${bdto.id}</td>
									<td>${bdto.nm}</td>
									<td>${bdto.email}</td>
									<td>${bdto.ncnm}</td>
									<td>${bdto.telno}</td>
									<td><a href="modiBlackList.pi?id=${bdto.id}">블랙리스트 등록</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pdt20 pagenation">
						<div id="CampPaging" class="pagebox01">${pageStr }</div>
					</div>
					<h1 class="h1-title">블랙리스트</h1>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>이메일</th>
								<th>별명</th>
								<th>전화번호</th>
								<th>관리</th>
							</tr>
	  					</thead>
						<tbody>
							<c:if test="${empty list_bl}">
								<tr>
									<td colspan="6" align="center">등록된 블랙리스트 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="bldto" items="${list_bl}">
								<tr>
									<td>${bldto.id}</td>
									<td>${bldto.nm}</td>
									<td>${bldto.email}</td>
									<td>${bldto.ncnm}</td>
									<td>${bldto.telno}</td>
									<td>블랙리스트</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pdt20 pagenation">
						<div id="CampPaging" class="pagebox01">${pageStr }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>