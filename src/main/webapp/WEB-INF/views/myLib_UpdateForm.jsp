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
#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
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

input[type="text"] {
    width: 95%;
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

#updatePw{
	font-size: 16px;
}

#updatePw:hover{
	text-decoration: underline;
	color : #0070c0;
}

.upp{
	text-align: right;
}
.upbtn{
	text-align: center;
}
   	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
            
    #id{
    	background-color: blue;
    	color:white;
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
		<form action="memUpdate" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" id="id" name="id" value="${sessionScope.loginId}" readonly/> </td>
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
		</form>
		<div class="upp"><a id="updatePw" href="myLib_UpdatePwForm" target="_blank">비밀번호 변경하기</a></div>
		<div class="upbtn">
			<button id="mybtn" onclick="update()">수정</button>
			<button id="mybtn" onclick="location.href='myLib_Update'">취소</button>
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
if (msg != "") {  
	alert(msg); 
}

function update() {
		$('form').submit();
}
</script>
</html>