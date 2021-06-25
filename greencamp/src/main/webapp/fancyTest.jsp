<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My page</title>
<style type="text/css">
#hidden-content-2 {
    /* Custom styling */
		max-width: 550px;
		padding: 10px 30px 30px 30px;
		border-radius: 4px;
  
    /* Custom transition - fade from top*/
		opacity: 0;
    transform: translateY(-50px);
    transition: all .3s;
	}

	.fancybox-slide--complete #hidden-content-2 {
		opacity: 1;
		transform: translateY(0);
	}
</style>
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css">
</head>
<body>

	<!-- Your HTML content goes here -->

	<div style="display: none;" id="hidden-content-2">
		<h2>Hello!</h2>
		<p>This is animated content! Cool, right?</p>
	</div>
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
</body>
</html>