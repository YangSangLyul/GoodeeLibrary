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
	font-weight: 600;
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

.idSaveCheck{
	float: left;
	margin : -5px 0 20px 10px;
	font-size: 15px;
}
</style>
</head>
<body>
	<div class="main">
		<h2>로그인</h2>
		<hr />
		<form action="login" id="loginForm" name="loginForm" method="POST">
			<fieldset>
				<div id="inputFields">
					<p><input type="text" name="id" value="" placeholder="아이디를 입력해주세요." /></p>
					<p><input type="password" name="pw" value="" placeholder="비밀번호를 입력해주세요." /></p>
					<p><input type="submit" id="login" value="로그인" /></p>
					<p class="idSaveCheck"><input type="checkbox" id="idSaveCheck" />아이디 기억하기</p>
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

 $(function() {
	//쿠키값 가져오기
	var cookie_id = getLogin(); 
	
	if(cookie_id !=""){
		$("#id").val(cookie_id);
		$("#idSaveCheck").attr("checked",true);
	}
	
	$("#idSaveCheck").on("click",function(){
		var _this = this;
		var isSave;
		if($(_this).is(":checked")){
			isSave = confirm("아이디 기억");
		}
	});
	
	$("#login").on("click",function(){
		if($("#idSaveCheck").is(":checked")){
			saveLogin($("#virtual_id").val());
		}else{
			saveLogin("");
		}
	});
});

function saveLogin(id) {
	if(id!=""){
		setSave("userId",id,7);
	}else{
		setSave("userId",id,-1);
	}
}

function setSave(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expirehours);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ todayDate.toGMTString() + ";"
}

function getLogin(){
	var cook = document.cookie+",";
	var idx = cook.indexOf("userId",0);
	var val = "";
	
	if(idx != -1){
		cook = cook.substring(idx,cook.length);
		begin = cook.indexOf("=",0)+1;
		end = cook.indexOf(",",begin);
		val = unescape(cook.substring(begin,end));
	}
	return val;
} 
</script>
</html>