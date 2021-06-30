<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:forEach var="indto" items="${list}">
	<div class="goodsinfoview">
		<div>
			<h2>${indto.sj}</h2>
			<hr>
		</div>
		<div>
			<ul class="goodsinfoul">
				<li>
					<div>
						<input type="checkbox" id="btn_addmsg"> <label
							for="btn_addmsg"> ${indto.ncnm} </label>
						<div class="msg">
							<form name="addmsgfm" action="campinfomsg.pi" method="post">
								<input type="hidden" name="rcver_id" value="comk"> <input
									type="hidden" name="sender_id" value="${indto.ncnm}">
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
											<th>받는 이 : ${indto.ncnm}</th>
										</tr>
										<tr>
											<td colspan="2" align="center"><textarea rows="10"
													cols="70" name="cn" wrap="hard"></textarea></td>
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
				<li>작성일 : <fmt:formatDate pattern="yy-MM-dd" value="${indto.writngde}"/></li>
			</ul>
			<div class="goodsinfo_update_btn" align="right">
				<span><a
					href="campinfoReport.pi?ctgry=${indto.ctgry}&ctgry_no=${indto.info_no}">신고</a></span>
			</div>
		</div>
		<hr>
	</div>
	<c:if test="${null ne indto.videosrc}">
		<div align="center">${indto.videosrc}"></div>
	</c:if>
	<div class="goodsinfo_content">${indto.cn}</div>
	<div class="goodsinfo_comment">
		<div>댓글쓰기</div>
		<form name="goods_comment_fm"
			action="campinfo_comment.pi?ctgry=${indto.ctgry}&ctgry_no=${indto.info_no}"
			method="post">
			<div align="center">
				<textarea id="goods_comment" rows="5" cols="100" name="cn" wrap="hard"
					style="background-color: #ede7f6; width: 100%; display: inline;" required></textarea>
				<input type="submit" class="subcomment" value="등록"
					style="margin-left: -20px;">
			</div>
		</form>
		<c:forEach var="cdto" items="${clist}">
			<div class="card border-info"
				style="width: 100%; background-color: #AFFFEE">
				<div class="card-body text-primary">
					<h6 class="card-subtitle mb-2 text-muted">${cdto.ncnm}</h6>
					<p class="card-text">&nbsp;&nbsp;${cdto.cn}</p>
					<a href="campinfodelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
					<a href="campinfoReport.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
				</div>
			</div>
		</c:forEach>
	</div>
</c:forEach>