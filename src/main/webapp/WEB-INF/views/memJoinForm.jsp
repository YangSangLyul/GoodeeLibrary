<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.main {
	width: 600px;
	height: 650px;
	margin: 150px auto 0;
}

#loginTitle {
	text-align: center;
	color: #0070c0;
}

#inputFields {
	width: 600px;
	height: 500px;
	margin: auto;
}

input[type='text'], input[type='password'] {
	width: 300px;
	height: 30px;
	padding: 3px;
}

span {
	font-size: 10pt;
}

fieldset {
	border: none;
}

.join {
	width: 30%;
	height: 50px;
	margin: 5pX 200px 0 200px;
	font-size: 20px;
	background-color: #c5d8f1;
	color: #0070c0;
	border: none;
}

#overlay {
	width: 100px;
	height: 40px;
	margin: 0px 5px;
	font-size: 15px;
	background-color: #c5d8f1;
	color: #0070c0;
	border: none;
	border-radius: 5px;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="main">
		<h2 id="loginTitle">회원가입</h2>
		<hr />
		<form action="join" method="POST">
		<fieldset>
			<table id="inputFields">
				<tr>
					<th id="title"><label>아이디</label></th>
					<td>
						<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." /> 
						<input type="button" id="overlay" value="중복 확인" />
					</td>
				</tr>
				<tr>
					<th id="title"><label>비밀번호</label></th>
					<td>
						<input type="password" name="userPw" id="userPw" placeholder="비밀번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th id="title"><label>비밀번호 확인</label></th>
					<td>
						<input type="password" name="userPwchk" id="userPwchk" placeholder="비밀번호를 다시 입력해주세요." /> 
						<br /> 
						<span class="span_pw"></span>
					</td>
				</tr>
				<tr>
					<th id="title"><label>이름</label></th>
					<td>
						<input type="text" name="name" id="name" placeholder="휴대폰번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th id="title"><label>핸드폰</label></th>
					<td>
						<input type="text" name="phone" id="phone" maxlength="13" placeholder="핸드폰번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th id="title"><label>이메일</label></th>
					<td>
						<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." /> 
						<br /> 
						<span class="span_email"></span>
					</td>
				</tr>
			</table>
		</fieldset>
		</form>
			<button class="join" onclick="joinChk()">회원가입</button>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

//아이디 중복 확인
$("#overlay").click(function() {
	if($('#userId').val() == '') {
		alert('ID를 입력해 주세요.');
	}else{
	$.ajax({
		type:'get'
		,url:'memOverlay'
		,data: {"id":$("#userId").val()}
		,dataType:'text'
		,success:function(data){
			console.log(data);
			if(data=="yes"){
				alert('사용할 수 있는 아이디입니다.');
				$("#overlay").css({color:'black'});
			}else{
				alert('이미 사용중인 아이디입니다.');
				$("#userId").val('');
			}
		}
	});
	}
});

//비밀번호 일치 확인
$('#userPwchk').keyup(function(){
    if($(this).val()!==$('#userPw').val()){
        $('.span_pw').html('비밀번호가 일치하지 않습니다!');
        $('.span_pw').css({'color':'red','font-size':'15px','font-weight':'600'});
    }else{
        $('.span_pw').html('비밀번호가 일치합니다.');
        $('.span_pw').css({'color':'green','font-size':'15px','font-weight':'600'});
    }
});

//이메일 유효성 검사
$('#email').keyup(function(){
    if($(this).val().indexOf('@')<0 || ($(this).val().indexOf('.')<0)){
        $('.span_email').html('이메일 형식이 올바르지 않습니다(@와 .을 확인해주세요)');
        $('.span_email').css({'color':'red','font-size':'15px','font-weight':'600'});
    }else{
        $('.span_email').html('');
    }
});

 //휴대폰번호 자동하이픈
/*$('#phone').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this);
      if (key !== 8 && key !== 9) {
          if ($text.val().length == 3) {
              $text.val($text.val() + '-');
          }
          if ($text.val().length == 8) {
              $text.val($text.val() + '-');
          }
      }
      return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
}); */

//회원가입 버튼 클릭 시 유효성 체크 실시
function joinChk() {
	var $id = $("#userId");
	var $pw = $("#userPw");
	var $pwChk = $("#userPwchk");
	var $name = $("#name");
	var $phone = $("#phone");
	var $email = $("#email");
	
		if($id.val()==''){
			alert('아이디를 입력해 주세요');
			$id.focus();
		}else if($pw.val()==''){
			alert('비밀번호를 입력해 주세요');
			$pw.focus();
		}else if($pw.val()!=$pwChk.val()){
			alert('비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요');
			$pwChk.focus();
		}else if($name.val()==''){
			alert('이름을 입력해 주세요');
			$name.focus();
		}else if($phone.val()==''){
			alert('휴대폰번호를 입력해 주세요');
			$phone.focus();
		}else if($email.val()==''){
			alert('이메일을 입력해 주세요');
			$email.focus();
		}else{
			$('form').submit();
		}
}

</script>
</html>