<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="assets/css/admin.css">
<link rel="stylesheet" type="text/css" href="assets/css/detailMngr.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Poor+Story&display=swap"
	rel="stylesheet">
<style>
/*--------------------delete css--------------------*/
#btn_goodsadd {
	display: none;
}

.goodsadd {
	margin: auto;
	padding: 50px;
	font-family: 'noto sans kr';
	width: 50%;
	height: 50%;
	overflow: auto;
	top: 10%;
	left: 25%;
	background: white;
	position: fixed;
	z-index: 999;
	visibility: hidden;
}

.goodsadd table {
	margin: 0px auto;
	margin-top: 50px;
	margin-bottom: 20px;
}

.goodsaddtable th {
	text-align: center;
}

.goodsaddtable tr {
	padding: 10px;
}

.goodsadd li {
	list-style: none;
}

.goodsaddbackground {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .3);
	transition: all.35s;
	opacity: 0;
	visibility: hidden;
	z-index: 998;
}

body input[id="btn_goodsadd"]:checked+label+div {
	visibility: visible;
}

body input[id="btn_goodsadd"]:checked ~.goodsaddbackground {
	opacity: 1;
	visibility: visible;
}

.pdt20 {
	padding-top: 20px !important;
	display: inline-block;
}

.pagenation {
	text-align: center;
	padding-bottom: 20px;
	min-width: 100%
}

.pagenation.pgtop {
	padding-top: 20px;
}

.pagebox01 {
	display: inline-block;
}

.pagebox01 img {
	padding: 0;
	margin: 0 1px;
	float: left
}

.pagebox01 .selected, .pagebox01 .notselected {
	text-decoration: none;
	font-size: 13px;
	padding: 0 2px 0 2px;
	min-width: 24px;
	text-align: center;
	line-height: 24px;
	height: 24px;
	font-weight: bold;
	display: inline-block;
	margin: 0 2px;
	background: #eee;
	float: left;
	border: 1px #ccc solid
}

.pagebox01 .selected {
	background: #25a5f0;
	color: #fff;
	border: none;
	border: 1px #25a5f0 solid
}

.pagebox01 .notselected {
	color: #222;
}

.pagebox01 .notselected:hover {
	background: #ccc;
	color: #fff;
	border-color: #ccc
}

.pageStr {
	text-align: center;
}
/*--------------------delete css--------------------*/
</style>
</head>
<body>
	<div class="wrapper">
		<%@include file="../sidebar.jsp"%>
		<div class="main-content">
			<div class="content-bbs">
				<div class="bbs-table">
					<h1 class="h1-title">캠핑톡 댓글</h1>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>캠핑장순번</th>
								<th>캠핑장이름</th>
								<th>주소</th>
								<th>전화번호</th>
								<th>타입</th>
								<th>상세보기</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="6" align="center">미승인된 업체가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="list" items="${list }">
								<tr>
									<td>${list.camp_no}</td>
									<td>${list.camp_nm}</td>
									<td>${list.addr}</td>
									<td>${list.camp_telno}</td>
									<td>${list.camp_type}</td>
									<td><input type="checkbox" id="btn_goodsadd"> <label
										for="btn_goodsadd"> 상세보기 </label>
										<div class="goodsadd">

											<div class="search_result">
												<span class="b fblue2"> ${list.camp_nm } </span>
											</div>
											<div class="search_result">
												<span class="b fblue2"> ${list.addr } </span>
											</div>
											<div class="search_result">
												<span class="b fblue2"> ${list.lat }</span> <span
													class="b fblue2"> ${list.longti }</span>
											</div>
											<div class="search_result">
												<span class="b fblue2"> ${list.camp_telno } </span>
											</div>
											<div class="d-flex flex-row">
												<div class="p-2 blockContent1">주변 환경</div>
												<div class="p-2 blockContent2">${list.camp_surround }</div>
												<div class="p-2 blockContent1">바닥 종류</div>
												<div class="p-2 blockContent2">${list.camp_ground }</div>
											</div>
											<c:set var="cvntl" value="${fn:split(list.cvntl,'+')}" />
											<div class="facilities">
												<span class="c_ico ico_tool"></span>
												<div class="facilities_all">
													<c:forEach var="cvn" items="${cvntl }">
														<div class="facilities_list">
															<p class="f_ico">
																<img
																	src="https://vga9354.synology.me:9898/img/${cvn }.svg"
																	alt="${cvn }" width="40" class="svg_ico">
															</p>
															<p class="f_name">${cvn }</p>
														</div>
													</c:forEach>
												</div>
											</div>
											<div class="b fblue2 campInfo">
												<span class="tophead">캠핑장 소개</span>
												<div class="short_cont">${list.camp_intro}</div>
											</div>
											<div class="b fblue2 campDetail">
												<span class="chead etc f18 "></span><span class="tophead">안내사항</span><br>
												<div class="short_cont">${list.camp_dc }</div>
											</div>
										</div> <label for="btn_goodsadd" class="goodsaddbackground"></label>
									</td>
									<td>
										<a href="recogCamp.pi?camp_no=${list.camp_no}">승인</a>
										<a href="compCamp.pi?camp_no=${list.camp_no}">반려</a>
									</td>
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