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
width:150px;
padding:15px;
}
.labelsafe{
width:120px;
padding:15px;
}
.labelsafe1{
width:120px;
padding:8px;
}
.registformleft{
float:left;
width:500px;
margin-left:130px;
margin-right:70px;
margin-top:20px;
}
.registformright{
float:left;
width:500px;
margin-top:20px;

}
.checksafe{
margin-left:80px;
margin-top:-55px;
}
.checkcon{
margin-left:80px;
margin-top:-55px;
}
.onelineiintroduce{
margin-top:-40px;
margin-left:140px;
}.registbt{
position:relative;
top:4px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
}
.registbt1{
position:relative;
top:12px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
}


.circumstance{
margin-left:80px;
margin-top:-45px;
}
.reset{
position:relative;
top:7px;
	cursor:pointer;
	width:100%;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
	margin-top:67px;
	padding-bottom:10px;
}
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
	height:400px;
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
    float:right;
    margin-right:100px;

}
h1{
text-align:center;
}
h2{
text-align:center;
}
#registscoll::-webkit-scrollbar {
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
   
   function sendcn(){
	   var cn = document.getElementById("writeqwerty").value;
	   document.getElementById("camp_intro").value=cn;
	   reset();
   }
  </script>
  
  
  <script>
  function show()
  {
     var params;
     var  camp_nm = document.getElementById("camp_nm").value;
     var  addr= document.getElementById("addr").value;
     var  camp_telno= document.getElementById("camp_telno").value;
     var  bizrno= document.getElementById("bizrno").value;
     var  checkin= document.getElementById("checkin").value;
     var  checkout= document.getElementById("checkout").value;
     var lat = document.getElementById("lat").value;
   	 var longti = document.getElementById("longti").value;
     /*캠핑종류*/
     
     var size = document.getElementsByName("camp_type").length;
     var camp_type="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("camp_type")[i].checked == true ){
      	  
             camp_type+=document.getElementsByName("camp_type")[i].value+"+";
      	 
         }
     }
     
     var size = document.getElementsByName("camp_theme").length;
     var camp_theme="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("camp_theme")[i].checked == true ){
      	  
        	 camp_theme+=document.getElementsByName("camp_theme")[i].value+"+";
      	 
         }
     }
  
     
     var size = document.getElementsByName("camp_surround").length;
     var camp_surround="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("camp_surround")[i].checked == true ){
      	  
        	 camp_surround+=document.getElementsByName("camp_surround")[i].value+"+";
      	 
         }
     }
     
     
     var size = document.getElementsByName("camp_ground").length;
     var camp_ground="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("camp_ground")[i].checked == true ){
      	  
        	 camp_ground+=document.getElementsByName("camp_ground")[i].value+"+";
      	 
         }
     }
     
     var size = document.getElementsByName("sffc").length;
     var sffc="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("sffc")[i].checked == true ){
      	  
        	 sffc+=document.getElementsByName("sffc")[i].value+"+";
      	 
         }
     }
     
     var size = document.getElementsByName("cvntl").length;
     var cvntl="";
     for(var i = 0; i <size; i++){
         if(document.getElementsByName("cvntl")[i].checked == true ){
      	  
        	 cvntl+=document.getElementsByName("cvntl")[i].value+"+";
      	 
         }
     }

     var  camp_intro= document.getElementById("camp_intro").value;
     params = 'camp_nm='+camp_nm+'&addr='+addr+'&camp_telno='+camp_telno
     +'&bizrno='+bizrno+'&checkin='+checkin+'&checkout='+checkout+'&camp_type='+camp_type+'&camp_surround='+camp_surround
     +'&camp_theme='+camp_theme+'&camp_ground='+camp_ground+'&sffc='+sffc+'&cvntl='+cvntl+'&camp_intro='+camp_intro+'&lat='+lat+'&longti='+longti;
     sendXHR('addregistCampBsnm.pi',params,showResult,'GET');
  }
     
function showResult()
{   //응답 역할의 함수
   if(XHR.readyState==4)
   {
      if(XHR.status==200)
      {
    	  var data = XHR.responseText.trim();
    	  var confirmflag = confirm(data);
    	  
 	 	if(data=="등록성공")
		{
 	 		gopage();
 	 	}    	  
      }
   }
}
function gopage(){
	location.href="listCampBsnm.pi";
	
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

<label class="registtitle">캠핑장등록</label>
<div class="maincontentregist " id="registscoll">

<form name="campregistform" id="campregistform" action="addregistCampBsnm.pi">
<div class="registformleft">
<label>캠핑장이름</label> <input type="text" id="camp_nm" name="camp_nm" required><br>
<label>캠핑장주소</label> <input type="text"id="addr" name="addr"><input type="button" onclick="sample4_execDaumPostcode()" value="주소검색"><br>
<label>캠핑장전화번호</label> <input type="text"id="camp_telno" name="camp_telno"><br>
<label>사업자번호</label> <input type="text"id="bizrno" name="bizrno"><br>
<input type="hidden" id="lat" name="lat">
<input type="hidden" id="longti" name="longti">
<hr>
<label>체크인</label>
<input type="time" id="checkin" name="checkin" value="18:00"><br>
<label>체크아웃</label>
<input type="time" id="checkout" name="checkout">

<hr>
<label>캠핑종류</label>
<div class="circumstance">
<label class="labelsafe1">글램핑</label><input type="checkbox" id="camp_type1" value="글램핑" name="camp_type">
<label class="labelsafe1">일반야영장</label><input type="checkbox" id="camp_type2" value="일반야영장" name="camp_type"><br>
<label class="labelsafe1">자동차야영장</label><input type="checkbox" id="camp_type3" value="자동차야영장" name="camp_type">
<label class="labelsafe1">카라반</label><input type="checkbox" id="camp_type4" value="카라반" name="camp_type"><br>

</div>
<hr>
<label>자연환경</label>
<div class="circumstance">
<label class="labelsafe1">강변</label><input type="checkbox"id="camp_surround1" value="강변" name="camp_surround">
<label class="labelsafe1">계곡</label><input type="checkbox"id="camp_surround2" value="계곡" name="camp_surround">
<label class="labelsafe1">농촌</label><input type="checkbox"id="camp_surround3" value="농촌" name="camp_surround"><br>
<label class="labelsafe1">바다</label><input type="checkbox"id="camp_surround4" value="바다" name="camp_surround">
<label class="labelsafe1">산</label><input type="checkbox"id="camp_surround5" value="산" name="camp_surround">
<label class="labelsafe1">호수</label><input type="checkbox"id="camp_surround6" value="호수" name="camp_surround"><br>

</div>
<hr>
<label>테마</label>
<div class="circumstance">
<label class="labelsafe1">가을단풍</label><input type="checkbox"id="camp_theme1" name="camp_theme" value="가을단풍">
<label class="labelsafe1">겨울눈꽃</label><input type="checkbox"id="camp_theme2" name="camp_theme" value="겨울눈꽃">
<label class="labelsafe1">봄꽃여행</label><input type="checkbox"id="camp_theme3" name="camp_theme"  value="봄꽃여행"><br>
<label class="labelsafe1">산책</label><input type="checkbox"id="camp_theme4" name="camp_theme" value="산책">
<label class="labelsafe1">여름물놀이</label><input type="checkbox"id="camp_theme5" name="camp_theme" value="여름물놀이">
<label class="labelsafe1">일출명소</label><input type="checkbox"id="camp_theme6" name="camp_theme" value="일출명소"><br>


</div>
<input class="registbt" type="button" id="campregistbutton" value="등록요청하기" onclick='show()'>
</div>
<div class="registformright">
<label>바닥종류</label>
<div class="checksafe">
<label class="labelsafe">나무</label><input type="checkbox"id="camp_ground1" value="나무" name="camp_ground">
<label class="labelsafe">잔디</label><input type="checkbox"id="camp_ground2" value="잔디" name="camp_ground"><br>
<label class="labelsafe">파쇄석</label><input type="checkbox"id="camp_ground3" value="파쇄석" name="camp_ground">
<label class="labelsafe">흙</label><input type="checkbox"id="camp_ground4" value="흙" name="camp_ground"><br>
</div>
<hr>
<label>안전시설</label>
<div class="checksafe">
<label class="labelsafe">고임목</label><input type="checkbox"id="sffc1" value="고임목" name="sffc">
<label class="labelsafe">대피공간</label><input type="checkbox"id="sffc2" value="대피공간" name="sffc">
<label class="labelsafe">소방시설</label><input type="checkbox"id="sffc3" value="소방시설" name="sffc"><br>
<label class="labelsafe">소화기</label><input type="checkbox"id="sffc4" value="소화기" name="sffc">
<label class="labelsafe">수위경보시설</label><input type="checkbox"id="sffc5" value="수위경보시설" name="sffc">
<label class="labelsafe">안내도</label><input type="checkbox"id="sffc6" value="안내도" name="sffc"><br>
<label class="labelsafe">안전요원</label><input type="checkbox"id="sffc7" value="안전요원" name="sffc">
<label class="labelsafe">재난경보</label><input type="checkbox"id="sffc8" value="재난경보" name="sffc">
<label class="labelsafe" >확성기</label><input type="checkbox"id="sffc9" value="확성기" name="sffc"><br>
</div>
<hr>
<label>편의시설</label><br>
<div class="checkcon">
<label class="labelsafe">등산</label><input type="checkbox" value="등산" name="cvntl"> <label class="labelsafe">매점</label><input type="checkbox" value="매점" name="cvntl2"> <label class="labelsafe">반려동물입장</label><input type="checkbox" value="반려동물입장" name="cvntl"><br>
<label class="labelsafe">수세식화장실</label><input type="checkbox" value="수세식화장실" name="cvntl"> <label class="labelsafe">온라인예약</label><input type="checkbox" value="온라인예약" name="cvntl"> <label class="labelsafe">장작판매</label><input type="checkbox" value="장작판매" name="cvntl"><br>
<label class="labelsafe">샤워시설</label><input type="checkbox" value="샤워시설" name="cvntl"> <label class="labelsafe">개수대</label><input type="checkbox" value="개수대" name="cvntl"> <label class="labelsafe">전기</label><input type="checkbox" value="전기" name="cvntl"><br>
<label class="labelsafe">온수제공</label><input type="checkbox" value="온수제공" name="cvntl"> <label class="labelsafe">와이파이</label><input type="checkbox" value="와이파이" name="cvntl"> <label class="labelsafe">동계캠핑</label><input type="checkbox" value="동계캠핑" name="cvntl"><br>
</div>
<hr>
<label>캠핑장한줄소개</label>
<div class="onelineiintroduce">
<input type="text" name="camp_intro" id="camp_intro" readonly><input type="button" value="작성하기" onclick='disableActive()'><br>
</div>
<hr>
<input class="reset" type="reset" value="다시쓰기">
</div>

</form>

</div>

<div id="disableDiv" class="disableDiv" style="display:none">
  
  </div>
  <div id="loadingDiv" class="loadingDiv" style="display:none">
  <div class="movex">
  <img src="assets/img/x.png" width=70px height=70px onclick="reset()">
  </div>
 <div class="writemsg">
    <div class="writemsgpaper">
     
      
      
        
        
       <h2>글쓰기</h2>
        <div class="row">
          <textarea placeholder="캠핑장 한줄소개" id="writeqwerty"></textarea>
        </div>
        <div class="row">
          <button type="button" id="writemsgbutton" name="campregistoneline" onclick="sendcn()">글쓰기</button>
        </div>
      
    </div>
  </div>
  </div>

<footer>
<jsp:include page="../../footer.jsp"></jsp:include>
</footer>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1254720cd107949a5e0c2347d3558385&libraries=services"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById("addr").value = roadAddr;
                getxy(roadAddr);

                var guideTextBox = document.getElementById("guide");
            }
        }).open();
    }
    function getxy(roadAddr)
    {
    	 var geocoder = new kakao.maps.services.Geocoder();

    	    var callback = function(result, status) {
    	        if (status === kakao.maps.services.Status.OK) {
    	            document.getElementById("longti").value = result[0].x;
    	            document.getElementById("lat").value = result[0].y;
    	        }
    	    };
    	    geocoder.addressSearch(roadAddr, callback);
    }
	</script>
</body>
</html>