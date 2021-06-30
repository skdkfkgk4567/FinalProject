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
h1{
text-align:center;
}
.buttons{
	width:70px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align:center;
    text-decoration: none;
    display: inline-block
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:30px 30px;

}
#fixedth{
top : 0px;
position:sticky;
}
#tdtext{

text-overflow: ellipsis;}

</style>
<script>
function show()
{
   var params;
   var camp_no = document.getElementById("camp_no").value;
   
   params = 'camp_no='+camp_no;
   sendXHR('deletecampBsnm.pi',params,showResult,'GET');
}

function showResult()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText;
    	  alert(data); 
    	  
    	  gopage();
      }
   }
}
 function gopage(){
	 
	 location.reload();
 }
 function goupdate(){
	 location.href="updateCampBsnm.pi";
 }
</script>
</head>
<body>
	<!------------------------------------------ 헤더 -------------------------------------------------------------->
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ 해더아래 아이디 캠핑장이름 -------------------------------------------------------------->
<jsp:include page="../sidebar.jsp"></jsp:include>
	<!------------------------------------------ 사이드 메뉴 -------------------------------------------------------------->


	<!------------------------------------------ 본문영역 -------------------------------------------------------------->
<label class="registtitle">작성게시글보기</label>
<div class="maincontent">

<table id="fixtable" class="bsnmcamplist container table-responsive-xl" border="1">
    <thead>
        <tr class="">
            <th>NO.</th>
            <th >제목</th>
            <th style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;" width="400">내용</th>
            <th  width="140">카테고리</th>
            <th>작성일</th>
            <th width="100">닉네임</th>
            <th>비디오주소</th>
            <th>기능</th>
        </tr>
    </thead>
    <tbody>
    <c:if test="${empty list}">
		<tr>
			<td colspan="8">해당 목록이없습니다
			</td>
		</tr>
	</c:if>
    <c:forEach var="dto" items="${list}">
    
    <input type="hidden" id="camp_no" value="${dto.bbs_no}">
    
        <tr>
            <td>${dto.bbs_no}</td>
            <td>${dto.sj}</td>
            <td>${dto.cn }</td>
            <td>${dto.ctgry }</td>
            <td>${dto.writngde }</td>
            <td>${dto.ncnm }</td>
            <td>${dto.videosrc }</td>
            
            <td>
            <input class="buttons" type="button" value="삭제" onclick="show()">
            
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</div>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>