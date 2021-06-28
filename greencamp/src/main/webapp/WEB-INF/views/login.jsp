<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <style>
  body, td { font-size: 13px }
  #disableDiv { position:absolute; left:0; top:0;width:100%; height:100%; z-index:995 ; background-color:#000000; filter:Alpha(opacity=80);opacity:0.8; -moz-opaciry:0.8}
  #loadingDiv { position:absolute; left:100; top:100;width:600px; height:600px; z-index:999; background-color:#FFFFFF;};
  </style>
  <script>
  playAlert = setInterval(function()
		  	{
		  		var a = Math.floor(Math.random() * 10) + 1;
		  		document.all.test.value=a;
		  	}, 3000);
  
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
  .registbt1{
position:relative;

	cursor:pointer;
	width:50%;
	float:left;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
}
  .registbt2{
  position:relative;
width:60%;
height:30px;
font-size:10px;
left:20%;
margin-top:10px;
border-radius:3px;
}
  .registbt2first{
  position:relative;
width:60%;
height:30px;
font-size:10px;
left:20%;
margin-top:10px;
border-radius:5px;

}
  .registbt3first{
  position:relative;
width:62%;
height:30px;
font-size:10px;
left:20%;
margin-top:10px;
border-radius:5px;

}
  .registbt3{
position:relative;
	left:155px;
	cursor:pointer;
	width:50%;
	float:left;
	border:none;
	background:#0CF;
	color:#FFF;
	margin:0 0 5px;
	padding:10px;
	font-size:15px;
	height:50px;
	margin-top:20px;
}
  </style>
 </head>
 <body onload="playAlert();">
  <a href="javascript:disableActive();">비활성화</a><br/>

  <div id="disableDiv" class="disableDiv" style="display:none" onclick="reset()">
  </div>
  
  <div id="loadingDiv" class="loadingDiv" style="display:none">
  <form name="join">
  <input class="registbt1" type="button" value="로그인"><input class="registbt1" type="button" value="회원가입">
  <br>
  <input class="registbt2first" type="text" name="id" placeholder="아이디"><br>
  <input class="registbt2" type="text" name="pwd" placeholder="패스워드"><br>
  <input class="registbt2" type="text" name="name" placeholder="이름"><br>
  <input class="registbt2" type="text" name="email" placeholder="이메일"><br>
  <input class="registbt2" type="text" name="nickname" placeholder="닉네임"><br>
  <input class="registbt2" type="text" name="telno" placeholder="전화번호"><br>
  <input class="registbt2" type="text" name="bsnmno" placeholder="사업자번호"><br>
  
  <input class="registbt3" type="submit" value="회원가입">
  </form>
  </div>
 </body>
</html>