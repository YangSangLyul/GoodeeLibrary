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

        #mysidenav a:link,a:visited{
        	color:black;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div id="mysidenav" class="sidenav">
        <div id="titleMenu"><a href="">자료 검색</a></div>
        <div class="menu" id="bookSearch">
            <p>도서 검색</p>
        </div>
        <div class="menu" id="newBooks">
            <p>신착도서 안내</p>
        </div>
        <div class="menu" id="authorRecommend">
            <p>사서추천 도서</p>
        </div>
        <div class="menu" id="wantBook">
            <p>희망도서 신청</p>
        </div>
    </div>

    <script>
        $(".menu").hover(function () {
            $(this).css("backgroundColor", "red");
        }, function () {
            $(this).css("backgroundColor", "white");
        })


        //여기 누르면 경로 지정;
        $("#bookSearch").click(function () {
            location.href = 'booksSearch';
        });
        
        //여기 누르면 경로 지정;
        $("#newBooks").click(function () {
            location.href = 'newBooksList';
        });
        
        //여기 누르면 경로 지정;
        $("#authorRecommend").click(function () {
            location.href = 'recommendBooks';
        });
        
        var loginId = "${loginId}";
        
        
        
        //여기 누르면 경로 지정;
        $("#wantBook").click(function () {
        	if(loginId != ""){
        	console.log('로그인 되어있음');
            location.href = 'hopeBook';
        	}else{
        		alert('로그인 후 사용할 수 있는 기능입니다.');
        		
        	}
        });
        
        

    </script>
</body>

</html>