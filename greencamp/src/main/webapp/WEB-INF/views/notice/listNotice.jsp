<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link type="text/css" href="assets/css/goods.css" rel="stylesheet">
<script src="assets/js/httpRequest.js"></script>
<script>
function show(delng_no,delngtp){
	var params;
	params = 'bbs_no='+delng_no+'&ctgry='+delngtp;
	sendXHR('bbsajax.pi',params,showResult,'GET');
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
			<li><a href="bbs.pi?ctgry=공지사항"><img src="assets/img/list.png" alt="공지사항" width="40px" height="40px"></a></li>
			<li><a href="bbs.pi?ctgry=이용안내"><img src="assets/img/구매흰.png" alt="이용안내" width="40px" height="40px"></a></li>
			<li><a href="bbs.pi?ctgry=질문"><img src="assets/img/판매 색.png" alt="자주묻는 질문" width="40px" height="40px"></a></li>
			<li><a href="bbs.pi?ctgry=이벤트"><img src="assets/img/판매 색.png" alt="이벤트" width="40px" height="40px"></a></li>
		</ul>
	</div>
	
	
	<div class="goodslist"><!-- 리스트가 들어가는 자리 -->
		<div class="goodswrite">
			<span class="sort">등록순</span>
			<span class="sort">조회순</span>
			<span class="sort">댓글순</span>
		</div>
		<div class="goodscard" id="goodscard">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<c:forEach var="ndto" items="${list}">
					<div class="col" onclick="show(${ndto.bbs_no},'${ndto.ctgry}')">
						<div class="card h-90">
						<c:url var="contentUrl" value="goods.pi">
							<c:param name="delng_no">${ndto.bbs_no}</c:param>
						</c:url>
							<div class="card-body">
								<h5 class="card-title">${ndto.sj}</h5>
								<p class="card-text">${ndto.cn}</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">${ndto.writngde}</small>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="goodsinfo" id="goodsajax"><!-- 게시글 내용이 들어가는 구역 -->
		
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
								<input type="checkbox" id="btn_addmsg">
								<label for="btn_addmsg">
									${infodto.ncnm}
								</label>
								<div class="msg">
									<form name="addmsgfm" action="addmsg.pi" method="post">
										<input type="hidden" name="rcver_id" value="comk">
										<input type="hidden" name="sender_id" value="${infodto.ncnm}">
										<div>
											<h2 align="center">메세지 보내기</h2>
										</div>
										<hr>
										<div>
											<table class="addmsgtable addmsgtable-sm">
												<tr>
													<th>보내는 이 : 닉네임</th>
												</tr>
												<tr>
													<th>받는 이 : ${infodto.ncnm}</th>
												</tr>
												<tr>
													<td colspan="2" align="center"><textarea rows="10" cols="70" name="cn"></textarea></td>
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
						<li>등록일</li>
						<li>댓글</li>
						<li>조회수  ${infodto.rdcnt}</li>
					</ul>
					<div class="goodsinfo_update_btn" align="right">
						<span><a href="Report.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.info_no}">신고</a></span>
					</div>
				</div>
				<hr>
			</div>
			<div class="goodsinfo_content">${infodto.cn}</div>
				<div class="goodsinfo_comment">
					<div>댓글쓰기</div>
					<form name="goods_comment_fm" action="goods_comment.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.bbs_no}" method="post">
						<div align="center">
							<textarea id="goods_comment" rows="5" cols="100" name="cn" 
							style="background-color: #ede7f6; width: 100%; display:inline;"></textarea>
							<input type="submit" class="subcomment" value="등록" style="margin-left: -20px;">
						</div>
					</form>
					<c:forEach var="cdto" items="${clist}">
					<div class="card border-info" style="width: 100%; background-color: #AFFFEE">
  						<div class="card-body text-primary">
						    <h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
								<p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
								<a href="delComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
								<a href="Report.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
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