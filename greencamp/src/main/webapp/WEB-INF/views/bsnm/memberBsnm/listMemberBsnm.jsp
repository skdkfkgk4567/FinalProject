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
<style>
.footer
{
	margin-top: 658px;
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
padding:20px;
width:150px;
margin-left:50px;
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
#maincontentlistscroll::-webkit-scrollbar {
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
	<label class="registtitle">캠지기정보</label>

<div class="maincontentlistmember" id="maincontentlistscroll">
<c:forEach var="dto" items="${list2}">
	<label>이름</label> <label>${dto.nm}</label><br>
	<label>이메일</label> <label>${dto.email}</label><br>
	<label>별명</label> <label>${dto.ncnm}</label><br>
	<label>전화번호</label> <label>${dto.telno}</label><br>
	<label>사업자번호</label> <label>${dto.bizrno}</label>
</c:forEach>
	<hr>
	
<table class="bsnmcamplist container table-responsive-xl" border="1">
    <thead>
        <tr class="fixedth">
            <th width=250>NO.</th>
            <th>캠핑장이름</th>
            <th width=250>기능</th>
            
        </tr>
    </thead>
    <tbody>
    <c:if test="${empty list}">
		<tr>
			<td colspan="4">해당 목록이없습니다
			</td>
		</tr>
	</c:if>
    <c:forEach var="dto" items="${list}">
    
    <input type="hidden" id="camp_no" value="${dto.camp_no}">
    <c:url value="detailcampinfobsnm.pi" var="url">
    <c:param name="camp_no" value="${dto.camp_no}"></c:param>
    </c:url>
        <tr>
            <td>${dto.camp_no}</td>
            
            <td><a href="${url}">${dto.camp_nm}</a></td>
            <td>
            <input class="buttons" type="button" value="삭제" onclick="show()">
            <input class="buttons" type="button" value="수정" onclick="goupdate()">
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


</div>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>