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
	padding-top: 10%;
	padding-left: 10%;
}
.chart {
	float: left;
	width: 33.33%;
	height: 230px;
	text-align: center;
}

.chart span.title {
	position: relative;
	display: block;
	width: 100%;
	text-align: center;
	top: 110px;
}

.label {
	text-align: center;
	color: #333;
	font-weight: 100;
	font-size: 1.2em;
	margin-bottom: 0.3em;
}

.b-skills {
	border-top: 1px solid #f9f9f9;
	padding-top: 46px;
	text-align: center;
}

.b-skills:last-child {
	margin-bottom: -30px;
}

.b-skills h2 {
	margin-bottom: 50px;
	font-weight: 900;
	text-transform: uppercase;
}

.skill-item {
	position: relative;
	max-width: 180px;
	width: 100%;
	margin-bottom: 30px;
	color: #555;
}

.chart-container {
	position: relative;
	width: 100%;
	height: 0;
	padding-top: 100%;
	margin-bottom: 27px;
}

.skill-item .chart, .skill-item .chart canvas {
	position: absolute;
	top: 0;
	left: 0;
	width: 100% !important;
	height: 100% !important;
}

.skill-item .chart:before {
	content: "";
	width: 0;
	height: 100%;
}

.skill-item .chart:before, .skill-item .percent {
	display: inline-block;
	vertical-align: middle;
}

.skill-item .percent {
	position: relative;
	line-height: 1;
	font-size: 40px;
	font-weight: 900;
	z-index: 2;
}

.skill-item  .percent:after {
	content: attr(data-after);
	font-size: 20px;
}

p {
	font-weight: 900;
	text-align: center;
	color:white;
}

.allchart {
	left: 5%;
	padding-top: 5%;
	width: 60vw;
	height: 30vh;
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