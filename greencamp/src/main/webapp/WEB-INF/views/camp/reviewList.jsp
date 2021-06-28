<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="review" items="${reviewList }">
	<div class="card border-info"
		style="width: 100%; background-color: #AFFFEE">
		<div class="card-body text-primary">
			<h6 class="card-subtitle mb-2 text-muted">${review.ncnm}</h6>
			<p class="card-text">&nbsp;&nbsp;${review.cn}</p>
			<a onclick="deleteReview()" class="card-link">삭제</a>
			<a href="Report.pi?ctgry=리뷰&ctgry_no=${review.review_no}" class="card-link">신고</a>
			<input type="hidden" id="review_no" value="${review.review_no}">
		</div>
	</div>
</c:forEach>