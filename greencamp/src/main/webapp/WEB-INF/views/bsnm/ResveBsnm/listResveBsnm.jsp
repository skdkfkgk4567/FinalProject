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
<script>
   var today = new Date();     
   var date = new Date();
   
   function beforem()
   { 
      today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
      autoReload();
   }
   function nextm()
   {
      today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
      autoReload();
   }
   
   function thisMonth(){
      today = new Date();
      autoReload();
   }

   function autoReload()
   {
      var nMonth = new Date(today.getFullYear(), today.getMonth(), 1);
      var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
      var tbcal = document.getElementById("calendar");
      var yearmonth = document.getElementById("yearmonth");
      yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월";

      if(today.getMonth()+1==12)
      {
         before.innerHTML=("<"+today.getMonth())+"월";
         next.innerHTML="1월"+">";
         
      }
      else if(today.getMonth()+1==1)
      {
         before.innerHTML="<"+"12월";
         next.innerHTML=(today.getMonth()+2)+"월" +">";
      }
      else
      {
         before.innerHTML="<"+(today.getMonth())+"월";
         next.innerHTML=(today.getMonth()+2)+"월"+">";
      }
      while (tbcal.rows.length > 2) 
      {
         tbcal.deleteRow(tbcal.rows.length - 1);
      }
      var row = null;
      row = tbcal.insertRow();
      var cnt = 0;
      var dayCheck = (nMonth.getDay()==0) ? 7 : nMonth.getDay();

      for (i = 0; i < (dayCheck-1); i++) 
      {
         cnt = cnt + 1;
         cell = row.insertCell();
         
         if (i>4) {
            cell.style.backgroundColor = "";
         }
      }
      for (i = 1; i <= lastDate.getDate(); i++)
      { 
         cell = row.insertCell();
         
         var str="";
         
         str += "<div>"+i+"</div>";
         var day = (i<10) ? "0"+i : i;               
         str += "<div id='"+day+"'></div>";
         cell.innerHTML = str;
         
         cnt = cnt + 1;
         if (cnt % 7 == 6) {
            var str="";
            str += "<div>"+i+"</div>";
            var day = (i<10) ? "0"+i : i;               
            str += "<div id='"+day+"'>";
            str += "</div>";
            cell.innerHTML = str;
            cell.style.color = "#009de0";
            cell.style.backgroundColor = "";                    
         }
         if (cnt % 7 == 0) {
            var str="";
            str += "<div>"+i+"</div>";
            var day = (i<10) ? "0"+i : i;               
            str += "<div id='"+day+"'>";
            str += "</div>";
            cell.innerHTML = str;
            row = calendar.insertRow();
            cell.style.color = "#ed5353";
            cell.style.backgroundColor = "";
         }
         
         if(lastDate.getDate() == i && ((cnt % 7) != 0)){
            var add = 7 - (cnt % 7);
            for(var k = 1; k <= add; k++){
               cell = row.insertCell();
               cnt = cnt + 1;
               if (cnt % 7 == 6) {
                  cell.style.backgroundColor = "";
               }
               if (cnt % 7 == 0) {
                  cell.style.backgroundColor = "";
               }
            }
         }
         if( today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() && i==date.getDate() )
         {
            cell.style.backgroundColor = "#e2f3da";
         }
         
         if(lastDate.getDate() == i && ((cnt % 7) != 0)){
            var add = 7 - (cnt % 7);
            for(var k = 1; k <= add; k++){
               cell = row.insertCell();
               cnt = cnt + 1;
               if (cnt % 7 == 6)
               {
                  cell.style.backgroundColor = "";
               }
               if (cnt % 7 == 0)
               {
                  cell.style.backgroundColor = "";
               }
            }
         }
           
      }
      var tdId = "01";
      var str = "";
      str+="17번 사이트(데크)lws5760(이원섭) ";
      document.getElementById(tdId).innerHTML = str;
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
#listResvescroll::-webkit-scrollbar {
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
<body onload="autoReload()">
	<!------------------------------------------ 헤더 -------------------------------------------------------------->
	<header>
		<jsp:include page="../../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ 해더아래 아이디 캠핑장이름 -------------------------------------------------------------->
<jsp:include page="../../bsnmsidebar.jsp"></jsp:include>
	<!------------------------------------------ 사이드 메뉴 -------------------------------------------------------------->


	<!------------------------------------------ 본문영역 -------------------------------------------------------------->
	<label class="registtitle">예약자현황</label>
	
<div class="maincontent" id="listResvescroll">
   <table align="center" id="calendar" width="90%" height="90%">
      <tr>
         <td><a id="before" href="javascript:beforem()"></a></td>
         <td colspan="4" align="center">
            <div id="yearmonth"></div>
         </td>
         <td><a id="next" href="javascript:nextm()"></a></td>
         <td><a href="javascript:thisMonth()">오늘</a></td>
      </tr>
      <tr>
         <td width="14%">월</td>
         <td width="14%">화</td>
         <td width="14%">수</td>
         <td width="14%">목</td>
         <td width="14%">금</td>
         <td width="14%"><font color="#009de0">토</font></td>
         <td width="14%"><font color="#ed5353">일</font></td>
      </tr>
   </table>
</div>
<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
</body>
</html>