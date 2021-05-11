<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 - 비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
}

.subject {
    border: 1px solid lightgray;
    width: 440px;
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
    width: 110%;
    height: 39px;
    padding: 16px;
    margin: 10px;
    background: #f8f7f7;
    border: 1px solid;
}

#mybtn{
	width: 100px;
	height: 40px;
	margin: 20px 5px;
	font-size: 15px;
	background-color: #e8ecf4;
	color: #0070c0;
	border: none;
	border-radius: 5px;
	text-align: center;
}

#title{
	padding: 10px;
}

#btnbox{
	width: 57%;
    margin: auto;
}
   	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
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
			<h3 id="myinfo">비밀번호 변경</h3>
		</div>
		<form action="myLib_UpdatePw" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">새 비밀번호</td>
					<td><input type="password" id="newPw" name="newPw" placeholder="새로운 비밀번호를 입력해주세요." /></td>
				</tr>
				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" id="pwChk" name="pwChk" placeholder="비밀번호를 다시 입력해주세요." />
				<br /> 
				<span class="check_pw"></span>
				</td>
				</tr>
			</table>
		</form>
		<div id="btnbox">
				<button id="mybtn" onclick="newPw()">변경</button>
				<button id="mybtn" onclick="javascript:self.close();">취소</button>
		</div>
	</div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(5)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(5)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(4)").css("backgroundColor", "white");
})

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

function newPw() {
	if($('#newPw').val()==""||$('#pwChk').val()==""){
		alert("비밀번호를 입력해주세요.")
		$('#newPw').focus();
	}else if($('#newPw').val()!=$('#pwChk').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('#pwChk').focus();
	}else{
		$('form').submit();
		
	}
}
</script>
</html>