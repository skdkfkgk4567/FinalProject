<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link type="text/css" href="assets/css/goods.css" rel="stylesheet">
<script src="assets/js/httpRequest.js"></script>
<script>
function show(delng_no,delngtp){
	var params;
	params = 'delng_no='+delng_no+'&ctgry='+delngtp;
	sendXHR('goodsajax.pi',params,showResult,'GET');
}

function showResult(){   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
         var data = XHR.responseText;
         document.getElementById("goodsajax").innerHTML = data;
      }
   }
}
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="goodscontent">
	<div class="goodstype" align="center"><!-- 버튼이 들어가는 자리 -->
		<ul class="goodsemenu">
			<li><a href="goods.pi?type=1"><img src="assets/img/전체.png" alt="전체" width="40px" height="40px"></a></li>
			<li><a href="goods.pi?type=2"><img src="assets/img/구매.png" alt="삽니당" width="40px" height="40px"></a></li>
			<li><a href="goods.pi?type=3"><img src="assets/img/판매.png" alt="팝니당" width="40px" height="40px"></a></li>
		</ul>
	</div>
	
	
	<div class="goodslist"><!-- 중고거래 리스트가 들어가는 자리 -->
	
		<c:if test="${!empty sessionScope.user_ncnm}">
	
		<div class="goodswrite">
			<input type="checkbox" id="btn_goodsadd">
			<label for="btn_goodsadd" style="margin: 15px;">
				글쓰기
			</label>
			<div class="goodsadd">
				<form name="goodsWrite" action="goodsWrite.pi" method="post">
				<input type="hidden" name="ncnm" value="${sessionScope.user_ncnm }">
					<div>
						<h2>중고마켓 글쓰기</h2>
					</div>
					<hr>
					<div>
						<table class="goodsaddtable goodsaddtable-sm">
							<tr>
								<th colspan="2">
									<select class="form-select form-select-lg mb-3" name="delngtp" aria-label=".form-select-lg example">
										<option value="삽니다" selected>구매</option>
										<option value="팝니다">판매</option>
									</select>
								</th>
							</tr>
							<tr>
								<th colspan="2">
									<div class="form-floating">
									  <input type="text" class="form-control" name="sj" id="floatingPassword" placeholder="제목" required>
									  <label for="floatingPassword">제목</label>
									</div>
								</th>
							</tr>
							<tr>
								<th  colspan="2">
									<select class="form-select form-select-lg mb-3" name="how" aria-label=".form-select-lg example">
										<option value="직거래" selected>직거래</option>
										<option value="택배거래">택배거래</option>
									</select>
								</th>
							</tr>
							<tr>
								<th colspan="2">
									<div class="form-floating">
										<input type="text" class="form-control" name="pc" id="floatingPassword" placeholder="금액" required>
										<label for="floatingPassword">금액</label>
									</div>
								</th>
							</tr>
							<tr>
								<th colspan="2">
									<div class="form-floating">
										<input type="text" class="form-control" name="addr" id="floatingPassword" placeholder="거래위치" required>
										<label for="floatingPassword">거래위치</label>
									</div>
								</th>
							</tr>
							<tr>
								<th colspan="2">
									<div class="form-floating">
										<input type="text" class="form-control" name="telno" id="floatingPassword" placeholder="연락처" required>
										<label for="floatingPassword">연락처</label>
									</div>
								</th>
							</tr>
							<tr>
								<th  colspan="2">
									<label class="input-file-button" for="input-file">
									  사진 등록
									</label>
									<input type="file" id="input-file" name="img" style="display:none">
								</th>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<textarea rows="10" cols="70" name="cn" wrap="hard" required></textarea>
								</td>
							</tr>
						</table>
					</div>
					<div align="center">
						<input type="submit" class="btn btn-info" value="등록하기">
						<input type="reset" class="btn btn-secondary" value="취소하기">
					</div>
				</form>
			</div>
		<label for="btn_goodsadd" class="goodsaddbackground"></label><!-- 글쓰기 배경 흐림 -->
		</div>
		</c:if>
		<!-- 로그인 했는지 검사 -->
		<c:if test="${empty list}">
			<h3 align="center">작성된 게시글이 없습니다 게시글을 등록해주세요</h3>
		</c:if>
		<div class="goodscard" id="goodscard">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<c:forEach var="gdto" items="${list}">
					<div class="col" onclick="show(${gdto.delng_no},'${gdto.delngtp}')">
						<div class="card h-90">
						<!-- 이미지가 있는지 확인 -->
						<c:if test="${!empty gdto.img}">
							<img src="assets/img/${gdto.img}" class="card-img-top" alt="..." style="max-width: 250px;">
						</c:if>
							<div class="card-body">
								<h5 class="card-title">${gdto.sj}</h5>
								<p class="card-text" style="text-align: left;">${gdto.cn}</p>
								<p class="card-text" style="text-align: left;">가격 : ${gdto.pc}</p>
							</div>
							<div class="card-footer">
								<small class="text-muted"><fmt:formatDate pattern="yy-MM-dd" value="${gdto.writngde}"/></small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="goodsinfo" id="goodsajax"><!-- 게시글 내용이 들어가는 구역 -->
		<c:if test="${empty list}">
			<h2 align="center">작성된 게시글이 없습니다 게시글을 등록해주세요</h2>
		</c:if>
		<c:forEach var="infodto" items="${infolist}">
			<div class="goodsinfoview">
				<div>
					<h2>${infodto.sj}</h2>
					<hr>
				</div>
				<div>
					<ul class="goodsinfoul">
						<li>
							<div>
								<c:if test="${null ne sessionScope.user_ncnm}">
								<input type="checkbox" id="btn_addmsg">
								</c:if>
								<label for="btn_addmsg">
									${infodto.ncnm}
								</label>
								<div class="msg">
									<form name="addmsgfm" action="goodsmsg.pi" method="post">
										<div>
											<h2 align="center">메세지 보내기</h2>
										</div>
										<hr>
										<div>
											<table class="addmsgtable addmsgtable-sm">
												<tr>
													<th>
														<div class="form-floating">
														  <input type="text" class="form-control" name="rcver_id" id="floatingPassword" placeholder="보내는 이" value="${sessionScope.user_ncnm}" readonly required>
														  <label for="floatingPassword">보내는 이</label>
														</div>
													</th>
												</tr>
												<tr>
													<th>
														<div class="form-floating">
														  <input type="text" class="form-control" name="sender_id" id="floatingPassword" placeholder="받는 이" value="${infodto.ncnm}" readonly required>
														  <label for="floatingPassword">받는 이</label>
														</div>
													</th>
												</tr>
												<tr>
													<td colspan="2" align="center"><textarea rows="10" cols="70" name="cn" wrap="hard" required></textarea></td>
												</tr>
											</table>
										</div>
										<div align="center">
											<input type="submit" class="btn btn-info" value="보내기">
											<input type="reset" class="btn btn-secondary" value="취소하기">
										</div>
									</form>
								</div>
								<label for="btn_addmsg" class="addmsgbackground"></label>
							</div>
						</li>
						<li>작성일 : <fmt:formatDate pattern="yy-MM-dd" value="${infodto.writngde}"/></li>
					</ul>
					<div class="goodsinfo_update_btn" align="right">
						
						<span>
						<a href="Report.pi?ctgry=${infodto.delngtp}&ctgry_no=${infodto.delng_no}">신고</a>&nbsp;&nbsp;
						<c:if test="${infodto.ncnm eq sessionScope.user_ncnm}">
						<a href="goodsdel.pi?delng_no=${infodto.delng_no}&delngtp=${infodto.delngtp}">삭제</a> &nbsp;&nbsp;
						<a href="goodssttus.pi?delng_no=${infodto.delng_no}">거래완료</a>&nbsp;&nbsp;
						</c:if>
						</span>
						<c:if test="${infodto.ncnm eq sessionScope.user_ncnm}">
						<input type="checkbox" id="btn_goodsupdate">
						<label for="btn_goodsupdate">
						 수정
						</label>
						<div class="goodsupdate">
							<form name="goodsupdatefm" action="goodsupdate.pi" method="post">
								<input type="hidden" name="delng_no" value="${infodto.delng_no}">
									<div>
										<h2 align="left">중고마켓 글수정하기</h2>
									</div>
									<hr>
									<div>
										<table class="goodsupdatetable goodsupdatetable-sm">
											<tr>
												<th>
													<div class="form-floating">
														<input type="text" class="form-control" name="sj" id="floatingPassword" placeholder="제목" value="${infodto.sj}" readonly required>
														<label for="floatingPassword">제목</label>
													</div>
												</th>
											</tr>
											<tr>
												<th>
													<select class="form-select form-select-lg mb-3" name="how" aria-label=".form-select-lg example">
														<option value="직거래" selected>직거래</option>
														<option value="택배거래">택배거래</option>
													</select>
												</th>
											</tr>
											<tr>
												<th>
													<div class="form-floating">
														<input type="text" class="form-control" name="pc" id="floatingPassword" placeholder="금액" value="${infodto.pc}" required>
														<label for="floatingPassword">금액</label>
													</div>
												</th>
											</tr>
											<tr>
												<th>
													<div class="form-floating">
														<input type="text" class="form-control" name="addr" id="floatingPassword" placeholder="거래위치" value="${infodto.addr}" required>
														<label for="floatingPassword">거래위치</label>
													</div>
												</th>
											</tr>
											<tr>
												<th>
													<div class="form-floating">
														<input type="text" class="form-control" name="telno" id="floatingPassword" placeholder="연락처" value="${infodto.telno}" required>
														<label for="floatingPassword">연락처</label>
													</div>
												</th>
											</tr>
											<tr>
												<th>
													<label class="input-file-button" for="input-file">사진 등록</label>
													<input type="file" id="input-file" name="img" style="display:none">
												</th>
											</tr>
											<tr>
												<td align="center"><textarea rows="10" cols="70" name="cn" wrap="hard" required>${infodto.cn}</textarea></td>
											</tr>
										</table>
									</div>
									<div align="center">
										<input type="submit" class="btn btn-info" value="수정하기">
										<input type="reset" class="btn btn-secondary" value="취소하기">
									</div>
								</form>
							</div>
							<label for="btn_goodsupdate" class="goodsupdatebackground"></label><!-- 글쓰기 배경 흐림 -->
							</c:if>
						</div>
					</div>
					<hr>
				</div>
				<c:if test="${'판매완료'eq infodto.sttus}">
				<div><img src="assets/img/판매완료.jpg" alt="전체" width="80px" height="80px" align="right" style="margin-right: 30px;"></div>
				</c:if>
				<c:if test="${null ne infodto.img}">
					<img src="assets/img/${infodto.img}" class="card-img-top" alt="..." style="max-width: 250px;">
				</c:if>
				<div class="goodsinfo_content">${infodto.cn}</div>
					<div class="goodsinfo_comment">
						<div>댓글쓰기</div>
						<form name="goods_comment_fm" action="goods_comment.pi?ctgry=${infodto.delngtp}&ctgry_no=${infodto.delng_no}&ncnm=${scssionScope.user_ncnm}" method="post">
							<c:choose>
								<c:when test="${null eq sessionScope.user_ncnm}">
								<div align="center">
									<textarea id="goods_comment" rows="5" cols="100" wrap="hard" name="cn" 
									style="background-color: #ede7f6; width: 100%; display:inline;"></textarea>
									<input type="submit" class="subcomment" value="등록" disabled>
								</div>
								</c:when>
								<c:otherwise>
								<div align="center">
									<textarea id="goods_comment" rows="5" cols="100" wrap="hard" required name="cn" 
									style="background-color: #ede7f6; width: 100%; display:inline;"></textarea>
									<input type="submit" class="subcomment" value="등록">
								</div>
								</c:otherwise>
							</c:choose>
						</form>
						<c:forEach var="cdto" items="${clist}">
						<div class="card border-info" style="width: 100%; background-color: #AFFFEE">
  							<div class="card-body text-primary">
							    <h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
							    <p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
							    <c:if test="${cdto.ncnm eq sessionScope.user_ncnm}">
							    <a href="goodsdelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
							    </c:if>
							    <a href="Report.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
							</div>
						</div>
						</c:forEach>
					</div>
		</c:forEach>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>