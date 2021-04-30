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
	margin: 150px auto;
}

#loginTitle {
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
<jsp:include page="header.jsp"></jsp:include>
	<div class="main">
		<h2 id="loginTitle">로그인</h2>
		<hr />
		<form action="login" id="loginForm" name="loginForm" method="POST">
			<fieldset>
				<div id="inputFields">
					<p><input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." /></p>
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

$(document).ready(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#id").val(key); 
     
    if($("#id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
</html>