<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
</head>
<style>
    #qwBackground{
        background-color: wheat;
             width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
    }
    .gw1{
        position: absolute;
        left:27%;
        top:5%;
    }
    .gw2{
        position: absolute;
        left:70%;
        top:5%;
    }
    .gw3{
        position: absolute;
        left:27%;
        top:10%;
    }
    .gw4{
        position: absolute;
        left:27%;
        top:20%;
        width:400px;
        height: 220px;
        resize: none;
    }
    .gw5{
        position: absolute;
        left:27%;
        top:70%;
    }
    .gw6{
        position: absolute;
        left:27%;
        top:80%;
        background-color: white;
        width: 80px;
    }
    .gw7{
        position: absolute;
        left:47%;
        top:80%;
    }
</style>
<body>

    <div id="qwBackground">
        <form action="questionWriting">
            <input type="text" value="${loginId}" readonly class="gw1" name="loginId">
                <div class="gw2" style="background-color: white;">
                    문의유형
                    <select name="type" id="selbox">
                        <option value="Q001">열람실</option>
                        <option value="Q002">도서</option>
                        <option value="Q003">서비스</option>
                        <option value="Q004">기타</option>
                    </select>
                </div>
            <input type="text" placeholder="제목을 작성해주세요"  class="gw3" name="subject">
            <textarea id="editable" contenteditable="true" cols="30" rows="10" placeholder="문의사항을 작성해 주세요"  class="gw4" name="content"></textarea>
            <input type="button" value="사진업로드"  class="gw5" onclick="fileUp()"/>
            <label class="gw6"><input type="checkbox" name="false" value="TRUE" id="tfCK" >비밀글</label>
            <input id="save" type="button" value="작성완료"  class="gw7"/>
        </form>
    </div>
</body>
<script>
$("#tfCK").click(function(){
if($("#tfCK").is(":checked") == true){
    console.log('체크된 상태');
    $("#tfCK").val("FALSE");
}
 
if($("#tfCK").is(":checked") == false){
    console.log('체크 안 된 상태');
    $("#tfCK").val("TRUE");
}
})

$("#save").click(function(){
	//editable 에 있는 내용을 content의 value 넣기
	$("#editable a").find("b").remove();
	$("#editable a").removeAttr('onclick');
	$('#content').val($('#editable').html());
	$('form').submit();
});

function fileUp(){
	window.open('uploadForm','fileupload','width=60','height=40');
}
</script>
</html>