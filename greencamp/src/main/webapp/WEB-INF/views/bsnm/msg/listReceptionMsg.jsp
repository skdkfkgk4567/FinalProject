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
function show()
{
   var params;
   var rcver_id = document.getElementById("rcver_id").value;
   var cn = document.getElementById("cn").value;
   params = 'rcver_id='+rcver_id+'&cn='+cn;
   sendXHR('writesendmsgreception.pi',params,showResult,'GET');
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
   	 		location.reload();
   	 	}    
      }
   }
}
</script>


<script>
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
   sendXHR('selectdeletemsg.pi',params,showResult1,'GET');
}

function showResult1()
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
  margin-top:-20px;
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
    border-radius:10px 10px;

}
h1{
text-align:center;
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
#msgreception::-webkit-scrollbar {
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
	<label class="registtitle">수신함</label>

<div class="maincontent" id="msgreception">
<input class="selectmsgbutton" type="button" value="삭제" onclick="show2()">
<table class="bsnmcamplist container table-responsive-xl" border="">
  <thead>
        <tr>
        	<th>선택</th>
            <th>No.</th>
            <th>보낸사람</th>
            <th>내용</th>
            <th>발신일</th>
            <th>기능</th>
            
        </tr>
    </thead>
    <tbody>
    <c:forEach var="dto" items="${list}">
        <tr>
        	<td><input type="checkbox" name="selectmsg" value="${dto.msg_no}"></td>
            <td>${dto.msg_no}</td>
            <td>${dto.sender_id}</td>
            <td>${dto.cn}</td>
            <td>${dto.senddate}</td>
            <td><input class="buttons" type="button" value="답장" onclick='disableActive()'></td>
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
      <form name="receptionmsg" id="receptionmsg" action="writesendmsgreception.pi">
      <div class="">
        <div class="row">
          <label>발신자 :</label><label>이원섭</label><br>
        </div>
        <div class="row">
          <label>발신자 이메일 :</label><label>sub940522@naver.com</label>
        </div>
        <div class="row">
         <label>받는사람 id:</label>  <input placeholder="받는사람id 입력" id="rcver_id" name="rcver_id" type="text">
        </div>
        <div class="row">
          <textarea placeholder="보낼 메세지" type="text" id="cn" name=cn> </textarea>
        </div>
        <div class="row">
          <button type="button" onclick="show()">보내기</button>
        </div>
      </div>
      </form>
    </div>
  </div>
  </div>
  <footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>