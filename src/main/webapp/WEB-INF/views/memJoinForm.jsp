<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.main {
	width: 600px;
	height: 300px;
	margin: 200px auto;
}

h2 {
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

input[type="button"],input[type="submit"] {
	width: 50%;
	height: 50px;
	margin-top: 15pX;
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
	<div class="main">
		<h2>회원가입</h2>
		<hr />
		<form action="join" method="POST">
		<fieldset>
			<table id="inputFields">
				<tr>
					<th id="title"><label>아이디</label></th>
					<td>
						<input type="text" name="userId" value="" id="userId" placeholder="아이디를 입력해주세요." /> 
						<input type="button" id="overlay" value="중복 확인" />
					</td>
				</tr>
				<tr>
					<th id="title"><label>비밀번호</label></th>
					<td>
						<input type="password" name="userPw" value="" id="userPw" placeholder="비밀번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th id="title"><label>비밀번호 확인</label></th>
					<td>
						<input type="password" name="userPwchk" value="" id="userPwchk" placeholder="비밀번호를 다시 입력해주세요." /> 
						<br /> 
						<span></span>
					</td>
				</tr>
				<tr>
					<th id="title"><label>이름</label></th>
					<td>
						<input type="text" name="name" value="" id="name" placeholder="휴대폰번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th id="title"><label>이메일</label></th>
					<td>
						<input type="text" name="email" value="" id="email" placeholder="이메일을 입력해주세요." /> 
						<br /> <span></span>
					</td>
				</tr>
				<tr>
					<th id="title"><label>핸드폰</label></th>
					<td>
						<input type="text" name="phone" value="" id="phone" placeholder="핸드폰번호를 입력해주세요." />
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="submit" value="회원가입" />
					</td>
				</tr>
			</table>
		</fieldset>
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