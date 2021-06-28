<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/httpRequest.js"></script>
<script>
function show()
{
   var delng_no = document.getElementById('delng_no').value;
   var params = 'delng_no='+delng_no;
   sendXHR('testListInfo.pi',params,showResult,'GET');
}
function showResult()
{
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
         var data = XHR.responseText.trim();
         var strData = data.split(',');
         var join = document.getElementById('disp');
         
         document.all.disp.innerHTML=strData[0];
      }
   }
}
</script>
</head>
<body>
ajax 처리 (db자료 출력)<br>
<input type="button" onclick="show()">
<br>
<div id="disp"></div>
<c:forEach var="te" items="tag">
	${sb }
</c:forEach>
</body>
</html>