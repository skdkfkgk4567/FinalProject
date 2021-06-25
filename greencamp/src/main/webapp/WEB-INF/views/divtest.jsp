<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <style>
  body, td { font-size: 13px }
  
  </style>
  <script>
  
   function disableActive()
   {
    
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
 <body>
  <a href="javascript:disableActive();">비활성화</a><br/>
  <div>
  </div>
  <div id="disableDiv" class="disableDiv" style="display:none">
  </div>
  <div id="loadingDiv" class="loadingDiv" style="display:none" onclick="reset()">
  </div>
 </body>
</html>