<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 200px;
	    height: 30px;
	    margin-left: 40%;
	    margin-bottom: 1%;
	    border: 1px solid black;
	}
	#body{
		position: absolute;
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 1000px;
	    height: 900px;
	}
#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
}

.subject {
	border: 1px solid;
	width: 300px;
	margin: auto;
}

h3 {
	margin: 5px;
}

div {
	text-align: center;
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
	background-color: #94a7be;
	color: white;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>
<div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
	<div id="main">
		<div class="subject">
			<h3>회원 정보 수정</h3>
		</div>
		<form action="memUpdate" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" id="id" name="id" value="${sessionScope.loginId}" readonly /> </td>
				</tr>
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" value="${dto.name}"/></td>
				</tr>
				<tr>
					<td id="title">휴대폰</td>
					<td><input type="text" name="phone" value="${dto.phone}" /></td>
				</tr>
				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="email" value="${dto.email}" /></td>
				</tr>
			</table>
					<button class="find_button">수정</button>
		</form>
		<div>
			<a href="myLib_UpdatePwForm">비밀번호 변경하기</a>
		</div>
		<button class="find_button" onclick="location.href='myLib_Update'">취소</button>
		</div>
</body>
<script>
var msg = "${msg}"; 
if (msg != "") {  
	alert(msg); 
}
</script>
</html>