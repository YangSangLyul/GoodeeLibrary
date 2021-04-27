<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.main {
	width: 445px;
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

#find_content {
	width: 500px;
}

input[type="password"] {
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
		<h3>비밀번호 재설정</h3>
		<hr />
		<div id="find_img">
			<img src="./image/lock.png">
		</div>
		<div id="find_content">
			<span class="what"><b style="color: #0070c0">${findId}</b> 님의
				새로운 비밀번호를 입력해주세요</span> <br />
			<form action="newPw" method="POST">
				<table id="findFields">
					<tr>
						<td id="title">비밀번호</td>
						<td><input type="password" name="newPw" id="newPw" placeholder="비밀번호를 입력해주세요." /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" name="pwChk" id="pwChk" placeholder="비밀번호를 다시 입력해주세요." />
						<br />
						<span class="check_pw"></span>
						</td>
					</tr>
				</table>
				<button class="find_button" >확인</button>
			</form>
		</div>
		</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

//비밀번호 일치 확인
$('#pwChk').keyup(function(){
    if($(this).val()!==$('#newPw').val()){
        $('.check_pw').html('비밀번호가 일치하지 않습니다!');
        $('.check_pw').css({'color':'red','font-size':'15px','font-weight':'600'});
    }else{
        $('.check_pw').html('');
    }
});
</script>
</html>