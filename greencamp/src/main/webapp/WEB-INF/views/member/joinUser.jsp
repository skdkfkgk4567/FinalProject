<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/httpRequest.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.footer
{
	margin-top: 658px;
}
.joincontainer {
	margin: auto;
	width: 600px;
	padding-top: 30px;
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
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="joincontainer">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" name="joinUserComplete" action="joinUserComplete.pi">
					<div class="mb-3">
						<label for="id">아이디</label><br><input type="text"
							class="form-control" id="id"  name="id" placeholder="" value="" required>
						<div class="invalid-feedback">ID를 입력해주세요.</div>
						<div><input type="button" value="중복확인" onclick="idCheck()"></div>
						<div id="msg"></div>
					</div>
					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" name="nm" placeholder="" value="" required>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					
					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="text"
							class="form-control" id="password" name="password" placeholder="" value=""
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="password2">비밀번호 확인</label> <input type="text"
							class="form-control" id="password2" name="password2" placeholder="" value=""
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="ncnm">별명</label> <input type="text"
							class="form-control" id="ncnm" name="ncnm" placeholder="" value="" required>
						<div class="invalid-feedback">별명을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="email" id="email" placeholder="example@example.com"
							required>
						<div class="invalid-feedback" id="checkEmail"></div>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="telno">전화번호</label> <input type="tel"
							class="form-control" name="telno" id="telno" placeholder="예)010-0000-0000"
							required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13">
						<div class="invalid-feedback">전화번호를 입력해주세요.</div>
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<input type="hidden" value="3" name="grade"> <input
						type="hidden" value="0" name="bizrno">
					<input type="submit" value="회원가입" class="joinbtn btn-primary btn-lg btn-block">
				</form>
			</div>
		</div>

	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
    function validateEmail(email)
    {
        var emailReg = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
        return emailReg.test(email);
    }
    
    
    function autoHypenTel(str)
    {
    	  str = str.replace(/[^0-9]/g, '');
    	  var tmp = '';

    	  if (str.substring(0, 2) == 02)
    	  {
    	    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
    	    if (str.length < 3)
    	    {
    	      return str;
    	    }
    	    else if (str.length < 6)
    	    {
    	      tmp += str.substr(0, 2);
    	      tmp += '-';
    	      tmp += str.substr(2);
    	      return tmp;
    	    }
    	    else if (str.length < 10)
    	    {
    	      tmp += str.substr(0, 2);
    	      tmp += '-';
    	      tmp += str.substr(2, 3);
    	      tmp += '-';
    	      tmp += str.substr(5);
    	      return tmp;
    	    }
    	    else
    	    {
    	      tmp += str.substr(0, 2);
    	      tmp += '-';
    	      tmp += str.substr(2, 4);
    	      tmp += '-';
    	      tmp += str.substr(6, 4);
    	      return tmp;
    	    }
    	  }
    	  else
    	  {
    	    // 핸드폰 및 다른 지역 전화번호 일 경우
    	    if (str.length < 4)
    	    {
    	      return str;
    	    }
    	    else if (str.length < 7)
    	    {
    	      tmp += str.substr(0, 3);
    	      tmp += '-';
    	      tmp += str.substr(3);
    	      return tmp;
    	    }
    	    else if (str.length < 11)
    	    {
    	      tmp += str.substr(0, 3);
    	      tmp += '-';
    	      tmp += str.substr(3, 3);
    	      tmp += '-';
    	      tmp += str.substr(6);
    	      return tmp;
    	    }
    	    else
    	    {
    	      tmp += str.substr(0, 3);
    	      tmp += '-';
    	      tmp += str.substr(3, 4);
    	      tmp += '-';
    	      tmp += str.substr(7);
    	      return tmp;
    	    }
    	  }

    	  return str;
    	}
    $('#telno').keyup(function (event)
    	{
    	  event = event || window.event;
    	  var _val = this.value.trim();
    	  this.value = autoHypenTel(_val);
    	});
    $('#email').keyup(function (event)
        	{
    			var checkEmail = document.getElementById("checkEmail");
        	  	event = event || window.event;
        	  	var _val = this.value.trim();
        	  	if(validateEmail(_val)){
        	  	}
        	  	else
        	  	{

        	  		checkEmail.innerText = "이메일 형식이 안 맞습니다.";
        	  	}
        	});
    function idCheck() {
    	var e_id = document.getElementById("id").value;
    	sendXHR('idCheck.pi?id='+e_id, null, idResult,'GET');
    }
    function idResult() {
    	if(XHR.readyState == 4){
    		if(XHR.status == 200){
    			var data = XHR.responseText;
    			document.all.msg.innerHTML = data;
    		}
    	}
    }
  </script>
</body>
</html>