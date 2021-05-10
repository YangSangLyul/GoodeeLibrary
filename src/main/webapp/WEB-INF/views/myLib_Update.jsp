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
	margin: -150px auto;
}

.subject {
    border: 1px solid lightgray;
    width: 354px;
    margin: 20px auto;
    padding: 5px 24px;
    background-color: #e8ecf4;
}

#myinfo {
	margin: 10px;
	font-size: 16px;
	text-align: center;
	font-weight: 600;
}

#findFields{
	margin : auto;
}

input[type="password"] {
	width: 95%;
	height: 30px;
	padding: 5px;
	margin: 10px;
    background: #f8f7f7;
    border: 1px solid;
}

input[type="button"] {
	width: 100px;
	height: 40px;
	margin: 20px 5px;
	font-size: 15px;
	background-color: #e8ecf4;
	color: #0070c0;
	border: none;
	border-radius: 5px;
}

#mybtn{
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
	<div id="main">
		<div class="subject">
			<h3 id="myinfo">회원 정보 수정</h3>
		</div>
		<form name="form" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /></td>
				</tr>
				<tr>
					<td colspan="2" id="mybtn">
						<input type="button" value="수정" id="update"/>
						<input type="button" value="탈퇴" id="withdraw"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

$(document).ready(function() {
	$("#update").click(function() {
		if($("#pw").val()==""){
			 alert("비밀번호를 입력해주세요.");
		     $("#pw").focus();
		}else {
			$.ajax({
				type:'get'
				,url:'checkPw'
				,data: {"pw":$("#pw").val()}
				,dataType:'text'
				,success:function(data){
					console.log(data);
					if(data=="yes"){
						alert('비밀번호가 일치합니다. 회원정보 수정페이지로 이동합니다.');
						document.form.action = "myLib_UpdateForm";
						document.form.submit();
					}else{
						alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요');
						$("#pw").focus();
					}
				}
			});
		}
	});
});

$(document).ready(function() {
	$("#withdraw").click(function() {
		if($("#pw").val()==""){
			 alert("비밀번호를 입력해주세요.");
		     $("#pw").focus();
		}else {
			$.ajax({
				type:'get'
				,url:'checkPw'
				,data: {"pw":$("#pw").val()}
				,dataType:'text'
				,success:function(data){
					console.log(data);
					var returnValue = confirm('회원탈퇴시 회원님의 모든 정보가 사라지며 복구 할 수 없습니다. 그래도 탈퇴하시겠습니까?');
					if(data=="yes"){
						if(returnValue==true){
							document.form.action = "memWithdraw";
							document.form.submit();
						}
					}else{
						alert('비밀번호가 일치하지 않습니다. 다시 확인해주세요');
						$("#pw").focus();
					}
				}
			});
		}
	});
});

</script>
</html>