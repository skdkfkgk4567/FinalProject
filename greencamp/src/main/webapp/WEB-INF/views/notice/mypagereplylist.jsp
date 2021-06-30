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
.fixedth{
top : 0px;
position:sticky;
}
.moveselectbox{
margin-left:100px;
}
</style>
<script>
function show()
{
   var params;
   var cm_no = document.getElementById("cm_no").value;
   
   params = 'cm_no='+cm_no;
   sendXHR('deletecomment.pi',params,showResult,'GET');
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
<label class="registtitle">작성댓글보기</label>
<div class="maincontent">
<select class="moveselectbox">
<option>팝니다</option>
<option>삽니다</option>
<option>리뷰</option>
<option>자유게시판</option>
</select>
<table class="bsnmcamplist container table-responsive-xl" border="1">
    <thead>
        <tr class="fixedth">
            <th width=250>NO.</th>
            <th>카테고리</th>
            <th>닉네임</th>
            <th>내용</th>
            <th>날짜</th>
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
    
    <input type="hidden" id="cm_no" value="${dto.cm_no}">
        <tr>
            <td>${dto.cm_no}</td>
            <td>${dto.ctgry}</td>
            <td>${dto.ncnm}</td>
            <td>${dto.cn}</td>
            <td>${dto.writngde}</td>
            
            
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