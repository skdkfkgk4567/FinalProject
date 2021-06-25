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
<link rel="stylesheet" href="assets/css/weather.css">
<script type="text/javascript" src="assets/js/splitter.min.js"></script>
<script src="assets/js/getWeather.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1254720cd107949a5e0c2347d3558385&libraries=services"></script>
<link rel="stylesheet" type="text/css" href="assets/css/splitter.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/searchResult.css" />
<style>
#listSection {
	margin: auto;
	margin-top: 100px;
	width: 2000px;
}

h4.chead {
	padding-left: 40px;
	font-size: 15px;
	font-weight: 600;
	height: 24px;
	line-height: 24px;
	color: #144794;
	position: relative
}

h4.chead .distance {
	color: #ff6000
}

h4.chead i.fa {
	color: #bbb
}

h4.chead.first {
	margin-top: 1px
}

.Check {
	padding-left: 20px;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 1000px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
.short_cont {padding:0px 0 0px 24px;font-size:14px;font-weight:400;color:#222;background:url(./image/ico_note.png) no-repeat left 42px;line-height:165%}
.short_cont .og_mbr {padding-bottom:5px;margin-bottom:15px;border-bottom:1px #ddd solid}
.short_cont .og_mbr:after {content:'';display:block;clear:both;float:none}
.short_cont a {color:#0066ff}
.short_cont a:hover {color:#003399}
.short_cont span {font-weight:700}
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
			style="height: 1000px; border: 1px solid #888;">
			<div class="scrollarea tse-scrollable" style="height: 100%;">
				<div class="tse-scrollbar" style="display: block;">
					<div class="drag-handle" style="top: 0px; height: 402px;"></div>
				</div>
				<div class="tse-scroll-content scrollwrapbox"
					style="width: 550px; height: 100%;">
					<div class="tse-content" style="">
						<div class="listwrap">
							<c:forEach var="list" items="${list }">
								<div class="search_result"
									onload="moveCam(${list.lat},${list.longti},'${list.camp_nm }','${list.addr }','${list.camp_telno }')">
									<span class="b fblue2"> ${list.camp_nm } </span>
								</div>
								<div class="search_result">
									<input type="button" value="찜하기"> <input type="button"
										value="추천"> <input type="button" value="신고">
								</div>
								<div class="search_result">
									<span class="b fblue2"> ${list.addr } </span>
								</div>
								<div class="search_result">
									<span class="b fblue2"> ${list.lat }</span> <span
										class="b fblue2"> ${list.longti }</span>
								</div>
								<div class="search_result">
									<span class="b fblue2"> ${list.camp_telno } </span>
								</div>
								<div class="d-flex flex-row">
									<div class="p-2 blockContent1">주변 환경</div>
									<div class="p-2 blockContent2">${list.camp_surround }</div>
									<div class="p-2 blockContent1">바닥 종류</div>
									<div class="p-2 blockContent2">${list.camp_ground }</div>
								</div>
								<c:set var="cvntl" value="${fn:split(list.cvntl,'+')}" />
								<div class="facilities">
									<span class="c_ico ico_tool"></span>
									<div class="facilities_all">
										<c:forEach var="cvn" items="${cvntl }">
											<div class="facilities_list">
												<p class="f_ico">
													<img src="https://vga9354.synology.me:9898/img/${cvn }.svg"
														alt="${cvn }" width="40" class="svg_ico">
												</p>
												<p class="f_name">${cvn }</p>
											</div>
										</c:forEach>
									</div>
								</div>
								<div class="b fblue2 campInfo">
								<img alt="" src="assets/img/ico_time.png">
									<div class="short_cont">
										${list.camp_intro }
									</div>
								</div>
								
								<div class="b fblue2 campDetail">
								<span class="chead etc f18 ">안내사항</span><br>
									${list.camp_dc }
								</div>
								<div class="b fblue2 checkInOut">
									<span class="chead time fblack">
									<img alt="" src="assets/img/ico_time.png"><span>캠핑장 소개</span>
										<span class="Check">Checkin</span> <span class="fblue2">${list.checkin }</span>
										- <span class="Check">Checkout</span> <span class="fblue2">${list.checkout }</span>
									</span>
								</div>
								<div class="b fblue2 pc">
									<c:forEach var="sitepc" items="${sitepc }">
										<div class="fblue2">${sitepc.sitenm }:${sitepc.pc }원</div>
									</c:forEach>
								</div>

								<div class="b fblue2 weather" id="weatherDiv">
									<script>
								getWeather(${list.lat },${list.longti });
								</script>
								</div>
							</c:forEach>
						</div>
						<div class="p-2 blockContent1">주변 캠핑장</div>
						<div class="b fblue2 flex-row otherCamp">
							<div class="campList">캠핑장1</div>
							<div class="campList">캠핑장2</div>
							<div class="campList">캠핑장3</div>
							<div class="campList">캠핑장4</div>
						</div>
						<div class="search_result">
							<div class="main2">
								<input type="radio" id="tab-1" name="show" checked /> <input
									type="radio" id="tab-2" name="show" /> <input type="radio"
									id="tab-3" name="show" /> <input type="radio" id="tab-4"
									name="show" /> <input type="radio" id="tab-5" name="show" />
								<div class="tab2">
									<label for="tab-1">리뷰</label> <label for="tab-2">댓글</label> <label
										for="tab-3">주변 행사안내</label> <label for="tab-4">주변 관광지</label>
									<label for="tab-5">주변 맛집</label>
								</div>
								<div class="content2">
									<div class="content2-dis"></div>
									<div class="content2-dis"></div>
									<div class="content2-dis">
										<div class="row" id="uid_2601" style="min-width: 500px;">
											<input type="hidden" id="p_2601" name="pcount" value="1">
											<div class="leftphoto">
												<div class="photo ">행사 이미지영역</div>
											</div>
											<div class="contright ">
												<div class="subject">
													<a> 행사 이름영역 <span class="comment"> <i
															class="fa fa-comment-o" aria-hidden="true"></i>
													</span>
													</a>
												</div>
												<div class="cont">
													<ul>
														<li class="address">주소영역</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="content2-dis">
										<div class="row" id="uid_2601" style="min-width: 500px;">
											<input type="hidden" id="p_2601" name="pcount" value="1">
											<div class="leftphoto">
												<div class="photo ">관광지 이미지영역</div>
											</div>
											<div class="contright ">
												<div class="subject">
													<a> 관광지 이름영역 <span class="comment"> <i
															class="fa fa-comment-o" aria-hidden="true"></i>
													</span>
													</a>
												</div>
												<div class="cont">
													<ul>
														<li class="address">관광지 주소영역</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="content2-dis">
										<div class="row" id="uid_2601" style="min-width: 500px;">
											<input type="hidden" id="p_2601" name="pcount" value="1">
											<div class="leftphoto">
												<div class="photo ">맛집 이미지영역</div>
											</div>
											<div class="contright ">
												<div class="subject">
													<a> 맛집 이름영역 <span class="comment"> <i
															class="fa fa-comment-o" aria-hidden="true"></i>
													</span>
													</a>
												</div>
												<div class="cont">
													<ul>
														<li class="address">맛집 주소영역</li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="loadermain1"></div>
					</div>
					<!--tse-content-->
				</div>
				<!--tse-scroll-content-->
			</div>
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
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
				</ul>
			</div>
			<div id="map" style="width: 100%; height: 1000px;"></div>
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

//마커를 생성합니다
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
} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
    // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

} else if (status === kakao.maps.services.Status.ERROR) {
    // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
    
}
}

//지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
var order = document.getElementById(currCategory).getAttribute('data-order');



for ( var i=0; i<places.length; i++ ) {

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
</script>
		</div>
	</div>
</body>
</html>