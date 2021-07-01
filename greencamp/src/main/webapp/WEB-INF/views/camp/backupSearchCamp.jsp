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
<script type="text/javascript">
	var map = document.getElementById('map');
	var marker;
	function initMap()
	{
		var marker = new naver.maps.Marker
		const locations = [
			<c:forEach var="camp" items="${list }">
			{ place:"${camp.camp_nm}", lat: ${camp.lat}, lng: ${camp.longti} },
            </c:forEach>
        ];
		
		map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.3595704, 127.105399),
			zoom : 10
		});
		for (var i = 0; i < locations.length; i++) {
            marker = new naver.maps.Marker({
                map: map,
                title: locations[i].place,
                position: new naver.maps.LatLng(locations[i].lat, locations[i].lng),
            });
        }
	}
	
	function moveCam(lat, longti,camp_nm,camp_addr,camp_telno)
	{
		map.setCenter(new naver.maps.LatLng(lat,longti));
		marker = new naver.maps.Marker({
            map: map,
            title: camp_nm,
            position: new naver.maps.LatLng(lat, longti),
        });
		infoWindoW(lat, longti,camp_nm,camp_addr,camp_telno);
	}
	function infoWindoW(lat, longti,camp_nm,camp_addr,camp_telno)
	{
		map.panTo(new naver.maps.LatLng(lat,longti));
		var contentString = [
	        '<div class="iw_inner" style="text-align:center; border-radius:10px; background-color:skyblue; width:450px">',
	        '   <h3 style="padding-top: 10px;">'+camp_nm+'</h3>',
	        '   <p>'+camp_addr+'<br>',
	        '       '+camp_telno,
	        '   </p>',
	        ' 	<img src="https://vga9354.synology.me:9898/img/1.jpg" width="100%" height="100%" alt="'+camp_nm+'" class="thumb" style="border-radius:10px;"/>',
	        '</div>'
	    ].join('');

		var infowindow = new naver.maps.InfoWindow({
		    content: contentString,
		    borderWidth: 0,
		    disableAnchor: true,
		    backgroundColor: 'transparent',
		});

		naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		        infowindow.open(map, marker);
		    }
		});

		infowindow.open(map, marker);
	}
	
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
			style="height: 1000px; border: 1px solid #888;">
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
												onclick="moveCam(${camp.lat},${camp.longti},'${camp.camp_nm }','${camp.addr }','${camp.camp_telno }')">
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
					<!--tse-content-->
				</div>
				<!--tse-scroll-content-->
			</div>
			<div id="map"></div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>