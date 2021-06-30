<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
.pdt20  {padding-top:20px !important; display:inline-block;}
.pagenation {text-align:center;padding-bottom:20px;min-width:100%}
.pagenation.pgtop {padding-top:20px;}
.pagebox01 {display:inline-block;}
.pagebox01 img {padding:0;margin:0 1px;float:left}
.pagebox01 .selected, .pagebox01 .notselected {text-decoration:none;font-size:13px;padding:0 2px 0 2px;min-width:24px;text-align:center;line-height:24px;height:24px;font-weight:bold;display:inline-block;margin:0 2px;background:#eee;float:left;border:1px #ccc solid}
.pagebox01 .selected {background:#25a5f0 ;color:#fff;border:none;border:1px #25a5f0 solid}
.pagebox01 .notselected {color:#222;}
.pagebox01 .notselected:hover {background:#ccc;color:#fff;border-color:#ccc}
</style>
<div class="sidebar">
	<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingOne">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
       				캠핑톡
     				</button>
   			</h2>
   			<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listCampTalkComment.pi">댓글</a><br>
     					<a href="listCampTalkPost.pi">게시글</a>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingTwo">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
       				중고거래
     				</button>
   			</h2>
   			<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listTradeComment.pi">댓글</a><br>
     					<a href="listGoodsPost.pi">게시글</a>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingThree">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
       				캠핑장
     				</button>
   			</h2>
   			<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listCampsiteComment.pi">댓글</a><br>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingFour">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
       				공지사항
     				</button>
   			</h2>
   			<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listNoticeComment.pi">댓글</a><br>
     					<a href="listNoticePost.pi">게시글</a>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingFive">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
       				캠핑정보
     				</button>
   			</h2>
   			<div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listCampTipComment.pi">댓글</a><br>
     					<a href="listCampinfoPost.pi">게시글</a>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingSix">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
       				회원관리
     				</button>
   			</h2>
   			<div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="manageAccount.pi">블랙리스트</a><br>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingSeven">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
       				신고관리
     				</button>
   			</h2>
   			<div id="flush-collapseSeven" class="accordion-collapse collapse" aria-labelledby="flush-headingSeven" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listReport.pi">신고</a><br>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingEight">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseEight" aria-expanded="false" aria-controls="flush-collapseEight">
       				캠핑장 관리
     				</button>
   			</h2>
   			<div id="flush-collapseEight" class="accordion-collapse collapse" aria-labelledby="flush-headingEight" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="manageCamp.pi">승인</a><br>
     				</div>
   			</div>
 			</div>
 		</div>
 		<div class="accordion accordion-flush" id="accordionFlushExample">
		<div class="accordion-item">
   			<h2 class="accordion-header" id="flush-headingNine">
     				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseNine" aria-expanded="false" aria-controls="flush-collapseNine">
       				이벤트/광고
     				</button>
   			</h2>
   			<div id="flush-collapseNine" class="accordion-collapse collapse" aria-labelledby="flush-headingNine" data-bs-parent="#accordionFlushExample">
     				<div class="accordion-body more-info">
     					<a href="listEvent.pi">승인</a><br>
     				</div>
   			</div>
 			</div>
 		</div>
</div>