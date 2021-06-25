<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var xhr = new XMLHttpRequest();
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/locationBasedList'; /*URL*/
var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'F%2F93akedSWcwr4vRNxLVDZbwdQ7mU6el%2FUPJtRIxMJ6kqdZ5tTamzIQB99rAVJ1aPyGqiYCwrD%2Bn%2BdESIi0ULQ%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('4'); /**/
queryParams += '&' + encodeURIComponent('MobileOS') + '=' + encodeURIComponent('ETC'); /**/
queryParams += '&' + encodeURIComponent('MobileApp') + '=' + encodeURIComponent('AppTest'); /**/
queryParams += '&' + encodeURIComponent('mapX') + '=' + encodeURIComponent('128.6142847'); /**/
queryParams += '&' + encodeURIComponent('mapY') + '=' + encodeURIComponent('36.0345423'); /**/
queryParams += '&' + encodeURIComponent('radius') + '=' + encodeURIComponent('2000'); /**/
queryParams += '&' + encodeURIComponent('_type') + '=' + encodeURIComponent('xml');
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        //alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
    	document.getElementById("test").innerText = 'Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText;
    }
};

xhr.send('');
</script>
</head>
<body>
<div id="test"></div>
</body>
</html>