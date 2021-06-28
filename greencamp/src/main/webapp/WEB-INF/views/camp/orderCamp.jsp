<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/detail.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link href="css/main.min.css" rel="stylesheet">
<script src="js/main.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="assets/css/splitter.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/searchResult.css" />
<link rel="stylesheet" href="assets/css/list.css">
<script type="text/javascript" src="assets/js/splitter.min.js"></script>
<link href="css/main.min.css" rel="stylesheet">
<link href="./style3.css" rel="stylesheet">
<script src="js/main.min.js" type="text/javascript"></script>
<style>
input[type=text] {
	width: 300px;
	height: 30px;
	font-size: 20px;
}

.nmpr {
	width: 100px;
	height: 30px;
	font-size: 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
}

.couponSelect {
	width: 380px;
	height: 30px;
	font-size: 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
	text-align: center;
}

label {
	font-size: 20px;
}

#button2 {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	width: 150px;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#button2:hover {
	background: #fff;
	color: #1AAB8A;
}

#button2:before, #button2:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#button2:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#button2:hover:before, #button2:hover:after {
	width: 80%;
	transition: 800ms ease all;
}

.maincontent {
	width: 100vw;
	height: 800px;
	background-color: #c8c8c8;
	margin-top: 100px;
	opacity: 1;
}

.leftContent, .rightContent {
	width: 50vw;
	height: 800px;
	float: left;
	padding-left: 100px;
}

.siteImg {
	width: 480px;
	height: 480px;
	text-align: center;
	margin: auto;
}

.siteNm {
	width: 480px;
	height: 80px;
	text-align: center;
	margin: auto;
	padding-top: 10px;
}

.checkIn {
	width: 130px;
	height: 80px;
	text-align: center;
	margin: auto;
	float: left;
}

.sukbak {
	width: 130px;
	height: 80px;
	text-align: center;
	margin: auto;
	float: left;
}

.checkOut {
	width: 130px;
	height: 80px;
	text-align: center;
	margin: auto;
	float: left;
}

.siteInfo {
	width: 390px;
	height: 500px;
}

.useInfo {
	padding-top: 15px;
	width: 390px;
	height: 160px;
}

.buttonGroup {
	width: 390px;
	height: 60px;
	text-align: center;
}

#button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 60px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

#button:hover {
	background: #fff;
	color: #1AAB8A;
}

#button:before, #button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

#button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#button:hover:before, #button:hover:after {
	width: 80%;
	transition: 800ms ease all;
}
#siteImg
{
	border-radius: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<form action="completeOrderCamp.pi" name="completeOrder" method="get">
	<div class="maincontent">
		<div class="leftContent">
			<div class="siteImg">
				<h1><img id="siteImg" alt="" src="${param.siteimg }" width="480px" height="480px"></h1>
			</div>
			<div class="siteNm">
				<h3>${param.sitenm }</h3>
			</div>
		</div>
		<div class="rightContent">
			<div class="checkIn">
				<h3>
					체크인<br>${param.startDe }
				</h3>
			</div>
			<div class="sukbak">
				<h3>
					숙박일<br>${param.sukbakDe }박 ${param.sukbakDe+1 }일
				</h3>
			</div>
			<div class="checkOut">
				<h3>
					체크아웃<br>${param.endDe }
				</h3>
			</div>
			<div class="siteInfo">
				<div class="nameDiv">
					<h4>이름</h4>
					&nbsp;&nbsp;<input type="text" name="name"><br>
				</div>
				<div class="nmprDiv">
					<h4>인원수</h4>
					&nbsp;&nbsp;<select class="nmpr" name="nmpr">
						<option value="1">1인</option>
						<option value="2">2인</option>
						<option value="3">3인</option>
						<option value="4">4인</option>
					</select><br>
				</div>
				<div class="telnoDiv">
					<h4>연락처</h4>
					&nbsp;&nbsp;<input type="text" name="telno"><br>
				</div>
				<div class="emailDiv">
					<h4>이메일</h4>
					&nbsp;&nbsp;<input type="text" name="email"><br>
				</div>
				<div class="rmDiv">
					<h4>요청사항</h4>
					&nbsp;&nbsp;<input type="text" name="rm"><br>
				</div>
				<div class="pcDiv">
					<h4>가격</h4>
					&nbsp;&nbsp;<input type="text" name="pc" value="${param.pc*param.sukbakDe }" readonly="readonly">원<br>
				</div>
			</div>
			<div class="coupon">
				<h4>쿠폰</h4>
				<select class="couponSelect">
					<option selected="selected">:: ::</option>
					<option>오픈 기념 10% 할인 쿠폰 (최소 2박)</option>
				</select>
			</div>
			<div class="useInfo">${camp_dc }</div>
			<div class="buttonGroup">
				<input type="button" id="button" value="취소">
				<input type="submit" value="결제하기" >
			</div>
		</div>
	</div>
	<input type="hidden" value="${param.camp_no }" name="camp_no">
	<input type="hidden" value="admin" name="id">
	<input type="hidden" name="bgnde" value="${param.startDe }">
	<input type="hidden" name="totalde" value="${param.sukbakDe }">
	<input type="hidden" name="sitenm" value="${param.sitenm }">
	<input type="hidden" name="endde" value="${param.endDe }">
	<input type="hidden" name="camp_name" value="${param.camp_name }">
	<input type="hidden" name="siteimg" value="${param.siteimg }">
	</form>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>