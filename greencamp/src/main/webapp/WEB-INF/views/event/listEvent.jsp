<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link type="text/css" href="assets/css/goods.css" rel="stylesheet">
<script src="assets/js/httpRequest.js"></script>
<script>
function show(evnt_no,ctgry){
	var params;
	params = 'evnt_no='+evnt_no+'&ctgry='+ctgry;
	sendXHR('eventajax.pi',params,showResult,'GET');
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
			<li><a href="event.pi?type=1"><img src="assets/img/이벤트.png" alt="이벤트" width="40px" height="40px"></a></li>
			<li><a href="event.pi?type=2"><img src="assets/img/이용안내.png" alt="이용안내" width="40px" height="40px"></a></li>
		</ul>
	</div>
	
	
	<div class="goodslist"><!-- 중고거래 리스트가 들어가는 자리 -->
		<div class="goodscard" id="goodscard">
			<div class="row row-cols-1 row-cols-md-2 g-4">
				<c:forEach var="bdto" items="${list}">
					<div class="col" onclick="show(${bdto.evnt_no},'${bdto.ctgry}')">
						<div class="card h-90">
						<c:url var="contentUrl" value="bbs.pi">
							<c:param name="delng_no">${bdto.evnt_no}</c:param>
						</c:url>
							<div class="card-body">
								<h5 class="card-title"style="text-align: left;">${bdto.sj}</h5>
								<p class="card-text"style="text-align: left;">${bdto.cn}</p>
							</div>
							<div class="card-footer">
								<small class="text-muted">${bdto.pc}</small>
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
								<label>
									${infodto.id}
								</label>
							</div>
						</li>
					</ul>
					<div class="goodsinfo_update_btn" align="right">
						<span>
						<a href="noticeReport.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.evnt_no}">신고</a>
						</span> 
						
					</div>
				</div>
				<hr>
			</div>
			<div class="goodsinfo_content">${infodto.cn}</div>
				<div class="goodsinfo_comment">
					<div>댓글쓰기</div>
					<form name="goods_comment_fm" action="notice_comment.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.evnt_no}" method="post">
						<div align="center">
							<textarea id="goods_comment" rows="5" cols="100" name="cn" wrap="hard"
							style="background-color: #ede7f6; width: 100%; display:inline;" required></textarea>
							<input type="submit" class="subcomment" value="등록">
						</div>
					</form>
					<c:forEach var="cdto" items="${clist}">
					<div class="card border-info" style="width: 100%; background-color: #AFFFEE">
  						<div class="card-body text-primary">
						    <h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
						    <p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
						    <a href="noticedelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
						    <a href="noticeReport.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
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