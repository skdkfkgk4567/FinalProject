<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assets/css/detail.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<link href="css/main.min.css" rel="stylesheet">
<script src="js/main.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="assets/css/splitter.css" />
<link rel="stylesheet" type="text/css" href="assets/css/scroll.css" />
<link rel="stylesheet" type="text/css"
	href="assets/css/searchResult.css" />
<link rel="stylesheet" href="assets/css/list.css">
<script type="text/javascript" src="assets/js/splitter.min.js"></script>
<link href="css/main.min.css" rel="stylesheet">
<script src="js/main.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="assets/css/resveCamp.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="maincontent">
		<h1>${camp_name }</h1>
		<div class="listwrap">
				<div id="leftContent">
					<jsp:include page="picker/picker.jsp"></jsp:include>
				</div>
				<div id="rightContent">
					<div id="campList">
						<div id="siteList">
						</div>
					</div>
				</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>