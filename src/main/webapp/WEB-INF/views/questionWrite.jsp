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
        <form action="">
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
            <input type="button" value="사진업로드"  class="gw5">
            <label class="gw6"><input type="checkbox" name="" id="" value="">비밀글</label>
            <input type="button" value="작성완료"  class="gw7">
        </form>
    </div>
</body>

</html>