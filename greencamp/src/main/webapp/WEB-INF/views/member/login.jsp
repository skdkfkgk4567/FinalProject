<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="assets/js/httpRequest.js"></script>

<style>
.footer
{
	margin-top: 658px;
}
.joincontainer {
	margin: auto;
	width: 600px;
	padding-top: 30px;
	margin-top:150px;
}

body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}
.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
#id
{
	float: left;
}
.checkId {
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.checkId:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}
h2{
text-align:center;
}

</style>


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="joincontainer">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h2 class="mb-3">로그인</h2>
				<form class="validation-form" novalidate action="loginsubmit.pi">
					
					<div class="mb-3">
						<label for="id">아이디</label><br><input type="text"
							class="form-control" id="id" name="id" placeholder="" value="" required>
						<div class="invalid-feedback">ID를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="password" name="password" placeholder="" value=""
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
										<button class="joinbtn btn-primary btn-lg btn-block" type="submit">로그인</button>
				</form>
			</div>
		</div>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>