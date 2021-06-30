<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link href="<c:url value="/assets/css/maincss.css"/>"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
<script src="assets/js/httpRequest.js"></script>
<style>
.footer
{
	margin-top: 658px !important;
}
.registtitle{
text-align:center;

margin-top:100px;
position:relative;
width:100%;
display:block;
margin-left:-130px;
color:white;
font-size:30px;
}
label{
width:150px;
padding:15px;
}
.labelsafe{
width:120px;
padding:15px;
}
.labelsafe1{
width:120px;
padding:8px;
}
.registformleft{
float:left;
width:500px;
margin-left:130px;
margin-right:70px;
margin-top:20px;
}
.registformright{
float:left;
width:500px;
margin-top:20px;

}
.checksafe{
margin-left:80px;
margin-top:-55px;
}
.checkcon{
margin-left:80px;
margin-top:-55px;
}
.onelineiintroduce{
margin-top:-55px;
margin-left:140px;
}.registbt{
position:relative;
top:4px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
}
.registbt1{
position:relative;
top:12px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
}


.circumstance{
margin-left:150px;
margin-top:-55px;
}
.reset{
position:relative;
top:7px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
	margin-top:67px;
	padding-bottom:10px;
}
  #disableDiv { 
  position:absolute; 
  left:0; 
  top:0;
  width:100%; 
  height:100%; 
  z-index:995 ; 
  background-color:#000000; 
  filter:Alpha(opacity=80);
  opacity:0.8; 
  -moz-opaciry:0.8
  }
  
  #loadingDiv { 
  margin-top:0px;
  margin-left:500px;
  position:absolute; 
  left:100; 
  top:100;
  width:800px; 
  height:600px; 
  z-index:999; 
  background-color:#FFFFFF;
  };
    .sendmsgbutton{
	margin-left:100px;
}

.writemsg {
  width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.writemsgpaper {
	background:#F9F9F9;
	padding:25px;
	margin-top: 50px;
  margin-bottom: 50px;
}

.writemsgpaper > h3 {
margin-top:-100px;
	color: #F96;
	display: block;
	font-size: 30px;
	font-weight: 400;
	text-align: center;
}
.writemsgpaper .row {
  margin-bottom: 10px;
	width: 100%;
}

.writemsgpaper input,
.writemsgpaper textarea {
  width: 100%;
  padding: 10px;
}

.writemsgpaper textarea {
	height:400px;
	max-width:100%;
  resize:none;
}

.writemsgpaper #writemsgbutton {
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
}
.movex{
margin-left:800px;
display:block;
 width:80px;
}
.buttons{
	width:120px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align:center;
    text-decoration: none;
    display: inline-block
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:5px 5px;
    float:right;
    margin-right:100px;

}
h1{
text-align:center;
}
h2{
text-align:center;
}
</style>

</head>
<body>
	<!------------------------------------------ 헤더 -------------------------------------------------------------->
	<header>
		<jsp:include page="../../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ 해더아래 아이디 캠핑장이름 -------------------------------------------------------------->
<jsp:include page="../../bsnmsidebar.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
	<!------------------------------------------ 사이드 메뉴 -------------------------------------------------------------->


	<!------------------------------------------ 본문영역 -------------------------------------------------------------->

<label class="registtitle">캠핑장상세정보</label>
<div class="maincontentregist">
<form name="campregistform" action="addregistCampBsnm.pi">
<div class="registformleft">
<c:forEach var="dto" items="${list }">
<label>캠핑장이름</label> <label>${dto.camp_nm }</label><br>
<label>캠핑장주소</label> <label>${dto.addr }</label><br>
<label>캠핑장전화번호</label><label>${dto.camp_telno }</label><br>
<label>사업자번호</label> <label>${dto.bizrno }</label><br>

<hr>
<label>체크인</label>
${dto.checkin}<br>
<label>체크아웃</label>
${dto.checkout}
</c:forEach>
<hr>
<label>캠핑종류</label>
<div class="circumstance">
<c:forEach var="dto" items="${camp_type }">
<label>${dto}</label>
</c:forEach>
</div>
<hr>
<label>자연환경</label>
<div class="circumstance">
<c:forEach var="dto" items="${camp_surround }">
<label>${dto }</label>
</c:forEach>

</div>
<hr>
<label>테마</label>
<div class="circumstance">
<c:forEach var="dto" items="${camp_theme }">
<label>${dto }</label>
</c:forEach>
</div>

</div>
<div class="registformright">
<label>바닥종류</label>
<div class="checksafe">
<c:forEach var="dto" items="${camp_ground}">
<label>${dto }</label>
</c:forEach>
</div>
<hr>
<label>안전시설</label>
<div class="checksafe">
<c:forEach var="dto" items="${sffc}">
<label>${dto }</label>
</c:forEach>
</div>

<hr>
<label>편의시설</label><br>
<div class="checkcon">
<c:forEach var="dto" items="${cvntl}">
<label>${dto }</label>
</c:forEach>
</div>
<hr>
<label>캠핑장한줄소개</label>
<c:forEach var="dto" items="${list}">
<div class="onelineiintroduce">
<label>${dto.camp_intro}</label>
</div>
</c:forEach>

</div>
</form>
</div>
<jsp:include page="../../footer.jsp"></jsp:include>

</body>

</html>