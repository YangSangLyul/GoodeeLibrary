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
         
    </style>
</head>

<body>
    <div id="mysidenav" class="sidenav">
        <div id="titleMenu" style="background-color:#337ab7;">도서관이용안내</div>
        <div class="menu">
            <p>찾아오는길</p>
        </div>
        <div class="menu">
            <p>공지사항</p>
        </div>
        <div class="menu">
            <p>FAQ</p>
        </div>
        <div class="menu">
            <p>묻고답하기</p>
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
           console.log("1번")
           location.href = '../../wayFind';
       })
       
        $(".menu:eq(1)").click(function () {
            console.log("2번")
            location.href = '../../notice';
        })
        
        $(".menu:eq(2)").click(function () {
            console.log("3번")
            location.href = '../../faq';
        })
        
        $(".menu:eq(3)").click(function () {
            console.log("4번")
            location.href = '../../QuestionAll';
        })
        
    </script>
</body>

</html>