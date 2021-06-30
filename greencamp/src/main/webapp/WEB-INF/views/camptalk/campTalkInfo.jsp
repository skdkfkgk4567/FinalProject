<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:forEach var="infodto" items="${list}">
	<div class="goodsinfoview">
		<div>
			<h2>${infodto.sj}</h2>
			<hr>
		</div>
		<div>
			<ul class="goodsinfoul">
				<li>
					<div>
						<input type="checkbox" id="btn_addmsg"> <label
							for="btn_addmsg"> ${infodto.ncnm} </label>
						<div class="msg">
							<form name="addmsgfm" action="camltalkmsg.pi" method="post">
								<div>
									<h2 align="center">메세지 보내기</h2>
								</div>
								<hr>
								<div>
									<table class="addmsgtable addmsgtable-sm">
										<tr>
											<th>
												<div class="form-floating">
													<input type="text" class="form-control" name="rcver_id"
														id="floatingPassword" placeholder="보내는 이" value="comk"
														readonly required> <label for="floatingPassword">보내는
														이</label>
												</div>
											</th>
										</tr>
										<tr>
											<th>
												<div class="form-floating">
													<input type="text" class="form-control" name="sender_id"
														id="floatingPassword" placeholder="받는 이"
														value="${infodto.ncnm}" readonly required> <label
														for="floatingPassword">받는 이</label>
												</div>
											</th>
										</tr>
										<tr>
											<td colspan="2" align="center"><textarea rows="10"
													cols="70" name="cn" wrap="hard" required></textarea></td>
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
					<a href="camptalkReport.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.bbs_no}">신고</a>&nbsp;&nbsp;
					<a href="bbsdel.pi?delng_no=${infodto.bbs_no}&delngtp=${infodto.ctgry}">삭제</a>&nbsp;&nbsp;
				</span> 
				<input type="checkbox" id="btn_goodsupdate">
				<label for="btn_goodsupdate"> 수정 </label>
				<div class="goodsupdate">
					<form name="goodsupdatefm" action="bbsupdate.pi" method="post">
						<input type="hidden" name="bbs_no" value="${infodto.bbs_no}">
						<div>
							<h2 align="left">중고마켓 글수정하기</h2>
						</div>
						<hr>
						<div>
							<table class="goodsupdatetable goodsupdatetable-sm">
								<tr>
									<th>
										<div class="form-floating">
											<input type="text" class="form-control" name="sj"
												id="floatingPassword" placeholder="제목" value="${infodto.sj}"
												readonly required> <label for="floatingPassword">제목</label>
										</div>
									</th>
								</tr>
								<tr>
									<th>
										<div class="form-floating">
											<input type="text" class="form-control" name="videosrc"
												id="floatingPassword" placeholder="비디오 주소"
												value="${infodto.videosrc}" readonly required> <label
												for="floatingPassword">비디오 주소</label>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="2" align="center"><textarea rows="10"
											cols="70" name="cn" required>${infodto.cn}</textarea></td>
								</tr>
							</table>
						</div>
						<div align="center">
							<input type="submit" class="btn btn-info" value="수정하기"
								required="required"> <input type="reset"
								class="btn btn-secondary" value="취소하기">
						</div>
					</form>
				</div>
				<label for="btn_goodsupdate" class="goodsupdatebackground"></label>
				<!-- 글쓰기 배경 흐림 -->
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
		<form name="goods_comment_fm"
			action="camptalk_comment.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.bbs_no}"
			method="post">
			<div align="center">
				<textarea id="goods_comment" rows="5" cols="100" name="cn"
					style="background-color: #ede7f6; width: 100%; display: inline;"
					required></textarea>
				<input type="submit" class="subcomment" value="등록">
			</div>
		</form>
		<c:forEach var="cdto" items="${clist}">
			<div class="card border-info"
				style="width: 100%; background-color: #AFFFEE">
				<div class="card-body text-primary">
					<h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
					<p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
					<a href="camptalkdelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
					<a href="camptalkReport.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
				</div>
			</div>
		</c:forEach>
	</div>
</c:forEach>