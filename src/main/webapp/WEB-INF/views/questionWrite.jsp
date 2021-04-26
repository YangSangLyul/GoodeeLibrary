<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        <form action="write" method="POST">    
            <input type="text" value="아이디" readonly class="gw1">
                <div class="gw2" style="background-color: white;">
                    문의유형
                    <select name="" id="selbox">
                        <option value="">도서</option>
                        <option value="">열람실</option>
                        <option value="">서비스</option>
                        <option value="">기타</option>
                    </select>
                </div>
            <input type="text" placeholder="제목을 작성해주세요"  class="gw3">
            <textarea name="" id="" cols="30" rows="10" placeholder="문의사항을 작성해 주십시ㅇ"  class="gw4"></textarea>
            <input type="button" value="사진업로드"  class="gw5" onclick="fileUp()">
            <label class="gw6"><input type="checkbox" name="" id="" value="">비밀글</label>
            <input type="button" value="작성완료"  class="gw7">
        </form>
    </div>
</body>
<script>

function fileUp(){
	window.open('uploadForm','fileupload','width=60','height=40');
}

function del(elem){
	console.log(elem);
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1);
	console.log(newFileName);
	
	//1. 실제 파일 삭제 요청
	$.ajax({
		url:'fileDelete',
		type:'get',
		data:{"fileName":newFileName},//key값에 : 이거 들어가니 파일삭제요청 못함. 항상 key:value 이렇게!
		//컨트롤러에 보내서 값 받아줄 때 이름 꼭 맞춰라!!!! fileName 보내려는데 내가 한 실수는 "fileName :"
		//문제가 일어난거임
		dataType:'json',
		success:function(d){
			console.log(d);
			if(d.success == 1){
				//$(elem).find('img').remove();//이미지 삭제
				$(elem).remove();//이미지와 X 삭제				
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}
</script>
</html>