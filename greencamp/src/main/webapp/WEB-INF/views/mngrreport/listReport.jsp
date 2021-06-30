<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		<div class="title-bbs"><a>전체 신고수 : ${total_rp}</a></div>
		<div class="content-bbs">
			<div class="bbs-table">
				<h1 class="h1-title">신고관리</h1>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>신고횟수</th>
								<th>신고날짜</th>
								<th>관리</th>
							</tr>
	  					</thead>
						<tbody>
							<c:if test="${empty list_rp}">
								<tr>
									<td colspan="6" align="center">등록된 댓글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="rpdto" items="${list_rp}">
								<tr>
									<td>${rpdto.report_no}</td>
									<td>${rpdto.ctgry}</td>
									<td>${rpdto.rptcnt}</td>
									<td><fmt:formatDate pattern="yy/MM/dd" value="${rpdto.rptde}"/></td>
									<td><a href="deleteReport.pi?report_no=${rpdto.report_no}">신고처리</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pdt20 pagenation">
						<div id="CampPaging" class="pagebox01">${pageStr_rp }</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>