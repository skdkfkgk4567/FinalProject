<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
label
{
	font-size: 32px;
	padding-left: 40px;
}
h1
{
	text-align: center;
}
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

.leftContent {
	width: 25vw;
	height: 800px;
	float: left;
	padding-top: 30px;
	
}

.rightContent {
	width: 75vw;
	height: 800px;
	float: left;
	
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
	text-align: center;
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

.siteImg {
	width: 80%;
	height: 400px;
	margin: auto;
	text-align: center;
}
.buttonHome
{
	text-align: center;
	margin: auto;
	width: 100%;
}
.completeSpan
{
	width: 200px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="maincontent">
		<div class="leftContent">
			<div class="siteImg">
				<img alt="" src="${param.siteimg }" width="100%" height="100%">
			</div>
		</div>
		<div class="rightContent">
			<div class="completeOrder"><h1>예약이 완료되었습니다.</h1></div>
			<div class="campNm"><label class="completeSpan">캠핑장 이름</label><span id="campNm">${param.camp_name }</span></div><br>
			<div class="siteNm"><label class="completeSpan">사이트 이름</label><span id="siteNm">${param.sitenm }</span></div><br>
			<div class="checkIn"><label class="completeSpan">체크인</label><span id="checkIn">${param.bgnde }</span></div><br>
			<div class="checkOut"><label class="completeSpan">체크아웃</label><span id="checkOut">${param.endde }</span></div><br>
			<div class="totalPc"><label class="completeSpan">총 가격</label><span id="totalPc">${param.pc }</span></div><br>
			<div class="buttonHome"><input type="button" id="button" value="홈으로" onclick="location.href='index.pi'"></div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>