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
        table.table2{
                border-collapse: separate;
                border-spacing: 1px;
                text-align: left;
                line-height: 1.5;
                border-top: 1px solid #ccc;
                margin : 20px 10px;
                background-color:#c8c8c8;
        }
        table.table2 tr {
                 width: 150px;
                 height:50px;
                 padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
        }
        table.table2 td {
                 width: 200px;
                 padding: 10px;
                vertical-align: top;
                 border-bottom: 1px solid #ccc;
        }
 		h1{
 		text-align:center;
 		}
		.moveform{
		
		height:500px;
		
		
		}
		.left{
		float:left;
		}
		.right{
		float:right;
		height:650px;
		width:600px;
		}
		.fixedtr{
		top: 0px;
		position:sticky;
		}
		.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
    text-overflow: ellipsis;
    	table-layout: fixed;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
    font-size:10px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
#right::-webkit-scrollbar {
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
.buttons{
	width:170px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align:center;
    text-decoration: none;
    display: inline-block
    font-size: 15px;
    margin-left:270px;
    cursor: pointer;
    border-radius:10px 10px;
    margin-top:-30px;

}
</style>
<script>
function show()
{
   var params;
   var ctgry = document.getElementById("ctgry").value;
   var pc = document.getElementById("pc").value;
   var  sj= document.getElementById("sj").value;
   var  id= document.getElementById("id").value;
   var cn = document.getElementById("cn").value;
   params = 'ctgry='+ctgry+'&pc='+pc+'&sj='+sj+'&id='+id+'&cn='+cn;
   sendXHR('eventsend.pi',params,showResult,'GET');
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
<label class="registtitle">광고/이벤트신청</label>
<div class="maincontent">
<div class="left">
       <form class="moveform" name="eventadd" action ="eventsend.pi">
        <table bgcolor="#d8d8d8"  align = center width=700 border=1 cellpadding=2 >
                
                <tr>
                <td>
                <table class ="table2">
                		<tr>
                		<td><select id="ctgry" name="ctgry">
                		<option value="이벤트">이벤트</option>
                		<option value="광고">광고</option>
                		</select></td>
                		</tr>
                		
                        <tr>
                        <td>작성자 </td>
                        <td>이원섭</td>
                        </tr>
                        
                         <tr>
                        <td> 이메일 </td>
                        <td>sub940522@naver.com</td>
                        </tr>
                        
                        <tr>
                        <td> 전화번호 </td>
                        <td>010-9290-7545</td>
                        </tr>
                        
                        <tr>
                        <td> 할인율 </td>
                        <td><input type="number" step="5" min="0" max="99" id="pc" value="0" name="pc">%</td>
                      
                        </tr>
                        
 
                        <tr>
                        <td>제목</td>
                        <td><input type = text name = sj id="sj" size=60></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td><textarea name = cn id="cn" cols=70 rows=10></textarea></td>
                        </tr>
                        <input type="hidden" name="id" id="id" value="${sessionScope.user_id}">
 
                      
                        </table>
 
                        <div class="eventwirtepaper">
                        <input class="buttons" type ="button" id="writemsgbutton" value="작성" onclick="show()">
                        </div>
                </td>
                </tr>
        </table>
        </form>
        </div>
        
        <div class="right" id="right">
        
        <table class ="styled-table">
        <thead>
        <tr class="fixedtr">
        <th width="70">카테고리</th>
        <th>제목</th>
        <th>내용</th>
        <th width="50">할인</th>
        <th width="50">상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="dto" items="${list }">
        <tr>
        <td width="60">${dto.ctgry }</td>
        <td>${dto.sj }</td>
        <td>${dto.cn }</td>
        <td>${dto.pc }%</td>
        <c:if test="${dto.state eq 1 }"> 
        <td width="60">심사중</td>
        </c:if>
        <c:if test="${dto.state eq 2 }"> 
        <td width="60">진행중</td>
        </c:if>
        
        </tr>
        </c:forEach>
        </tbody>
        </table>
        
        
        </div>
<div id="testResponseText"></div>
</div>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>