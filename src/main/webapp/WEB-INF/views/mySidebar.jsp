<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- 부트스트랩 (반응형 디자인을 위한 css 라이브러리) -->
   	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
     	
	<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함!) -->
	<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <style>
        #titleMenu {
            border: 1px solid black;
            background-color: #337ab7;
            width: 200px;
            height: 50px;
            text-align: center;
            padding-top: 20px;
            color:white;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 38px;
            text-align: center;
            padding-bottom: 20px;
            font-weight: 600;
        }
        a{
            color:black;
        }
        a:link,a:visited{
            color: black;
            text-decoration: none;
        } 
    </style>
</head>

<body>
    <div id="mysidenav" class="sidenav">
        <div id="titleMenu"><a href="">마이 라이브러리</a></div>
        <div class="menu">
            	<p>입실|퇴실 내역</p>
        </div>
        <div class="menu">
           	<p>도서 예약 내역</p>
        </div>
        <div class="menu">
            <p>희망 도서 신청 내역</p>
        </div>
        <div class="menu">
            <p>내 리뷰내역</p>
        </div>
        <div class="menu">
            <p>내 문의내역</p>
        </div>
        <div class="menu">
            <p>회원정보 수정/탈퇴</p>
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
               //여기 누르면 경로 지정 예시 ;
        //여기 누르면 경로 지정;
        $(".menu:eq(0)").click(function () {
           console.log("1번")
           location.href = './myLib_reserveSeatInOut';
       })
       
        $(".menu:eq(1)").click(function () {
            console.log("2번")
            location.href = './MyBook';
        })
        
        $(".menu:eq(2)").click(function () {
            console.log("3번")
            location.href = './MyHopeBook';
        })
        
        $(".menu:eq(3)").click(function () {
            console.log("4번")
            location.href = './MyReview';
        })
        
                $(".menu:eq(4)").click(function () {
            console.log("4번")
            location.href = './MyQuestion';
        })
        
                $(".menu:eq(5)").click(function () {
            console.log("4번")
            location.href = './myLib_Update';
        })
    </script>
</body>

</html>