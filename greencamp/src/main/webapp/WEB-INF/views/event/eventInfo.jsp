<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<label> ${infodto.id} </label>
					</div>
				</li>
			</ul>
			<div class="goodsinfo_update_btn" align="right">
				<span> <a
					href="noticeReport.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.evnt_no}">신고</a>
				</span>

			</div>
		</div>
		<hr>
	</div>
	<div class="goodsinfo_content">${infodto.cn}</div>
	<div class="goodsinfo_comment">
		<div>댓글쓰기</div>
		<form name="goods_comment_fm"
			action="evnt_comment.pi?ctgry=${infodto.ctgry}&ctgry_no=${infodto.evnt_no}&ncnm=${sessionScope.user_ncnm}"
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
					<a href="evntdelComment.pi?cm_no=${cdto.cm_no}" class="card-link">삭제</a>
					</c:if>
					<a href="evntReport.pi?ctgry=댓글&ctgry_no=${cdto.cm_no}" class="card-link">신고</a>
				</div>
			</div>
		</c:forEach>
	</div>
</c:forEach>