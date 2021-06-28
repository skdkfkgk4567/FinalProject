<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <style>
  body, td { font-size: 13px }
  #disableDiv { position:absolute; left:0; top:0;width:100%; height:100%; z-index:995 ; background-color:#000000; filter:Alpha(opacity=80);opacity:0; -moz-opaciry:0.8}
  #loadingDiv { position:absolute;margin-left:100px; left:100; top:100;width:600px; height:600px; z-index:999; background-color:#FFFFFF;};
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
 </head>
 <body onload="playAlert();">
  <a href="javascript:disableActive();">비활성화</a><br/>
  <div>
   <table>
    <tr>
     <td><a href="javascript:alert('123');">내용</a></td>
     <td><div id="test"></div></td>
     <td>내용</td>
     <td>내용</td>
     <td>내용</td>
    </tr>
    
   </table>
  </div> 
  <div id="disableDiv" class="disableDiv" style="display:none">
  </div>
  <div id="loadingDiv" class="loadingDiv" style="display:none" onclick="reset()">
  <h1>lsieflisejflsejflsjsleflifjel</h1>
  </div>
 </body>
</html>