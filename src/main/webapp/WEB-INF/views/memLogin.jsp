<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
.main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
}

h2 {
	text-align: center;
	color: #0070c0;
}

fieldset {
	border: none;
}

#inputFields {
	width: 100%;
	margin: 50px 0 15px;
	border: 1px #e4e4e5;
}

#etcFields {
	width: 65%;
	margin: auto;
}

input[type="text"], input[type="password"] {
	width: 90%;
	height: 30px;
	padding: 3px;
}

p {
	text-align: center;
}

input[type="submit"] {
	width: 93%;
	height: 50px;
	margin-top: 10px;
	font-size: 20px;
	background-color: #c5d8f1;
	color: #0070c0;
	border: none;
}

input[type="button"] {
	padding: 5px;
	border: none;
	background-color: white;
	color: gray;
}

.find {
	width: 150px;
	display: inline-block;
	margin: auto;
}

.join {
	width: 100px;
	display: inline-block;
	margin: auto;
}
</style>
</head>
<body>
	<div class="main">
		<h2>로그인</h2>
		<hr />
		<form action="login" method="POST">
			<fieldset>
				<div id="inputFields">
					<p><input type="text" name="id" value="" placeholder="아이디를 입력해주세요." /></p>
					<p><input type="password" name="pw" value="" placeholder="비밀번호를 입력해주세요." /></p>
					<p><input type="submit" value="로그인" /></p>
				</div>
			</fieldset>

			<div id="etcFields">
				<p class="find"><input type="button" value="아이디/비밀번호찾기" onclick="location.href='find'" /></p>
				<p class="join"><input type="button" value="회원가입" onclick="location.href='memJoinForm'" /></p>
			</div>
		</form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}
</script>
</html>