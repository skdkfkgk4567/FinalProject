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

#maincontentupdatescroll::-webkit-scrollbar {
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
#buttons{
	width:170px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align:center;
    text-decoration: none;
    display: inline-block
    font-size: 15px;
    margin-left: 120px;
    cursor: pointer;
    border-radius:10px 10px;
}
</style>
<script>
function show()
{
   var params;
   var nm = document.getElementById("nm").value;
   var email = document.getElementById("email").value;
   var ncnm = document.getElementById("ncnm").value;
   var telno = document.getElementById("telno").value;
   var bizrno = document.getElementById("bizrno").value;
  
   params = 'nm='+nm+'&email='+email+'&ncnm='+ncnm+'&telno='+telno+'&bizrno='+bizrno;
   sendXHR('updatebsnmmemberinfo.pi',params,showResult,'GET');
}

function showResult()
{   //?????? ????????? ??????
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText.trim();
    	 
    	  var confirmflag = confirm(data);
     	 	if(data=="????????????")
    		{	
     	 		gopage();
     	 	}    	  
      }
   }
   
}
function gopage(){
	location.href="listMemberBsnm.pi";
	
}
</script>
</head>
<body>
	<!------------------------------------------ ?????? -------------------------------------------------------------->
	<header>
		<jsp:include page="../../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ ???????????? ????????? ??????????????? -------------------------------------------------------------->
<jsp:include page="../../bsnmsidebar.jsp"></jsp:include>
	<!------------------------------------------ ????????? ?????? -------------------------------------------------------------->


	<!------------------------------------------ ???????????? -------------------------------------------------------------->
	<label class="registtitle">?????????????????????</label>

<div class="maincontentupdatemember" id="maincontentupdatescroll">
<form name="updatebsnmmemberlist" action="updatebsnmmemberinfo.pi">
<c:forEach var="dto" items="${list}">
	<label>??????</label> <input type="text" name="nm" id="nm" value="${dto.nm}"><br>
	<label>?????????</label> <input type="text" name="email" id="email" value="${dto.email}"><br>
	<label>??????</label> <input type="text" name="ncnm"id="ncnm" value="${dto.ncnm}"><br>
	<label>????????????</label> <input type="text" name="telno"id="telno" value="${dto.telno}"><br>
	<label>???????????????</label> <input type="text" name="bizrno"id="bizrno" value="${dto.bizrno}"><br>
	<input id="buttons" type="button" value="????????????" onclick="show()">
	
	<hr>
</c:forEach>
</form>
<table class="bsnmcamplist container table-responsive-xl" border="1">
    <thead>
        <tr class="fixedth">
            <th width=250>NO.</th>
            <th>???????????????</th>
            <th width=250>??????</th>
            
        </tr>
    </thead>
    <tbody>
    <c:if test="${empty list}">
		<tr>
			<td colspan="4">?????? ?????????????????????
			</td>
		</tr>
	</c:if>
    <c:forEach var="dto2" items="${list2}">
    
    <input type="hidden" id="camp_no" value="${dto2.camp_no}">
    <c:url value="detailcampinfobsnm.pi" var="url">
    <c:param name="camp_no" value="${dto2.camp_no}"></c:param>
    </c:url>
        <tr>
            <td>${dto2.camp_no}</td>
            
            <td><a href="${url}">${dto2.camp_nm}</a></td>
            <td colspan="2">
            <input class="buttons" type="button" value="??????" onclick="show()">
            <input class="buttons" type="button" value="??????" onclick="goupdate()">
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