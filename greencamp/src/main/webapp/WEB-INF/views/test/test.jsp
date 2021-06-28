<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.metroui.org.ua/v4.3.2/css/metro-all.min.css">
<script src="https://cdn.metroui.org.ua/v4/js/metro.min.js"></script>
<style>
/*
.goodscontent{
	display: flex;
	flex-direction:row;
	flex-wrap: nowrap;
	justify-content: space-between;
}
.goodstype{
	width: 1%;
}
.goodstype ul{
	list-style: none;
	margin: 40px 0 0 0;
	padding: 0;
}
.goodslist{
	width: 44%;
	height: 40vw;
}
.goodscard{
	overflow: auto;
	margin: 0px auto;
	position: relative;
	height: 30vw;
}
.goodswrite {
	margin:30px;
}
.goodsinfo{
	width: 55%;
	overflow: auto;
	height: 40vw;
}
.col {
	width: 250px;
	position: relative;
	overflow: hidden;
	border-radius: 5px;
	background: #fff;
}
.goodstype span{
	margin-top: 10px
}
.goodswidth {
    cursor: col-resize;
    width: 5px;
}
*/
/*--------------------------글쓰기 css시작------------------------------*/
body input[id="btn_goodsadd"]{display: none;}
.goodsadd {width: 50%;height: 70%;background: gray;position: fixed;
top:150%;left:25%;z-index: 2;transition: all .35s;opacity: 90%;}
.goodsadd li{list-style: none;}
.goodsaddbackground {position: fixed;top: 0;left: 0;width: 100%;height: 100%;
background: rgba(0,0,0,.3);transition: all .35s;opacity: 0;visibility: hidden;z-index: 1;}
body input[id="btn_goodsadd"]:checked + label + div{top: 15%;visibility: visible;}
body input[id="btn_goodsadd"]:checked ~ .goodsaddbackground{opacity:1;visibility: visible;}
/*--------------------------글쓰기 css끝------------------------------*/
</style>
</head>
<body>
<input type="checkbox" id="btn_goodsadd">
<label for="btn_goodsadd">
	글쓰기
</label>
<div class="goodsadd">
	<table>
		<tbody>
		<tr class="admin_line ">
			<td class="td1">구분 <span>*</span></td>
			<td class="td2">
				<ul class="catmenu">
					<li><a href="javascript:;" title="1" class="mcategory ">팝니다</a></li>
					<li><a href="javascript:;" title="2" class="mcategory ">삽니다</a></li>
				</ul>
			</td>
		</tr>
		<tr>
			<td class="td1">제목 <span>*</span></td>
			<td class="td2">
				<input type="text" name="subject" id="ytsubject" value="" class="input subject" maxlength="60" style="width:100%">
			</td>
		</tr>
		<tr class="admin_line ">
			<td class="td1">거래방법 <span>*</span></td>
			<td class="td2">
				<input type="hidden" name="trade" id="trade_val" value="">
				<label><input type="checkbox" class="chk_trade" value="[1]">직거래</label>&nbsp;&nbsp;&nbsp;
				<label><input type="checkbox" class="chk_trade" value="[2]">택배거래</label>&nbsp;&nbsp;&nbsp;
				<label><input type="checkbox" class="chk_trade" value="[3]">흥정가능</label>
				<br>
			</td>
		</tr>
		<tr class="admin_line ">
			<td class="td1"><em id="price_text"></em> 금액 <span>*</span></td>
			<td class="td2">
				<input type="text" name="price" id="price" value="" class="input subject sale_price " style="width:300px;" maxlength="10" autocomplete="off">
				<span class="check">
				<label id="free_price_check"><input type="checkbox" id="free_price" name="free_price" value="1">무료나눔</label>
				</span>
				<p class="tipinfo koreavalue "><i class="fa fa-info-circle" aria-hidden="true"></i> <span id="koreavalue">금액은 원단위 숫자만 입력하세요.</span></p>
			</td>
		</tr>
		<tr class="admin_line ">
			<td class="td1">거래 위치등록 <span>*</span></td>
			<td class="td2">
				<div>
					<input type="button" onclick="Daum_Postcode_write()" value="주소 직접 입력" class="bbtn2 bbtn2-gray notoMedium" style="font-size:12px;height:30px;line-height:28px;width:140px"></div>
					<p class="tipinfo"><i class="fa fa-info-circle" aria-hidden="true"></i> 주소는 판매자, 구매자와의 거리를 표시하기 위해 필요합니다. (주소는 노출되지 않습니다.)</p>
		
					<div id="daumpostwrap" style="display:none;border:1px solid;width:500px;height:550px;max-height:550px;margin:5px 0;position:absolute;z-index:1000">
					<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
			</td>
		</tr>
		<tr class="admin_line ">
			<td class="td1"><em id="price_text"></em> 연락처 <span>*</span></td>
			<td class="td2">
				<input type="text" name="tel1" id="tel1" value="" class="input input-num-size" style="width:75px;" autocomplete="off" maxlength="3"> <span class="check"> - </span>
				<input type="text" name="tel2" id="tel2" value="" class="input input-num-size" style="width:102px;" autocomplete="off" maxlength="4"> <span class="check"> - </span>
				<input type="text" name="tel3" id="tel3" value="" class="input input-num-size" style="width:102px;" autocomplete="off" maxlength="4">
				<span class="check">
				<label><input type="radio" name="tel_open" value="1" checked="checked">전체공개</label>&nbsp;&nbsp;&nbsp;
				<label><input type="radio" name="tel_open" value="2">회원공개</label>
				</span>
			</td>
		</tr>
		<tr>
			<td class="td2 textbox" colspan="2">
				<input type="hidden" name="html" id="editFrameHtml" value="HTML">
				<textarea name="content" id="content_textarea" class="textaream" placeholder="내용을 입력하세요" style="visibility: hidden; display: none;"></textarea>
			</td>
		</tr>
	</tbody>
	</table>
</div>
<label for="btn_goodsadd" class="goodsaddbackground"></label>
<div data-role="splitter" class="h-100" data-split-sizes="30, 70">
    <div class="d-flex flex-justify-center flex-align-center">This is panel 1</div>
    <div class="d-flex flex-justify-center flex-align-center">This is panel 2</div>
</div>
<div class="card" style="width: 18rem;">
  <img src="..." class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<input type="text" data-role="materialinput"
data-label="User email" placeholder="Enter your email">

</body>
</html>