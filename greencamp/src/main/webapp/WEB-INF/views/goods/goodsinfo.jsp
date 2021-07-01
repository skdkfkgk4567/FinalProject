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
						<c:if test="${!empty sessionScope.user_ncnm}">
							<input type="checkbox" id="btn_addmsg">
						</c:if>
						<label for="btn_addmsg"> ${infodto.ncnm} </label>
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
													<input type="text" class="form-control" name="rcver_id"
														id="floatingPassword" placeholder="보내는 이"
														value="${sessionScope.user_ncnm}" readonly required>
													<label for="floatingPassword">보내는 이</label>
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
				<li>작성일 : <fmt:formatDate pattern="yy-MM-dd"
						value="${infodto.writngde}" /></li>
			</ul>
			<div class="goodsinfo_update_btn" align="right">

				<span> <a
					href="Report.pi?ctgry=${infodto.delngtp}&ctgry_no=${infodto.delng_no}">신고</a>&nbsp;&nbsp;
					<c:if test="${infodto.ncnm eq sessionScope.user_ncnm}">
						<a
							href="goodsdel.pi?delng_no=${infodto.delng_no}&delngtp=${infodto.delngtp}">삭제</a> &nbsp;&nbsp;
						<a href="goodssttus.pi?delng_no=${infodto.delng_no}">거래완료</a>&nbsp;&nbsp;
						</c:if>
				</span>
				<c:if test="${infodto.ncnm eq sessionScope.user_ncnm}">
					<input type="checkbox" id="btn_goodsupdate">
					<label for="btn_goodsupdate"> 수정 </label>
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
												<input type="text" class="form-control" name="sj"
													id="floatingPassword" placeholder="제목"
													value="${infodto.sj}" readonly required> <label
													for="floatingPassword">제목</label>
											</div>
										</th>
									</tr>
									<tr>
										<th><select class="form-select form-select-lg mb-3"
											name="how" aria-label=".form-select-lg example">
												<option value="직거래" selected>직거래</option>
												<option value="택배거래">택배거래</option>
										</select></th>
									</tr>
									<tr>
										<th>
											<div class="form-floating">
												<input type="text" class="form-control" name="pc"
													id="floatingPassword" placeholder="금액"
													value="${infodto.pc}" required> <label
													for="floatingPassword">금액</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div class="form-floating">
												<input type="text" class="form-control" name="addr"
													id="floatingPassword" placeholder="거래위치"
													value="${infodto.addr}" required> <label
													for="floatingPassword">거래위치</label>
											</div>
										</th>
									</tr>
									<tr>
										<th>
											<div class="form-floating">
												<input type="text" class="form-control" name="telno"
													id="floatingPassword" placeholder="연락처"
													value="${infodto.telno}" required> <label
													for="floatingPassword">연락처</label>
											</div>
										</th>
									</tr>
									<tr>
										<th><label class="input-file-button" for="input-file">사진
												등록</label> <input type="file" id="input-file" name="img"
											style="display: none" value="${infodto.img}"></th>
									</tr>
									<tr>
										<td align="center"><textarea rows="10" cols="70"
												name="cn" wrap="hard" required>${infodto.cn}</textarea></td>
									</tr>
								</table>
							</div>
							<div align="center">
								<input type="submit" class="btn btn-info" value="수정하기">
								<input type="reset" class="btn btn-secondary" value="취소하기">
							</div>
						</form>
					</div>
					<label for="btn_goodsupdate" class="goodsupdatebackground"></label>
					<!-- 글쓰기 배경 흐림 -->
				</c:if>
			</div>
		</div>
		<hr>
	</div>
	<c:if test="${'판매완료'eq infodto.sttus}">
		<div>
			<img src="assets/img/판매완료.jpg" alt="전체" width="80px" height="80px"
				align="right" style="margin-right: 30px;">
		</div>
	</c:if>
	<c:if test="${!empty gdto.img}">
		<img src="assets/img/${gdto.img}" class="card-img-top" alt="..."
			style="max-width: 250px;">
	</c:if>
	<div class="goodsinfo_content">${infodto.cn}</div>
	<div class="goodsinfo_comment">
		<div>댓글쓰기</div>
		<form name="goods_comment_fm"
			action="goods_comment.pi?ctgry=${infodto.delngtp}&ctgry_no=${infodto.delng_no}&ncnm=${sessionScope.user_ncnm}"
			method="post">
			<c:choose>
				<c:when test="${null eq sessionScope.user_ncnm}">
					<div align="center">
						<textarea id="goods_comment" rows="5" cols="100" wrap="hard"
							name="cn"
							style="background-color: #ede7f6; width: 100%; display: inline;"></textarea>
						<input type="submit" class="subcomment" value="등록" disabled>
					</div>
				</c:when>
				<c:otherwise>
					<div align="center">
						<textarea id="goods_comment" rows="5" cols="100" wrap="hard"
							name="cn" required
							style="background-color: #ede7f6; width: 100%; display: inline;"></textarea>
						<input type="submit" class="subcomment" value="등록">
					</div>
				</c:otherwise>
			</c:choose>
		</form>
		<c:forEach var="cdto" items="${clist}">
			<div class="card border-info"
				style="width: 100%; background-color: #AFFFEE">
				<div class="card-body text-primary">
					<h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
					<p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
					<c:if test="${cdto.ncnm eq sessionScope.user_ncnm}">
						<a href="goodsdelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
					</c:if>
					<a href="Report.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}"
						class="card-link">신고</a>
				</div>
			</div>
		</c:forEach>
	</div>
</c:forEach>