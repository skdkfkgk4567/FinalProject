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
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="assets/js/httpRequest.js"></script>
<style>
.footer
{
	margin-top: 658px !important;
}
.cntext{
float:left;
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

.btn-like {
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777;
  }
.fixedth{
top : 0px;
position:sticky;
}

input[type=checkbox] { display:none; }

input[type=checkbox] + label { 

display: inline-block; 

cursor: pointer; 

line-height: 22px; 

padding-left: 22px; 

background: url('assets/img/goodbutton.png') left/22px no-repeat; 

}

input[type=checkbox]:checked + label { 
background-image: url('assets/img/goodbt.png'); 
}

#maincontent::-webkit-scrollbar {
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
	<label class="registtitle">리뷰</label>
	
<div class="maincontent" id="maincontent">
	<div class="bsnmreviewselectbox">
		<select>
    		<option>게시판</option>
    		<option>리뷰</option>
    		<option>게시판</option>
    	</select>
   	</div>
<table class="listreview container table-responsive-xl" border="1" >
    <thead>
  		<tr class="fixedth">
        	<th>번호</th>
            <th>리뷰목록</th>
        </tr>
    </thead>
    <tbody>
   
    
     <c:forEach var="dto" items="${list}">
   	 
     <script>
     var count${dto.bbs_no}=0;
function show${dto.bbs_no}()
{
	count${dto.bbs_no }++;
	var bbs_no = document.getElementById("box${dto.bbs_no }").value;
	
	if(count${dto.bbs_no}%2==1){
		
		params = 'bbs_no='+bbs_no;
		   sendXHR('likeclick.pi',params,showResult${dto.bbs_no },'GET');
	}else{
		
		params = 'bbs_no='+bbs_no;
		   sendXHR('likenoclick.pi',params,showResult${dto.bbs_no },'GET');
		
	}

}

function showResult${dto.bbs_no }()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText.trim();
    	  document.getElementById("${dto.bbs_no }holy").innerText=data;
    	  
      }
   }
}

</script>

		
        <tr>
            <td>${dto.bbs_no} </td>
            <td>
            
            <div class="bsnmreviewdate">
           	<p>작성일 : ${dto.writngde} | 닉네임 : ${dto.ncnm}</p>
            </div>
            <div class="goodandbadbutton">
           <input type="checkbox" name="${dto.bbs_no }" value="${dto.bbs_no }" id="box${dto.bbs_no }" onclick="show${dto.bbs_no }()"><label for="box${dto.bbs_no }">좋아요</label>
       		<br><span name="holy" id="${dto.bbs_no }holy">${dto.likes}</span>
            <!-- <input type="text" id="${dto.bbs_no }holy" name="holy" value="${dto.likes}" readonly> -->
            </div>
            <div class="goodandbadcotent">
            <p class="cntext">${dto.cn}</p>
            
            </div>
            
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