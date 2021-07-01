<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑팁</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link type="text/css" href="assets/css/goods.css" rel="stylesheet">
<script src="assets/js/httpRequest.js"></script>
<script>
function show(info_no,ctgry){
	var params;
	params = 'info_no='+info_no+'&ctgry='+ctgry;
	sendXHR('campinfoajax.pi',params,showResult,'GET');
}

function showResult(){   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
         var data = XHR.responseText;
         document.getElementById("campinfoajax").innerHTML = data;
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
			<li><a href="listCampInfo.pi?type=1"><img src="assets/img/캠핑팁.png" alt="캠핑팁" width="40px" height="40px"></a></li>
			<li><a href="listCampInfo.pi?type=2"><img src="assets/img/캠핑음식.png" alt="캠핑음식" width="40px" height="40px"></a></li>
			<li><a href="listCampInfo.pi?type=3"><img src="assets/img/텐트설치방법.png" alt="텐트설치방법" width="40px" height="40px"></a></li>
		</ul>
	</div>
	
	<div class="goodslist"><!-- 리스트가 들어가는 자리 -->
		<c:if test="${empty list}">
			<h3 align="center">작성된 게시글이 없습니다 게시글을 등록해주세요</h3>
		</c:if>
		<div class="goodscard" id="goodscard">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<c:forEach var="idto" items="${list}">
					<div class="col" onclick="show(${idto.info_no},'${idto.ctgry}')">
						<div class="card h-90">
							<div class="card-body">
								<h5 class="card-title"  style="text-align: left;">${idto.sj}</h5>
								<p class="card-text text-truncate"  style="text-align: left;">${idto.cn}</p>
							</div>
							<div class="card-footer">
								<small class="text-muted"><fmt:formatDate pattern="yy-MM-dd" value="${idto.writngde}"/></small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="goodsinfo" id="campinfoajax"><!-- 게시글 내용이 들어가는 구역 -->
		<c:if test="${empty infolist}">
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
									<form name="addmsgfm" action="campinfomsg.pi" method="post">
										<input type="hidden" name="rcver_id" value="comk">
										<input type="hidden" name="sender_id" value="${infodto.ncnm}">
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
						<span><a href="campinfoReport.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.info_no}">신고</a></span>
					</div>
				</div>
				<hr>
			</div>
			<c:if test="${null ne infodto.videosrc}">
				<div align="center">${infodto.videosrc}</div>
			</c:if>
			<div class="goodsinfo_content">${infodto.cn}</div>
				<div class="goodsinfo_comment">
					<div>댓글쓰기</div>
					<form name="goods_comment_fm" action="campinfo_comment.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.info_no}&ncnm=${scssionScope.user_ncnm}" method="post">
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
								<a href="campinfodelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
								</c:if>
								<a href="campinfoReport.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
						</div>
					</div>
					</c:forEach>
				</div>
		</c:forEach>
	</div>
</div>
<div class="footer">footer 들어갈 자리</div>
</body>
</html>