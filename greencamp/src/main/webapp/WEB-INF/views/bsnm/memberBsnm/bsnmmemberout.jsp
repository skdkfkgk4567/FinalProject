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
.textareamove{
margin-left:400px;
margin-top:100px;
}
.textbox{
width:300px;
height:30px;
margin-left:100px;
}
.labelmove{
width:150px;
margin-left:400px;
margin-top:30px;
}
#btnmove{
margin-top:50px;
}

</style>
<script>
function show()
{
   var params;
   var id = document.getElementById("id").value;
   var password = document.getElementById("password").value;
   
   params = 'id='+id+'&password='+password;
   sendXHR('memberout.pi',params,showResult,'GET');
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
	 
	 location.href="index.pi"
 }

</script>
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
<label class="registtitle">회원탈퇴</label>
<div class="maincontent">
<form>

<textarea class="textareamove" cols="80" rows="15">
 탈퇴 후 회원정보가 모두 삭제됩니다.
  메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.


 탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.
  각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.
  삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.
  (탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)

탈퇴 후에는 게시판의 게시글은 삭제할 수 없으며, 위의 안내 내용에 동의합니다.
</textarea><br>
<label class="labelmove">아이디</label><input class="textbox" type="text" name="id" id="id"><br>
<label class="labelmove">비밀번호</label><input class="textbox" type="text" name="password" id="password">
<input id="btnmove" type="button"value="회원탈퇴" class="joinbtn btn-primary btn-lg btn-block" onclick="show()">


</form>
</div>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>