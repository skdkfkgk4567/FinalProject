<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<script type="text/javascript" src="assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="assets/js/common.js"></script>

<title>그린캠프</title>
<meta content="" name="description">
<meta content="" name="keywords">

<style>
.container2
{
	padding-top: 10% !important;
	padding-left: 10% !important;
}
.chart {
	float: left !important;
	width: 33.33% !important;
	height: 230px !important;
	text-align: center !important;
}

.chart span.title {
	position: relative !important;
	display: block !important;
	width: 100% !important;
	text-align: center !important;
	top: 110px !important;
}

.label {
	text-align: center !important;
	color: #333 !important;
	font-weight: 100 !important;
	font-size: 1.2em !important;
	margin-bottom: 0.3em !important;
}

.b-skills {
	border-top: 1px solid #f9f9f9 !important;
	padding-top: 46px !important;
	text-align: center !important;
}

.b-skills:last-child {
	margin-bottom: -30px !important;
}

.b-skills h2 {
	margin-bottom: 50px !important;
	font-weight: 900 !important;
	text-transform: uppercase !important;
}

.skill-item {
	position: relative !important;
	max-width: 180px !important;
	width: 100% !important;
	margin-bottom: 30px !important;
	color: #555 !important;
}

.chart-container {
	position: relative !important;
	width: 100% !important;
	height: 0 !important;
	padding-top: 100% !important;
	margin-bottom: 27px !important;
}

.skill-item .chart, .skill-item .chart canvas {
	position: absolute !important;
	top: 0 !important;
	left: 0 !important;
	width: 100% !important;
	height: 100% !important;
}

.skill-item .chart:before {
	content: "" !important;
	width: 0 !important;
	height: 100% !important;
}

.skill-item .chart:before, .skill-item .percent {
	display: inline-block !important;
	vertical-align: middle !important;
}

.skill-item .percent {
	position: relative !important;
	line-height: 1 !important;
	font-size: 40px !important;
	font-weight: 900 !important;
	z-index: 2 !important;
}

.skill-item  .percent:after {
	content: attr(data-after) !important;
	font-size: 20px !important;
}

p {
	font-weight: 900 !important;
	text-align: center !important;
	color:white !important;
}

.allchart {
	left: 5% !important;
	padding-top: 5% !important;
	width: 60vw !important;
	height: 30vh !important;
}
.mainwrap
{
	
	margin: auto;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp"></jsp:include>
	</header>

	<section id="hero" class="d-flex align-items-center">
		<jsp:include page="bsnmsidebar.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
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
							<div class="chart " data-percent="100" data-bar-color="green">
								<span class="percent" data-after="%">100</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">전체</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart " data-percent="30" data-bar-color="yellow">
								<span class="percent" data-after="%">30</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">오지캠핑</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart " data-percent="48" data-bar-color="red">
								<span class="percent" data-after="%">48</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">카라반/차박</p>
					</div>
					<div class="skill-item center-block">
						<div class="chart-container">
							<div class="chart " data-percent="22" data-bar-color="blue">
								<span class="percent" data-after="%">22</span>
								<canvas height="150" width="150"></canvas>
							</div>
						</div>
						<p id="label">유료캠핑</p>
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
				animate : 2000, // 그려지는 시간 
				onStart : $.noop,
				onStop : $.noop
			});

		</script>
	</section>
</body>
</html>