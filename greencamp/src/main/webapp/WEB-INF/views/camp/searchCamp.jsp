<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'${camp_nm }' 검색결과</title>

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/list.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1254720cd107949a5e0c2347d3558385&libraries=LIBRARY"></script>
<script type="text/javascript" src="assets/js/splitter.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/trackpad-scroll-emulator/1.0.8/jquery.trackpad-scroll-emulator.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/trackpad-scroll-emulator/1.0.8/jquery.trackpad-scroll-emulator.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=w355y0uw38&callback=initMap"></script>
<style>
.pdt20  {padding-top:20px !important; display:inline-block;}
.pagenation {text-align:center;padding-bottom:20px;min-width:100%}
.pagenation.pgtop {padding-top:20px;}
.pagebox01 {display:inline-block;}
.pagebox01 img {padding:0;margin:0 1px;float:left}
.pagebox01 .selected, .pagebox01 .notselected {text-decoration:none;font-size:13px;padding:0 2px 0 2px;min-width:24px;text-align:center;line-height:24px;height:24px;font-weight:bold;display:inline-block;margin:0 2px;background:#eee;float:left;border:1px #ccc solid}
.pagebox01 .selected {background:#25a5f0 ;color:#fff;border:none;border:1px #25a5f0 solid}
.pagebox01 .notselected {color:#222;}
.pagebox01 .notselected:hover {background:#ccc;color:#fff;border-color:#ccc}


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/splitter.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/searchResult.css" />
<style>
#listSection {
	margin: auto;
	margin-top: 100px;
	width: 1600px;
}

.contright {
	width: 350px;
}

#CampPaging {
	margin: auto;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="listSection">
		<div class="searchbox">
			<div class="searchform">
				<div class="search_result">
					<a href="javascript:;" onclick="history.back(-1)"
						class="bbtn2 bbtn2-orange fr"><i class="fa fa-undo"
						aria-hidden="true"></i> 검색취소</a> <span class="b fblue2">
						"${camp_nm }" </span> 검색결과 입니다.
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="vertically_divided"
			style="height: 800px; border: 1px solid #888;">
			<div class="scrollarea tse-scrollable" style="height: 100%;">
				<div class="tse-scrollbar" style="display: block;">
					<div class="drag-handle" style="top: 0px; height: 402px;"></div>
				</div>
				<div class="tse-scroll-content scrollwrapbox"
					style="width: 550px; height: 100%;">
					<div class="tse-content" style="">
						<div class="listwrap">
							<c:forEach var="camp" items="${list }">
								<div class="row" id="uid_2601" style="min-width: 500px;">
									<input type="hidden" id="p_2601" name="pcount" value="1">
									<div class="leftphoto">
										<div class="photo ">
											<img alt="" src="https://vga9354.synology.me:9898/img/1.jpg"
												width="160px" height="90px"
												onclick="panTo(${camp.lat},${camp.longti})">
										</div>
									</div>
									<div class="contright ">
										<div class="subject">
											<a href="detailCamp.pi?camp_no=${camp.camp_no }">
												${camp.camp_nm }
											</a>
										</div>
										<div class="cont">
											<p class="location">
												<c:set var="addrSplit" value="${fn:split(camp.addr,' ') }"></c:set>
												<a>${addrSplit[0] } </a>&nbsp;&nbsp; <a>${addrSplit[1] }</a>&nbsp;&nbsp;
												<span>${addrSplit[2] }</span>
											</p>
											<ul>
												<li class="address">${camp.addr }</li>
											</ul>
										</div>
										<div class="resve">
											<a href="resveCamp.pi?camp_no=${camp.camp_no }"
												class="btn_booking"><span>예약</span></a>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</c:forEach>
							<div class="pdt20 pagenation">
								<div id="CampPaging" class="pagebox01">
									${pageStr }
								</div>
							</div>
						</div>
						<div class="loadermain1"></div>
					</div>
				</div>
			</div>
			<div id="map" style="width:800px;height:800px;"></div>
			<script>
var mapContainer = document.getElementById('map'), 
mapOption = { 
    center: new kakao.maps.LatLng(${lat}, ${lon}),
    level: 3
};

var map = new kakao.maps.Map(mapContainer, mapOption);
map.setDraggable(true);
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
        document
    }
}

function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

var positions = [
	<c:forEach var="camp" items="${list }">
	{
		
	    title: '${camp.camp_nm}', 
	    latlng: new kakao.maps.LatLng(${camp.lat}, ${camp.longti}),
	    content : '<div class="iw_inner" style="text-align:center; border-radius:10px; background-color:skyblue; width:450px"><h3 style="padding-top: 10px;">${camp.camp_nm}</h3><img src="https://vga9354.synology.me:9898/img/1.jpg" width="100%" height="100%" alt="${camp.camp_nm}" style="border-radius:10px;"/></div>'
	},
    </c:forEach>
];


var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

for (var i = 0; i < positions.length; i ++) {

    var marker = new kakao.maps.Marker({
        map: map,
        position: positions[i].latlng
    });

    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content,
        removable : true
    });

    (function(marker, infowindow) {
        kakao.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    })(marker, infowindow);
}
function panTo(lat,lonti) {
    var moveLatLon = new kakao.maps.LatLng(lat, lonti);
    
    map.panTo(moveLatLon);            
}  
</script>
		</div>
	</div>
</body>
</html>