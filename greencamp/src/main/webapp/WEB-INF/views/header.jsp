<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link type="text/css" href="assets/css/header.css" rel="stylesheet">
<link type="text/css" href="assets/css/fancy.css" rel="stylesheet">
<style type="text/css">
#hidden-content-2 {
	/* Custom styling */
	max-width: 1200px;
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

.btn {
	padding: 0px;
	width: 56px;
	height: 20px;
}
</style>
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css">

</head>
<style>
body {
	background-color: black;
}
</style>

<body>
	<div id="topbar" class="d-none d-lg-flex align-items-center fixed-top ">
		<div class="container d-flex">
			<div class="contact-info mr-auto"></div>
			<div class="social-links">
				<a href="index.pi" class="home">HOME</a> <a href="notice.pi?ctgry=공지사항" class="notice">공지사항</a>
				<c:set var="user_ncnm" value="${sessionScope.user_ncnm}"></c:set>
				<c:choose>
					<c:when test="${empty user_ncnm}">
				<a href="joinSelect.pi" class="joinMember">회원가입</a> 
				<a href="login.pi" class="login">로그인</a>
					</c:when>
					<c:otherwise>
					<a>${user_ncnm }님 환영합니다.</a>
					<a href="logout.pi">로그아웃</a>
					
					</c:otherwise>
				</c:choose>
				
				
				
				<a href="#" class="contact">고객센터</a>
			</div>
		</div>
	</div>
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo mr-auto">
				<a href="index.pi">그린캠프</a>
			</h1>

			<nav class="nav-menu d-none d-lg-block" style="width: 800px">
				<ul>
					<li class="active"><a href="index.pi">홈으로</a></li>
					<li><a data-fancybox data-src="#hidden-content-2"
						href="javascript:;" class="btn">테마검색</a></li>
					<li><a href="searchCamp.pi?k=all">전체검색</a></li>
					<li><a href="goods.pi">중고거래</a></li>
          					<li><a href="listCampInfo.pi?ctgry=캠핑팁">캠핑정보</a></li>
          					<li><a href="camptalk.pi?ctgry=가입인사">캠핑톡</a></li>
				</ul>
			</nav>
		</div>
		<div style="display: none;" id="hidden-content-2">
			<div id="themesearch" class="fancybox-content">
				<div class="theme_header">
					<h2 class="fl">테마검색</h2>
					<div class="fl">
						원하는 캠핑 스타일을 선택 후 상단우측 또는 하단 검색버튼을 클릭하세요.<br> 많은 옵션을 선택하면 검색
						결과를 기대할 수 없습니다.
					</div>
				</div>

				<h3 class="btopnone">
					자연환경 <span class="text-right fr">자연환경은 2개 까지 선택 가능합니다.</span>
				</h3>
				<div class="nature iconbox">
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[강변]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/19.svg"
							class="svg" width="40" height="40" alt="강변">
							<p>강변</p>
						</a>
					</div>
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[계곡]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/16.svg"
							class="svg" width="40" height="40" alt="계곡">
							<p>계곡</p>
						</a>
					</div>
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[농촌]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/25.svg"
							class="svg" width="40" height="40" alt="농촌">
							<p>농촌</p>
						</a>
					</div>
					<br>
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[바다]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/15.svg"
							class="svg" width="40" height="40" alt="바다">
							<p>바다</p>
						</a>
					</div>
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[산]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/21.svg"
							class="svg" width="40" height="40" alt="산">
							<p>산</p>
						</a>
					</div>
					<div class="facbox">
						<a href="javascript:;" class="alist naturelist " title="[호수]"> <img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/nature/28.svg"
							class="svg" width="40" height="40" alt="호수">
							<p>호수</p>
						</a>
					</div>
				</div>

				<h3 class="btopnone">
					편의시설 및 환경 <span class="text-right fr">편의시설 및 환경은 5개 까지 선택
						가능합니다.</span>
				</h3>
				<div class="facilities iconbox">
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[개수대]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/279.svg"
							class="svg" width="40" height="40" alt="개수대">
							<p>개수대</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[동계캠핑]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/281.svg"
							class="svg" width="40" height="40" alt="동계캠핑">
							<p>동계캠핑</p>
						</a>
					</div>
					<div class="facbox">
						<a href="javascript:;" class="alist facilitieslist " title="[등산]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/fun/14.svg"
							class="svg" width="40" height="40" alt="등산">
							<p>등산</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[매점]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/220.svg"
							class="svg" width="40" height="40" alt="매점">
							<p>매점</p>
						</a>
					</div>
					<br>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[반려동물동반]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/223.svg"
							class="svg" width="40" height="40" alt="반려동물동반">
							<p>반려동물동반</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[샤워시설]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/278.svg"
							class="svg" width="40" height="40" alt="샤워시설">
							<p>샤워시설</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[수세식화장실]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/225.svg"
							class="svg" width="40" height="40" alt="수세식 화장실">
							<p>수세식화장실</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[온라인예약]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/226.svg"
							class="svg" width="40" height="40" alt="온라인예약">
							<p>온라인예약</p>
						</a>
					</div>
					<br>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[온수제공]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/282.svg"
							class="svg" width="40" height="40" alt="온수제공">
							<p>온수제공</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[와이파이]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/260.svg"
							class="svg" width="40" height="40" alt="와이파이">
							<p>와이파이</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[장작판매]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/274.svg"
							class="svg" width="40" height="40" alt="장작판매">
							<p>장작판매</p>
						</a>
					</div>
					<div class="facbox ccat2">
						<a href="javascript:;" class="alist facilitieslist " title="[전기]">
							<img
							src="https://www.5gcamp.com/modules/camping/theme/_pc/default/image/facilities/280.svg"
							class="svg" width="40" height="40" alt="전기">
							<p>전기</p>
						</a>
					</div>
				</div>
				<form action="searchTheme.pi" name="themesearch" method="get"
					onsubmit="return searchCheck(this);">
					<fieldset>
						<input type="hidden" id="facilities_uid" name="facilities"
							value=""> <input type="hidden" id="nature_uid"
							name="nature" value="">
					</fieldset>
					<button type="submit"
						class="btn_submit1 bbtn2 bbtn2-blue notoMedium">
						<i class="fa fa-search" aria-hidden="true"></i> 테마검색
					</button>
				</form>
			</div>
		</div>
		<!-- JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js"></script>
	</header>
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script style="display: none;">
		var category_uid = $('#category_uid');
		$('.categorylist').click(
				function() {
					if ($(this).hasClass('active')) {
						$(this).removeClass('active');
						category_uid.val(category_uid.val().replace(
								$(this).attr('title'), ''));
					} else {
						$(this).addClass('active');
						category_uid.val(category_uid.val()
								+ $(this).attr('title'));
					}

					if (category_uid.val().indexOf('[1]') != -1) {
						$('.facbox.ccat1').css('display', 'inline-block');
					} else {
						$('.facbox.ccat1').hide();
					}
					if (category_uid.val().indexOf('[3]') != -1) {
						$('.facbox.ccat3').css('display', 'inline-block');
					} else {
						$('.facbox.ccat3').hide();
					}

				});

		var nature_uid = $('#nature_uid');
		$('.naturelist').click(
				function() {
					if (nature_uid.val().indexOf($(this).attr('title')) == -1) {
						var temp = nature_uid.val();
						var count = (temp.match(/\[/g) || []).length;
						if (count + 1 > 2) {
							alert('2개만 선택 가능합니다.');
							return false;
						}
					}

					if ($(this).hasClass('active')) {
						$(this).removeClass('active');
						nature_uid.val(nature_uid.val().replace(
								$(this).attr('title'), ''));
					} else {
						$(this).addClass('active');
						nature_uid
								.val(nature_uid.val() + $(this).attr('title'));
					}
				});
		var facilities_uid = $('#facilities_uid');
		$('.facilitieslist')
				.click(
						function() {
							if (facilities_uid.val().indexOf(
									$(this).attr('title')) == -1) {
								var temp = facilities_uid.val();
								var count = (temp.match(/\[/g) || []).length;
								if (count + 1 > 5) {
									alert('5개만 선택 가능합니다.');
									return false;
								}
							}
							if ($(this).hasClass('active')) {
								$(this).removeClass('active');
								facilities_uid.val(facilities_uid.val()
										.replace($(this).attr('title'), ''));
							} else {
								$(this).addClass('active');
								facilities_uid.val(facilities_uid.val()
										+ $(this).attr('title'));
							}
						});

		function searchCheck(f) {
			if (f.facilities.value == '' && f.fun.value == ''
					&& f.nature.value == '') {
				alert('테마 항목을 1개 이상 선택해주세요.');
				return false;
			}
			f.submit();
		}
	</script>
</body>
</html>