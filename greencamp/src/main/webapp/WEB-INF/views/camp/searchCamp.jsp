<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'${camp_nm }' 검색결과</title>
<link rel="stylesheet" type="text/css" href="assets/css/detail.css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/list.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1254720cd107949a5e0c2347d3558385&libraries=services"></script>
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
	<jsp:include page="../header.jsp"></jsp:include>
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
											<img alt="" src="https://vga9354.synology.me:9898/camp/${camp.camp_no }.jpg"
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
			<div class="map_wrap">
				<div id="map"
					style="width: 800px; height: 760px; position: relative; overflow: hidden;"></div>
				<ul id="category">
					<li id="BK9" data-order="0"><span class="category_bg bank"></span>
						은행</li>
					<li id="MT1" data-order="1"><span class="category_bg mart"></span>
						마트</li>
					<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
						약국</li>
					<li id="OL7" data-order="3"><span class="category_bg oil"></span>
						주유소</li>
					<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
						카페</li>
					<li id="CS2" data-order="5"><span class="category_bg store"></span>
						편의점</li>
					<li id="FD6" data-order="5"><span class="category_bg food"></span>
						식당</li>
					<li id="AT4" data-order="5"><span class="category_bg tour"></span>
						관광명소</li>
				</ul>
			</div>
		</div>
	</div>
	<script>
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	markers = [], // 마커를 담을 배열입니다
	currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(${lat}, ${lon}), // 지도의 중심좌표
	    level: 5 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	var markerPosition  = new kakao.maps.LatLng(${lat}, ${lon}); 
	var mapTypeControl = new kakao.maps.MapTypeControl();

	//지도에 컨트롤을 추가해야 지도위에 표시됩니다
	//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	//마커를 생성합니다
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
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});
	marker.setMap(map);

	var infowindow = new kakao.maps.InfoWindow({
	    content: '<div class="iw_inner" style="text-align:center; border-radius:10px; background-color:skyblue; width:450px"><h3 style="padding-top: 10px;">${camp_nm}</h3><img src="https://vga9354.synology.me:9898/img/1.jpg" width="100%" height="100%" alt="${camp_nm}" style="border-radius:10px;"/></div>',
	    removable : true
	});

	(function(marker, infowindow) {
	    kakao.maps.event.addListener(marker, 'click', function() {
	        infowindow.open(map, marker);
	    });
	})(marker, infowindow);
	marker.setMap(map);
	//장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	//지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	//커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	//커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	//지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	//커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	//각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();
	//엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	if (target.addEventListener) {
	    target.addEventListener(type, callback);
	} else {
	    target.attachEvent('on' + type, callback);
	}
	}

	//카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	if (!currCategory) {
	    return;
	}

	// 커스텀 오버레이를 숨깁니다 
	placeOverlay.setMap(null);

	// 지도에 표시되고 있는 마커를 제거합니다
	removeMarker();

	ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}

	//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {

	    // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	    displayPlaces(data);
	} else if (status === kakao.maps.services.Status.ZERO_RESULT)
	{
	    alert('검색결과가 존재하지않습니다.')

	} else if (status === kakao.maps.services.Status.ERROR)
	{
	    alert('지도 시스템에 이상이 있어 결과를 표시할 수 없습니다.')
	}
	}

	//지도에 마커를 표출하는 함수입니다
	function displayPlaces(places)
	{

	// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	var order = document.getElementById(currCategory).getAttribute('data-order');



	for ( var i=0; i<places.length; i++ )
	{

	        // 마커를 생성하고 지도에 표시합니다
	        var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	        // 마커와 검색결과 항목을 클릭 했을 때
	        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	        (function(marker, place) {
	            kakao.maps.event.addListener(marker, 'click', function() {
	                displayPlaceInfo(place);
	            });
	        })(marker, places[i]);
	}
	}

	//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	    imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	    imgOptions =  {
	        spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	        spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	        offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	    },
	    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	        marker = new kakao.maps.Marker({
	        position: position, // 마커의 위치
	        image: markerImage 
	    });

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	return marker;
	}

	//지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	for ( var i = 0; i < markers.length; i++ ) {
	    markers[i].setMap(null);
	}   
	markers = [];
	}

	//클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	var content = '<div class="placeinfo">' +
	                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	if (place.road_address_name) {
	    content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	}  else {
	    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	}                

	content += '    <span class="tel">' + place.phone + '</span>' + 
	            '</div>' + 
	            '<div class="after"></div>';

	contentNode.innerHTML = content;
	placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	placeOverlay.setMap(map);  
	}


	//각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	var category = document.getElementById('category'),
	    children = category.children;

	for (var i=0; i<children.length; i++) {
	    children[i].onclick = onClickCategory;
	}
	}

	//카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	var id = this.id,
	    className = this.className;

	placeOverlay.setMap(null);

	if (className === 'on') {
	    currCategory = '';
	    changeCategoryClass();
	    removeMarker();
	} else {
	    currCategory = id;
	    changeCategoryClass(this);
	    searchPlaces();
	}
	}

	//클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	var category = document.getElementById('category'),
	    children = category.children,
	    i;

	for ( i=0; i<children.length; i++ ) {
	    children[i].className = '';
	}

	if (el) {
	    el.className = 'on';
	} 
	}
	function panTo(lat,lonti) {
	    var moveLatLon = new kakao.maps.LatLng(lat, lonti);
	    
	    map.panTo(moveLatLon);            
	}  
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>