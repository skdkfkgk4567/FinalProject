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
		<div class="title-bbs"><a>전체 게시글 수 : ${total}</a></div>
		<div class="content-bbs">
			<div class="bbs-table">
				<h1 class="h1-title">캠핑정보 게시글</h1>
					<input type="checkbox" id="btn_write">
								<label for="btn_write">
									글쓰기
								</label>
								<div class="write">
								<article>
								<div class="container" role="main">
									<h2>캠핑정보 등록</h2>
									<br>
									<form name="writeCampinfoPost" id="form" method="post" action="writeCampinfoPost.pi">
										<div class="mb-3">
											<select class="form-select form-select-lg mb-1" name="ctgry" aria-label=".form-select-lg example">
                          							<option value="캠핑팁" selected>캠핑팁</option>
                           							<option value="캠핑음식">캠핑음식</option>
                           							<option value="텐트설치방법">텐트설치방법</option>
                         							</select>
										</div>
										<div class="mb-3">
											<label for="title">제목</label>
											<input type="text" class="form-control" name="sj" id="title" placeholder="제목을 입력해 주세요.">
										</div>
										<div class="mb-3">
											<label for="reg_id">비디오 주소</label>
											<input type="text" class="form-control" name="videosrc" id="reg_id" placeholder="비디오는 선택입니다.">
										</div>
										<div class="mb-3">
											<label for="content">내용</label>
											<textarea class="form-control" rows="5" name="cn" id="content" placeholder="내용을 입력해 주세요." ></textarea>
										</div>
										<div class="mb-3">
											<input type="submit" class="btn btn-sm btn-primary" value="등록하기">
										</div>
									</form>
								</div>
							</article>
							</div>
							<label for="btn_write" class="writebackground"></label>
					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th>번호</th>
								<th>카테고리</th>
								<th>닉네임</th>
								<th>제목</th>
								<th>날짜</th>
								<th>삭제</th>
							</tr>
	  					</thead>
						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="bdto" items="${list}">
								<tr>
									<td>${bdto.info_no}</td>
									<td>${bdto.ctgry}</td>
									<td>${bdto.ncnm}</td>
									<td>${bdto.sj}</td>
									<td><fmt:formatDate pattern="yy/MM/dd" value="${bdto.writngde}"/></td>
									<td><a href="deleteCampinfoPost.pi?info_no=${bdto.info_no}&ctgry=${bdto.ctgry}">삭제</a></td>
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