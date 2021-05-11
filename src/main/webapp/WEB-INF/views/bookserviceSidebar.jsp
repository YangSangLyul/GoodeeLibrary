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
    
    <style>
        #titleMenu {
            border: 1px solid black;
            background-color: #337ab7;
            width: 200px;
            height: 50px;
            text-align: center;
            padding-top: 20px;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 38px;
            text-align: center;
            padding-bottom: 20px;
        }
    </style>
</head>

<body>
    <div id="mysidenav" class="sidenav">
        <div id="titleMenu"><a href="" style="color:black;text-decoration:none;">도서관 서비스</a></div>
        <div class="menu">
            <p>리뷰 모아보기</p>
        </div>
        <div class="menu">
            <p>열람실 좌석 예약</p>
        </div>
    </div>

    <script>
        $(".menu").hover(function () {
            $(this).css("backgroundColor", "red");
        }, function () {
            $(this).css("backgroundColor", "white");
        })

     //여기 누르면 경로 지정 예시 ;
        //여기 누르면 경로 지정;
        $(".menu:eq(0)").click(function () {
           console.log("0번")
           location.href = 'reviewList';
       })
       
        $(".menu:eq(1)").click(function () {
            console.log("1번")
            location.href = 'reserveSeatForm';
        })
    </script>
</body>

</html>