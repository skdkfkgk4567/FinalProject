<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="test"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1254720cd107949a5e0c2347d3558385&libraries=services"></script>
<script>
var geocoder = new kakao.maps.services.Geocoder();

var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        document.getElementById("test").innerHTML = 'x : '+result[0].x+'<br>y :  ' + result[0].y;
    }
};

geocoder.addressSearch('서울 마포구 신촌로 6', callback);
</script>
</body>
</html>