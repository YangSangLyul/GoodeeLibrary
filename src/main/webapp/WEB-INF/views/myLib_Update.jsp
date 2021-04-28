<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정/탈퇴 페이지</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
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
	background-color: #94a7be;
	color: white;
	border: none;
	border-radius: 5px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="mySidebar.jsp"/>
	<div id="main">
		<div class="subject">
			<h3>회원 정보 수정</h3>
		</div>
		<form action="mylib_mem" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /> 
					<br /> 
					<span></span>
					</td>
				</tr>
			</table>
		</form>
		<button class="find_button" id="update" onclick="location.href='myLib_UpdateForm'">수정</button>
		<button class="find_button" id="withdraw" onclick="location.href='memWithdraw'">탈퇴</button>
	</div>
</body>
<script>
var msg = "${msg}"; 
if (msg != "") {  
	confirm(msg); 
}

/* $("button").click(function(){
	 if($("#pw").val()==""){
	 	alert("비밀번호를 입력해주세요");
	 }else{
		 $("form").submit();
	} 
}); */

$("#update").click(function(){
	if($("#pw").val()==''){
		alert('비밀번호를 입력해주세요.');
   }else{
   	$.ajax({
			type:'get'
			,url:'"memUpdate"'
			,data: {"pw":$("#pw").val()}
			,dataType:'test'
			,success:function(data){
				console.log(data);
				if(data == true){//입력값이 맞다면
					alert("비밀번호 틀림");
				}else{
					alert('회원정보를 수정해주세요.');
					$("form").submit();
				}
			}
			,error:function(e){
				console.log(e);
			}
		});
   }
}); 
</script>
</html>