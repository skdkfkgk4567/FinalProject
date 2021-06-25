<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>그린캠프</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script>
	function searchKeyword() {
		var keyword = document.getElementById("search").value;
		location.href = 'searchCamp.pi?camp_nm=' + keyword;
	}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="hero" class="d-flex align-items-center">
		
		<div class="mainwrap d-flex flex-column">
			<div class="p-2">
				<div class="container2" data-aos="fade-up" data-aos-delay="500">
					<h1>그린캠프에 오신것을 환영합니다.</h1>
					<h2>양질의 컨텐츠만 제공해드리겠습니다.</h2>
					<form>
						<div class="input-group search-box">
							<input type="text" id="search" class="form-control"
								placeholder="검색어를 입력해주세요." style="width: 300px;">
							<div class="input-group-append">
								<input type="button" class="btn btn-primary" value="검색"
									onclick="searchKeyword()">
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="p-2">
				<div class="allchart d-flex justify-content-start">
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart" data-percent="100" data-bar-color="#23afe3">
								<span class="percent" data-after="%">100</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">HTML</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart2" data-percent="30" data-bar-color="#0000FF">
								<span class="percent" data-after="%">30</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">HTML</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart3" data-percent="50" data-bar-color="#000080">
								<span class="percent" data-after="%">50</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">HTML</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart4" data-percent="20" data-bar-color="#FF00FF">
								<span class="percent" data-after="%">20</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">HTML</p>
					</div>
				</div>
			</div>

		</div>


		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.easypiechart.js"></script>

		<script>
			$('.chart').easyPieChart({
				barColor : 'red', //차트가 그려질 색
				trackColor : '#ccc', // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
				scaleColor : '#fff', // 차트 테두리에 그려지는 기준선 (chart2	의 테두리 선)
				lineCap : 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
				lineWidth : 10, // 차트 선의 두께
				size : 200, // 차트크기
				animate : 1000, // 그려지는 시간 
				onStart : $.noop,
				onStop : $.noop
			});
			$('.chart2').easyPieChart({
				barColor : 'blue', //차트가 그려질 색
				trackColor : 'white', // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
				scaleColor : '#fff', // 차트 테두리에 그려지는 기준선 (chart2	의 테두리 선)
				lineCap : 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
				lineWidth : 10, // 차트 선의 두께
				size : 200, // 차트크기
				animate : 1000, // 그려지는 시간 
				onStart : $.noop,
				onStop : $.noop
			});
			$('.chart3').easyPieChart({
				barColor : 'green', //차트가 그려질 색
				trackColor : 'white', // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
				scaleColor : '#fff', // 차트 테두리에 그려지는 기준선 (chart2	의 테두리 선)
				lineCap : 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
				lineWidth : 10, // 차트 선의 두께
				size : 200, // 차트크기
				animate : 1000, // 그려지는 시간 
				onStart : $.noop,
				onStop : $.noop
			});
			$('.chart4').easyPieChart({
				barColor : 'yellow', //차트가 그려질 색
				trackColor : 'white', // 차트가 그려지는 트랙의 기본 배경색(chart1 의 회색부분)
				scaleColor : '#fff', // 차트 테두리에 그려지는 기준선 (chart2	의 테두리 선)
				lineCap : 'butt', // 차트 선의 모양 chart1 butt / chart2 round / chart3 square
				lineWidth : 10, // 차트 선의 두께
				size : 200, // 차트크기
				animate : 1000, // 그려지는 시간 
				onStart : $.noop,
				onStop : $.noop
			});
		</script>
	</section>
</body>
</html>