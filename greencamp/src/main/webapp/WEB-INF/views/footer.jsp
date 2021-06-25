<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.footer {
	text-align: center;
	padding: 30px 50px;
	background-color: white;
}

.footer li {
	position: relative;
	display: inline;
	padding: 0 7px 0 10px;
	white-space: nowrap;
}

.footer li:before {
	content: '';
	width: 1px;
	height: 12px;
	background-color: #dbdbdb;
	position: absolute;
	left: 0;
	top: 2px;
}

.footer li:first-child:before {
	width: 0;
}

.footer address {
	padding-top: 15px;
}
</style>
<div class="footer">
	<ul>
		<li><a href="#">사이트 도움말</a></li>
		<li><a href="#">사이트 이용약관</a></li>
		<li><a href="#">사이트 운영원칙</a></li>
		<li><a href="#"><strong>개인정보취급방침</strong></a></li>
		<li><a href="#">책임의 한계와 법적고지</a></li>
		<li><a href="#">게시중단요청서비스</a></li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<address>
		Copyright &copy; <strong>GreenCamp</strong>
		All Rights Reserved.
	</address>
</div>