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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
        #titleMenu {
            border: 1px solid black;
            background-color: blue;
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
        a{
            color:white
        }
        a:link,a:visited{
            color: white;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div id="mysidenav" class="sidenav">
        <div id="titleMenu"><a href="">도서관메뉴</a></div>
        <div class="menu">
            <p>1</p>
        </div>
        <div class="menu">
            <p>2</p>
        </div>
        <div class="menu">
            <p>3</p>
        </div>
        <div class="menu">
            <p>4</p>
        </div>
        <div class="menu">
            <p>5</p>
        </div>
        <div class="menu">
            <a href="find">6</a>
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
           location.href = '';
       })
       
        $(".menu:eq(1)").click(function () {
            console.log("1번")
            location.href = '';
        })
    </script>
</body>

</html>