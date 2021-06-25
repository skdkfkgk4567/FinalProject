<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#map
	{
		width: 1000px;
		height: 1000px;
		border: 1px solid black;
	}
</style>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=w355y0uw38&callback=initMap"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div id="map"></div>
</body>

<script type="text/javascript">
	var map = document.getElementById('map');
	var HOME_PATH = window.HOME_PATH || '.';
	<c:forEach var="camp" items="${list }">
		var ${camp.id} = new naver.maps.LatLng(${camp.lat}, ${camp.longti}),
	    map = new naver.maps.Map('map', {
	        center: ${camp.id}.destinationPoint(0, 500),
	        zoom: 15
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: ${camp.id}
	    });
    </c:forEach>
	var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
	    map = new naver.maps.Map('map', {
	        center: cityhall.destinationPoint(0, 500),
	        zoom: 15
	    }),
	    marker = new naver.maps.Marker({
	        map: map,
	        position: cityhall
	    });

	var contentString = [
	        '<div class="iw_inner">',
	        '   <h3>서울특별시청</h3>',
	        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
	        '       <img src="https://vga9354.synology.me:9898/img/1.jpg" width="55" height="55" alt="서울시청" class="thumb" /><br />',
	        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
	        '       <a href="http://www.seoul.go.kr" target="_blank">www.seoul.go.kr/</a>',
	        '   </p>',
	        '</div>'
	    ].join('');

	var infowindow = new naver.maps.InfoWindow({
	    content: contentString
	});

	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});

	infowindow.open(map, marker);
</script> 
</html>