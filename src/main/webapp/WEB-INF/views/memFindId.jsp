<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.main {
	width: 400px;
	height: 300px;
	margin: 150px auto;
	text-align: center;
}

#loginTitle {
	text-align: center;
	color: #0070c0;
}

#find_img {
	width: 160px;
	margin: 24px;
}

input[type="text"] {
	width: 110%;
	height: 30px;
	padding: 5px;
	margin: 10px;
}

.find_button {
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
 <jsp:include page="header.jsp"></jsp:include>
	<div class="main">
		<h2 id="loginTitle">아이디 찾기</h2>
		<hr />
		<div>
			<img id="find_img" src="./image/lock.png">
		</div>
		<form action="findId" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요." /></td>
				</tr>
				<tr>
					<td id="title">휴대폰번호</td>
					<td><input type="text" name="phone" id="phone" placeholder="휴대폰번호를 입력해주세요." /></td>
				</tr>
			</table>
			</form>
		<button class="find_button" onclick="findChk()">확인</button>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

/* $(document).ready(function(){
	$("input[name=name]").keyup(function(event){ 
	if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[0-9]/gi,''));
		}
	});
}); */

$(document).ready(function(){
	$("input[name=phone]").keyup(function(event){ 
	if (!(event.keyCode >=37 && event.keyCode<=40)) {
		var inputVal = $(this).val();
		$(this).val(inputVal.replace(/[^0-9-]/gi,''));
		}
	});
});

function findChk() {
	if($('#name').val() == '') {
		alert('이름을 입력해 주세요.');
		$('#name').focus();
	}else if($('#phone').val() == ''){
		alert('휴대폰 번호를 입력해 주세요.');
		$('#phone').focus();
	}else{
		$('form').submit();
	}
}
</script>
</html>