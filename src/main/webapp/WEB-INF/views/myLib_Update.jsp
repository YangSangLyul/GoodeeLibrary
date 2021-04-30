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

input[type="password"] {
	width: 110%;
	height: 30px;
	padding: 5px;
	margin: 10px;
}

input[type="button"] {
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
		<form name="form" action="myLib_mem" method="POST">
			<table id="findFields">
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요." /></td>
				</tr>
				<tr>
					<td colspan="2">
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
		}else{
			document.form.action = "myLib_UpdateForm";
			document.form.submit();
		}
	});
});

$(document).ready(function() {
	$("#withdraw").click(function() {
			if($("#pw").val()==""){
				 alert("비밀번호를 입력해주세요.");
			     $("#pw").focus();
			}else if(confirm("회원탈퇴시 회원님의 모든 정보가 사라지며 복구 할 수 없습니다."+"그래도 탈퇴하시겠습니까?")){
			document.form.action = "memWithdraw";
			document.form.submit();
		}
	});
});


/* $("#update").on("click", function(){
    if($("#pw").val()==""){
        alert("비밀번호를 입력해주세요.");
        $("#pw").focus();
        return false;
    }
    $.ajax({
        url : "myLib_UpdateForm",
        type : "POST",
        dataType : "text",
        data :  {"pw":$("#pw").val()}
        success: function(data){
            if(data==0){
                alert("패스워드가 틀렸습니다.");
                return;
            }else{
                if(confirm("회원탈퇴하시겠습니까?")){
                    $("#delForm").submit();
                }
            }
        }
    })

});


$("#withdraw").click(function(){
	if($("#pw").val()==''){
		alert('비밀번호를 입력해주세요.');
   }else{
   	$.ajax({
			type:'POST'
			,url:'"memWithdraw"'
			,data: {"pw":$("#pw").val()}
			,dataType:'text'
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
});  */
</script>
</html>