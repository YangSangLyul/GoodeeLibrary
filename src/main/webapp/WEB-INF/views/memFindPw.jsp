<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
}

h3 {
	text-align: center;
	color: #0070c0;
}

img {
	width: 160px;
	margin: 24px;
}

div {
	text-align: center;
}

.what {
	margin: 6px;
	font-size: 20px;
	color: gray;
}

#find_btn {
	margin-top: 20px;
}

input[type="text"] {
	width: 110%;
	height: 30px;
	padding: 5px;
	margin: 10px;
}

button {
	width: 100px;
	height: 40px;
	margin: 20px 5px;
	font-size: 15px;
	background-color: #c5d8f1;
	color: #0070c0;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="main">
		<h3>비밀번호 찾기</h3>
		<hr />
		<div id="find_img">
			<img src="./image/lock.png">
		</div>
		<form action="findPw" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." /></td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요." /></td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." /></td>
				</tr>
			</table>
		</form>
		<button class="find_button" onclick="findChk2()">확인</button>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

/* $(document).ready(function(){
	$("input[name=id]").keyup(function(event){ 
	if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		}
	});
}); */

function findChk2() {
	if($('#id').val() == '') {
		alert('아이디를 입력해 주세요.');
		$('#id').focus();
	}else if($('#name').val() == ''){
		alert('이름을 입력해 주세요.');
		$('#name').focus();
	}else if($('#email').val() == ''){
		alert('이메일을 입력해 주세요.');
		$('#email').focus();
	}else{
		$('form').submit();
	}
}
</script>
</html>