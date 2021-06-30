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
   function disableActive(){
    
    var  disableDivObj = document.getElementById("disableDiv");
    disableDivObj.style.display = "";
    var  loadingDiv = document.getElementById("loadingDiv");
    loadingDiv.style.display = "";
        
   } 
   
   function reset(){
    var  disableDivObj = document.getElementById("disableDiv");
    disableDivObj.style.display = "none";
    var  loadingDiv = document.getElementById("loadingDiv");
    loadingDiv.style.display = "none";
   }
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
  body, td { font-size: 13px }
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
	height:100px;
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
}
h1{
text-align:center;
}
.fixedth{
top : 0px;
position:sticky;
}
#listsendscroll::-webkit-scrollbar {
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
.selectmsgbutton{
float:left;
position:fixed;
margin-left:1250px;
border-radius:30px 30px;
cursor: pointer;
width:70px;
background-color: #f8585b;
border: none;

}
  </style>
  <script>
function show()
{
   var params;
   var msg_no = document.getElementById("msg_no").value;
   
   params = 'msg_no='+msg_no;
   sendXHR('deletemsg.pi',params,showResult,'GET');
}

function showResult()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText;
    	  alert(data);
    	  reset();
    	  location.reload();
      }
   }
}

function show2()
{
   var params;
   var size = document.getElementsByName("selectmsg").length;
   var selectmsg="";
   for(var i = 0; i <size; i++){
       if(document.getElementsByName("selectmsg")[i].checked == true ){
    	  
    	   selectmsg+=document.getElementsByName("selectmsg")[i].value+"+";
    	 
       }
   }
   params = 'selectmsg='+selectmsg;
   sendXHR('selectdeletemsg.pi',params,showResult2,'GET');
}
function showResult2()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText;
    	  
	  alert(data);
    	  
    	  location.reload();
      }
   }
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
<label class="registtitle">발신함</label>
<div class="maincontent" id="listsendscroll">
<input class="selectmsgbutton" type="button" value="삭제" onclick="show2()">
<table class="bsnmcamplist container table-responsive-xl" border="1">
  <thead>
        <tr class="fixedth">
        	<th width="70">선택</th>
            <th>NO.</th>
            <th>받는사람</th>
            <th>내용</th>
            <th>발신일</th>
        </tr>
    </thead>
    <tbody>
    <c:if test="${empty list}">
		<tr>
			<td colspan="5">해당 목록이없습니다
			</td>
		</tr>
	</c:if>
    
    <c:forEach var="dto" items="${list }">
        <tr>
        	<td><input type="checkbox" name="selectmsg" value="${dto.msg_no }"></td>
            <td width="80">${dto.rownum }</td>
            <input type="hidden" id="selectmsg" value="${dto.msg_no }">
            <td width="200">${dto.rcver_id}</td>
            <td>${dto.cn }</td>
            <td width="100">${dto.senddate }</td>
            
        </tr>
        </c:forEach>
        <!-- and so on... -->
    </tbody>
</table>


</div>
<div id="disableDiv" class="disableDiv" style="display:none">
  
  </div>
  <div id="loadingDiv" class="loadingDiv" style="display:none">
  <div class="movex">
  <img src="assets/img/x.png" width=70px height=70px onclick="reset()">
  </div>
 <div class="writemsg">
    <div class="writemsgpaper">
     <form id="sendmsgForm" name=sendanswer action="writesendmsglistsend.pi">
        <div class="row">
          <label>발신자 :</label><label>이원섭</label><br>
        </div>
        <div class="row">
          <label>발신자 이메일 :</label><label>sub940522@naver.com</label>
        </div>
        <div class="row">
         <label>받는사람 id:</label>  <input name="rcver_id" placeholder="받는사람id 입력" type="text">
        </div>
        <div class="row">
          <textarea placeholder="보낼 메세지" name="cn" type="text"> </textarea>
        </div>
        <div class="row">
          <button type="button" id="writemsgbutton">보내기</button>
        </div>
      </form>
    </div>
  </div>
  </div>
  <footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>