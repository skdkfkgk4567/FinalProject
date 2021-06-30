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
<script>
</script>
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
.bgcolormsg{
background-color:#c8c8c8;

}
</style>
  <script>
function show()
{
   var params;
   var rcver_id = document.getElementById("rcver_id").value;
   var cn = document.getElementById("cn").value;
   
   params = 'rcver_id='+rcver_id+'&cn='+cn;
   sendXHR('writesendmsg.pi',params,showResult,'GET');
}

function showResult()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText.trim();
    	  var confirmflag = confirm(data);
   	 	if(data=="성공")
  		{
   	 		
   	 		gopage();
   	 	}    	  
      }
   }
}
function gopage(){
	location.href="listSendMsg.pi";
	
}
</script>
</head>
<body>
	<!------------------------------------------ 헤더 -------------------------------------------------------------->
	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ 해더아래 아이디 캠핑장이름 -------------------------------------------------------------->
<jsp:include page="../bsnmsidebar.jsp"></jsp:include>
	<!------------------------------------------ 사이드 메뉴 -------------------------------------------------------------->


	<!------------------------------------------ 본문영역 -------------------------------------------------------------->
<label class="registtitle">쪽지보내기</label>
<div class="maincontent">

<div class="writemsg2">
    <div class="writemsgpaper">
      
      
      <div class="bgcolormsg">
      <form id="sendmsgForm" name="sendmsgForm" action="writesendmsg.pi">
        <div class="row">
          <label>발신자 :</label><label>이원섭</label><br>
        </div>
        <div class="row">
          <label>발신자 이메일 :</label><label>sub940522@naver.com</label>
        </div>
        <div class="row">
         <label>받는사람 id:</label>  <input placeholder="받는사람id 입력" type="text" id="rcver_id" name="rcver_id" required>
        </div>
        <div class="row">
          <textarea name="cn" id="cn" cols=85 rows=60></textarea>
        </div>
        <div class="row">
          <button class="row1" type="button" id="writemsgbutton" onclick="show()">보내기</button>
        </div>
        </form>
      </div>
    </div>
  </div>

</div>
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>