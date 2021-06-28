<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/index.css" />
<style>
.join {
	height: 600px;
	margin: 100px auto;
}

.join .member {
	display: table;
	width: 60%;
	margin: auto;
	padding-top: 13%;
}

.join .member>li {
	display: table-cell;
	width: 460px;
}

.join .member>li+li {
	padding-left: 8px;
}
.join .member>li a {
	display: block;
	height: 200px;
	line-height: normal;
	border: 1px solid #41495f;
	border-radius: 100px;
	background: #fff;
	text-align: center;
	font-size: 16px;
	padding-top: 15%;
}

.join .member a>p {
	color: #000;
	font-size: 26px;
	letter-spacing: -1px;
}

.join .member a>p>em {
	font-weight: 600;
}

.join .member li a:hover, .join .member li a:focus, .join .member li a.ok
	{
	border: 1px solid #4e7fce;
	background: #4e7fce;
}

.join .member li a:hover .i_icon, .join .member li a:focus .i_icon,
	.join .member li a.ok .i_icon {
	background-position: -81px 0;
}

.join .member li:nth-child(2) a:hover .i_icon, .join .member li:nth-child(2) a:focus .i_icon,
	.join .member li:nth-child(2) a.ok .i_icon {
	background-position: -243px 0;
}

.join .member a:hover>p, .join .member a:focus>p, .join .member a.ok>p,
	.join .member a:hover em, .join .member a:focus em, .join .member a.ok em
	{
	color: #fff !important;
}

.join .member li a:hover span, .join .member li a:focus span, .join .member li a.ok span
	{
	color: #b7d9f7;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="join">
		<ul class="member">
			<li><a href="joinUser.pi" onclick="joinUser.pi" id="joinUser"
				class="memflg_btn">
					<p>
						<em class="color7">일반</em> 회원가입
					</p> <span>일반회원용 회원가입 입니다.</span>
			</a></li>
			<li><a href="joinBsnm.pi" onclick="joinBsnm.pi" id="joinBsnm"
				class="memflg_btn">
					<p>
						<em class="color7">캠지기</em> 회원 가입
					</p> <span>캠지기전용 회원가입 입니다.</span>
			</a></li>
		</ul>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>