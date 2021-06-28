<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<link href="<c:url value="/assets/css/maincss.css"/>"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>
<style>
h1{
text-align:center;
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
.totalprice2{
position:fixed;
}
.listsellingtrsize
{
	position: sticky;
}
.fixedth{
top : 0px;
position:sticky;
}
#sellingscroll::-webkit-scrollbar {
   position: absolute;
    right: 0px;
    min-height: 5px;
    width: 2px;
    opacity: 0;
    -webkit-transition: opacity 0.2s linear;
    -moz-transition: opacity 0.2s linear;
    -o-transition: opacity 0.2s linear;
    -ms-transition: opacity 0.2s linear;
    transition: opacity 0.2s linear;
    -webkit-background-clip: padding-box;
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
	<!------------------------------------------ 사이드 메뉴 -------------------------------------------------------------->


	<!------------------------------------------ 본문영역 -------------------------------------------------------------->
	
		<fmt:parseNumber var="number" value="${total }" integerOnly="true"></fmt:parseNumber>
<label class="registtitle" > 총합계 : ${number}원 | 수수료 : ${number*0.05}원 | 순이익 : ${number*0.95}원</label>


<div class="maincontentselling" id="sellingscroll">

<table class="bsnmcamplist container table-responsive-xl" border="">
    <thead>
        <tr class="fixedth">
            <th>NO.</th>
            <th>캠핑장이름</th>
            <th>사용자id</th>
            <th>인원</th>
            <th>숙박일</th>
            <th>금액</th>
            <th>수수료</th>
            <th>순이익</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list}">
        <tr class="listsellingtrsize">
            <td>${dto.cmap_no}</td>
            <td>그린캠핑장</td>
            <td>${dto.id}</td>
            <td>${dto.nmpr}</td>
            <td>${dto.totalde}</td>
            <td>${dto.pc}</td>
            <td>${dto.pc * 0.05}</td>
            <td>${dto.pc * 0.95}</td>
        </tr>
        </c:forEach>
        <!-- and so on... -->
    </tbody>
</table>
</div>
<div class="totalprice2">
<h1 >&nbsp;&nbsp;&nbsp;&nbsp;</h1>
</div>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>