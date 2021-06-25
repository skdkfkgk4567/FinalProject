<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
<div class="swiper-wrapper"></div>
</body>
<script>
$.ajax({
	  url: "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/locationBasedList", //API Call
	  dataType: "json",
	  type: "GET",
	  data: {
		serviceKey: "F/93akedSWcwr4vRNxLVDZbwdQ7mU6el/UPJtRIxMJ6kqdZ5tTamzIQB99rAVJ1aPyGqiYCwrD+n+dESIi0ULQ==",
		pageNo: 1,
		numOfRows: 100,
		MobileOS : 'ETC',
		MobileApp : 'test',
		mapX: 128.6142847,
		mapY: 36.0345423,
		radius: 2000,
		_type : 'json'
	  },
	  success: function(data) {
	    console.log('Received data:', data) // For testing
	    var wf = "";
	    var obj = JSON.parse(data);
	    alert(obj.items.item);
	    $.each(data.item, function(index, val) {
	  	  wf += "<div class='swiper-slide'>";
	        wf += "<p>" // Opening paragraph tag
	        wf += "<img src='" + val.firstImageUrl + ">" // Icon
	        wf += "</p>" // Closing paragraph tag
	        wf += "</div>"
	      });
	      $("#swiper-wrapper").html(wf);
	  }
	});
</script>
</html>