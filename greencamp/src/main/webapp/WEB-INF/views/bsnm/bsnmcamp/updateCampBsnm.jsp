<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<link href="<c:url value="/assets/css/maincss.css"/>" rel="stylesheet">
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
label {
	width: 150px;
	padding: 15px;
}

.labelsafe {
	width: 120px;
	padding: 15px;
}

.labelsafe1 {
	width: 120px;
	padding: 8px;
}

.registformleft {
	float: left;
	width: 500px;
	margin-left: 130px;
	margin-right: 70px;
	margin-top: 20px;
}

.registformright {
	float: left;
	width: 500px;
	margin-top: 20px;
}

.checksafe {
	margin-left: 80px;
	margin-top: -55px;
}

.checkcon {
	margin-left: 80px;
	margin-top: -55px;
}

.onelineiintroduce {
	margin-top: -40px;
	margin-left: 140px;
}

.registbt {
	position: relative;
	top: 4px;
	cursor: pointer;
	width: 100%;
	border: none;
	background: #0CF;
	color: #FFF;
	margin: 0 0 5px;
	padding: 10px;
	font-size: 15px;
	height: 50px;
}

.registbt1 {
	position: relative;
	top: 12px;
	cursor: pointer;
	width: 100%;
	border: none;
	background: #0CF;
	color: #FFF;
	margin: 0 0 5px;
	padding: 10px;
	font-size: 15px;
	height: 50px;
}



.circumstance {
	margin-left: 80px;
	margin-top: -45px;
}

.reset {
	position: relative;
	top: 7px;
	cursor: pointer;
	width: 100%;
	border: none;
	background: #0CF;
	color: #FFF;
	margin: 0 0 5px;
	padding: 10px;
	font-size: 15px;
	height: 50px;
	margin-top: 67px;
	padding-bottom: 10px;
}

#disableDiv {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	z-index: 995;
	background-color: #000000;
	filter: Alpha(opacity = 80);
	opacity: 0.8;
	-moz-opaciry: 0.8
}

#loadingDiv {
	margin-top: 0px;
	margin-left: 500px;
	position: absolute;
	left: 100;
	top: 100;
	width: 800px;
	height: 600px;
	z-index: 999;
	background-color: #FFFFFF;
}

;
.sendmsgbutton {
	margin-left: 100px;
}

.writemsg {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
}

.writemsgpaper {
	background: #F9F9F9;
	padding: 25px;
	margin-top: 50px;
	margin-bottom: 50px;
}

.writemsgpaper>h3 {
	margin-top: -100px;
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

.writemsgpaper input, .writemsgpaper textarea {
	width: 100%;
	padding: 10px;
}

.writemsgpaper textarea {
	height: 400px;
	max-width: 100%;
	resize: none;
}

.writemsgpaper #writemsgbutton {
	cursor: pointer;
	width: 100%;
	border: none;
	background: #0CF;
	color: #FFF;
	margin: 0 0 5px;
	padding: 10px;
	font-size: 15px;
}

.movex {
	margin-left: 800px;
	display: block;
	width: 80px;
}

.buttons {
	width: 120px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 10px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block font-size: 15px;
	margin: 4px;
	cursor: pointer;
	border-radius: 5px 5px;
	float: right;
	margin-right: 100px;
}

h1 {
	text-align: center;
}

h2 {
	text-align: center;
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
   
   
	     function showmessage() {
	        document.getElementById('campregistform').submit();
	      
	};
	
	 function show()
	  {
	     var params;
	     var  camp_nm = document.getElementById("camp_nm").value;
	     var  addr= document.getElementById("addr").value;
	     var  camp_telno= document.getElementById("camp_telno").value;
	     var  bizrno= document.getElementById("bizrno").value;
	     var  checkin= document.getElementById("checkin").value;
	     var  checkout= document.getElementById("checkout").value;
	     
	     /*????????????*/
	     
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
	     +'&camp_theme='+camp_theme+'&camp_ground='+camp_ground+'&sffc='+sffc+'&cvntl='+cvntl+'&camp_intro='+camp_intro;
	     sendXHR('registupdateCampBsnm.pi',params,showResult,'GET');
	  }
	function showResult()
	{   //?????? ????????? ??????
	   if(XHR.readyState==4)
	   {
	      if(XHR.status==200)
	      {
	    	  var data = XHR.responseText.trim();
	    	  var confirmflag = confirm(data);
	    	  
	   	 	if(data=="??????")
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
	<!------------------------------------------ ?????? -------------------------------------------------------------->
	<header>
		<jsp:include page="../../header.jsp"></jsp:include>
	</header>
	<!------------------------------------------ ???????????? ????????? ??????????????? -------------------------------------------------------------->
	<jsp:include page="../../bsnmsidebar.jsp"></jsp:include>
	<!------------------------------------------ ????????? ?????? -------------------------------------------------------------->


	<!------------------------------------------ ???????????? -------------------------------------------------------------->

	<label class="registtitle">???????????????</label>
	<c:forEach var="dto" items="${list}">
	<div class="maincontentregist ">

		<form name="campregistform"  id="campregistform" action="registupdateCampBsnm.pi">
			
				<div class="registformleft">


					<label>???????????????</label> 
					<input type="text" id="camp_nm" name="camp_nm"value="${dto.camp_nm}"><br>
					<label>???????????????</label> 
					<input type="text" id="addr"name="addr" value="${dto.addr}"><input type="button" value="????????????"><br> 
					<label>?????????????????????</label>
					<input type="text" id="camp_telno"name="camp_telno" value="${dto.camp_telno}"><br>
					<label>???????????????</label> 
					<input type="text" id="bizrno"name="bizrno"value="${dto.bizrno}"><br>

					<hr>
					<label>?????????</label> <input type="time" id="checkin" name="checkin"value="${dto.checkin}"><br> 
					<label>????????????</label> <input type="time" id="checkout" name="checkout" value="${dto.checkout}">

					<hr>
					<label>????????????</label>
					<div class="circumstance">
						<label class="labelsafe1">?????????</label>
						<input type="checkbox"value="?????????"id="camp_type1" name="camp_type" ${dto.camp_type}> 
						<label class="labelsafe1">???????????????</label>
						<input type="checkbox"value="???????????????"id="camp_type2" name="camp_type"><br> 
						<label class="labelsafe1">??????????????????</label>
						<input type="checkbox" value="??????????????????"id="camp_type3" name="camp_type">
						<label class="labelsafe1">?????????</label>
						<input type="checkbox" value="?????????"id="camp_type4" name="camp_type"><br>

					</div>
					<c:forEach var="camp_type" items="${camp_type}">
						<script>
			var ch = document.getElementsByName("camp_type");
			for(var i = 0; i < 6; i++)
			{
				
				if(ch[i].value == "${camp_type}")
				{
					ch[i].checked = "checked";
					
				}
			}
						</script>
					</c:forEach>
					<hr>
					<label>????????????</label>
					<div class="circumstance">
						<label class="labelsafe1">??????</label>
						<input type="checkbox"value="??????"id="camp_surround1" name="camp_surround"> 
						<label class="labelsafe1">??????</label>
						<input type="checkbox" value="??????"id="camp_surround2"name="camp_surround"> 
						<label class="labelsafe1">??????</label>
						<input type="checkbox" value="??????"id="camp_surround3" name="camp_surround"><br>
						<label class="labelsafe1">??????</label>
						<input type="checkbox" value="??????"id="camp_surround4" name="camp_surround">
						<label class="labelsafe1">???</label>
						<input type="checkbox" value="???"id="camp_surround5" name="camp_surround"> 
						<label class="labelsafe1">??????</label>
						<input type="checkbox" value="??????"id="camp_surround6" name="camp_surround"><br>

					</div>
					
					<c:forEach var="camp_surround" items="${camp_surround}">
						<script>
			var ch = document.getElementsByName("camp_surround");
			for(var i = 0; i < 6; i++)
			{
				
				if(ch[i].value == "${camp_surround}")
				{
					ch[i].checked = "checked";
					
				}
			}
						</script>
					</c:forEach>
					<hr>
					<label>??????</label>
					<div class="circumstance">
						<label class="labelsafe1">????????????</label>
						<input type="checkbox"name="camp_theme"id="camp_theme1" value="????????????"> 
						<label class="labelsafe1">????????????</label>
						<input type="checkbox" name="camp_theme"id="camp_theme2"  value="????????????">
						<label class="labelsafe1">????????????</label>
						<input type="checkbox" name="camp_theme"id="camp_theme3"  value="????????????"><br>
						<label class="labelsafe1">??????</label>
						<input type="checkbox"name="camp_theme"id="camp_theme4"  value="??????"> 
						<label class="labelsafe1">???????????????</label>
						<input type="checkbox" name="camp_theme"id="camp_theme5"  value="???????????????"> 
						<label class="labelsafe1">????????????</label>
						<input type="checkbox" name="camp_theme"id="camp_theme6" value="????????????"><br>
					</div>
					
					<c:forEach var="camp_theme" items="${camp_theme}">
				<script>
			var ch = document.getElementsByName("camp_theme");
			for(var i = 0; i < 6; i++)
			{
				
				if(ch[i].value == "${camp_theme}")
				{
					ch[i].checked = "checked";
					
				}
			}
				</script>
					</c:forEach>
					
					<input class="registbt" type="button" id="campregistbutton" onclick="show()"
						value="????????????">
				</div>
				<div class="registformright">
					<label>????????????</label>
					<div class="checksafe">
						<label class="labelsafe">??????</label>
						<input type="checkbox" value="??????"id="camp_ground1"  name="camp_ground"> 
						<label class="labelsafe">??????</label>
						<input type="checkbox" value="??????"id="camp_ground2" name="camp_ground"><br>
						<label class="labelsafe">?????????</label>
						<input type="checkbox" value="?????????"id="camp_ground3" name="camp_ground"> 
						<label class="labelsafe">???</label>
						<input type="checkbox" value="???"id="camp_ground4" name="camp_ground"><br>
					</div>
					<c:forEach var="camp_ground" items="${camp_ground}">
						<script>
		var chg = document.getElementsByName("camp_ground");
			for(var i = 0; i < 12; i++)
			{
				
				if(chg[i].value == "${camp_ground}")
				{
					chg[i].checked = "checked";
					
				}
			}
		</script>
		</c:forEach>
					<hr>
					<label>????????????</label>
					<div class="checksafe">
						<label class="labelsafe">?????????</label>
						<input type="checkbox" value="?????????" id="sffc1" name="sffc"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" value="????????????" id="sffc2" name="sffc"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" value="????????????" id="sffc3" name="sffc"><br> 
						<label class="labelsafe">?????????</label>
						<input type="checkbox" value="?????????" id="sffc4" name="sffc"> 
						<label class="labelsafe">??????????????????</label>
						<input type="checkbox" value="??????????????????" id="sffc5" name="sffc"> 
						<label class="labelsafe">?????????</label>
						<input type="checkbox" value="?????????" id="sffc6" name="sffc"><br> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" value="????????????" id="sffc7" name="sffc"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" value="????????????" id="sffc8" name="sffc"> 
						<label class="labelsafe">?????????</label>
						<input type="checkbox" value="?????????"id="sffc9" name="sffc"><br>
					</div>
					
					<c:forEach var="sffc" items="${sffc}">
						<script>
			var ch = document.getElementsByName("sffc");
			
			for(var i = 0; i < 9; i++)
			{
				if(ch[i].value == "${sffc}")
				{
					ch[i].checked = "checked";
					
				}
			}
		</script>
					</c:forEach>
					
					<hr>
					<label>????????????</label> <br>
					<div class="checkcon">
						<label class="labelsafe">??????</label>
						<input type="checkbox" id="cvntl1" value="??????" name="cvntl"> 
						<label class="labelsafe">??????</label>
						<input type="checkbox" id="cvntl2" value="??????" name="cvntl"> 
						<label class="labelsafe">??????????????????</label>
						<input type="checkbox" id="cvntl3" value="??????????????????" name="cvntl">
						<br> 
						<label class="labelsafe">??????????????????</label>
						<input type="checkbox" id="cvntl4" value="??????????????????" name="cvntl">
						<label class="labelsafe">???????????????</label>
						<input type="checkbox" id="cvntl5" value="???????????????" name="cvntl"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" id="cvntl6" value="????????????" name="cvntl"> <br> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" id="cvntl7" value="????????????" name="cvntl"> 
						<label class="labelsafe">?????????</label>
						<input type="checkbox" id="cvntl8" value="?????????" name="cvntl"> 
						<label class="labelsafe">??????</label>
						<input type="checkbox" id="cvntl9"value="??????" name="cvntl"> <br> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" id="cvntl10" value="????????????" name="cvntl"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" id="cvntl11" value="????????????" name="cvntl"> 
						<label class="labelsafe">????????????</label>
						<input type="checkbox" id="cvntl12" value="????????????" name="cvntl"> <br>
					</div>
					
					
					<c:forEach var="cvntl" items="${cvntl}">
						<script>
		var ch = document.getElementsByName("cvntl");
			for(var i = 0; i < 12; i++)
			{
				
				if(ch[i].value == "${cvntl}")
				{
					ch[i].checked = "checked";
					
				}
			}
		</script>
					</c:forEach>
					<hr>
					<label>?????????????????????</label>
					<div class="onelineiintroduce">
						<input type="text" value="${dto.camp_intro }" name="camp_intro" id="camp_intro" readonly><input
							type="button" value="????????????" onclick='disableActive()'><br>
					</div>
					<hr>
					<input class="reset" type="reset" value="????????????">
				</div>
			
		</form>

	</div>

	<div id="disableDiv" class="disableDiv" style="display: none"></div>
	<div id="loadingDiv" class="loadingDiv" style="display: none">
		<div class="movex">
			<img src="assets/img/x.png" width=70px height=70px onclick="reset()">
		</div>
		<div class="writemsg">
			<div class="writemsgpaper">

				<h2>?????????</h2>
				<div class="row">
					<textarea placeholder="????????? ????????????"id="writeqwerty">${dto.camp_intro }</textarea>
				</div>
				<div class="row">
					<button type="button" id="writemsgbutton" name="campregistoneline"
						onclick="sendcn()">?????????</button>
				</div>

			</div>
		</div>
	</div>
</c:forEach>
	<footer>
		<jsp:include page="../../footer.jsp"></jsp:include>
	</footer>
</body>
</html>