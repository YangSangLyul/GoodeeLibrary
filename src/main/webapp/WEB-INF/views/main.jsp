<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <style>
            #searchBox{
                position: absolute;
                left: 35%;
            }

            #searchBox input[type="text"]{
                width: 500px;
                text-align: center;
            }

            #place{
                position: absolute;
                left: 5%;
                top: 30%;
                width: 500px;
                height: 300px;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: #c5d8f1ff;
            }

            /*여기는 어떻게 될지 몰라서
            임의의 사진으로 영역 잡아놓음...
            */
            #place img{
                padding: 5px;
                width: 490px;
                height: 230px;
            }
            #noticeBox{
                position: absolute;
                width: 100px;
                left: 40%;
                top: 27%;
            }

            #notice{
                position: absolute;
                width: 40%;
                height: 28%;
                left: 40%;
                top: 34%;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: #c5d8f1ff;
            }
            .noticeContent{
                padding: 5px;
                margin: 10px;
                position: relative;
                width: 95%;
                height: 10%;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: white;
                margin-top: 20px;
            }

            #btnList{
                position: absolute;
                left: 25%;
                top: 70%;
            }

            #btnList button{
                width: 150px;
                height: 50px;
                background-color: white;
                border: 1px solid gray;
            }

            #btnList #adminRecommend{
                background-color: #c5d8f1ff;
            }

            #recommendList{
                position: absolute;
                left: 33%;
                top: 70%;
                width: 47%;
                height: 20%;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
            }

            #recommendList img{
                margin-left: 15px;
                border: 1px solid gray;
                width: 150px;
                height: 180px;
            }

            #noticeAll{
                position: absolute;
                left: 74.8%;
                top: 29.8%;
            }

            #noticeAll button{
                width: 100px;
                height: 40px;
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
            }

            a:link { 
                color: gray; 
                text-decoration: none;
            }
            a:visited {
                color: gray; 
                text-decoration: none;
            }
            a:hover {
                color: gray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
    </head>
    <body>
        <!-- 헤더 영역 -->
        <iframe src="header.jsp" width="100%" frameborder="0" scrolling="no">
        </iframe>
        <!-- 검색창 영역-->
        <div id="searchBox">
            <select name="search">
                <option value="도서명">도서명</option>
                <option value="저자">저자</option>
            </select>

            <input type="text" name="searchContent" placeholder="검색어를 입력 해 주세요."/>

            <input type="button" value="검색"/>
        </div>

        <!--도서관 위치 영역-->
        <div id="place">
            <p style="text-align: center;">도서관 위치</p>
            <img src="./image/알림.jpg">
        </div>

        <!--공지사항 영역-->
        <div id="noticeBox">
            <p style="text-align: center; background-color: #c5d8f1ff; height: 30px; padding: 10px; border: 1px solid gray; border-radius: 5px;">공지사항</p>
        </div>
        <!--공지사항 목록은 최신순으로 4개까지만...-->
        <div id="noticeAll">
            <button>더보기</button>
        </div>
        
        <div id="notice">
            
            <div class="noticeContent">
                <a href="#"> - 공지사항 입니다.</a>
                <p style="text-align: right; margin-top: -20px;">2021-04-25</p>
            </div>
            <div class="noticeContent">
                <a href="#"> - 공지사항 입니다.</a>
                <p style="text-align: right; margin-top: -20px;">2021-04-25</p>
            </div>
            <div class="noticeContent">
                <a href="#"> - 공지사항 입니다.</a>
                <p style="text-align: right; margin-top: -20px;">2021-04-25</p>
            </div>
            <div class="noticeContent">
                <a href="#"> - 공지사항 입니다.</a>
                <p style="text-align: right; margin-top: -20px;">2021-04-25</p>
            </div>
        </div>

        <!--추천도서 영역-->
        <div id="btnList">
            <button id="adminRecommend">사서 추천 도서</button><br/>
            <button id="monthReview">월간 리뷰多 도서</button><br/>
            <button id="monthNewBook">이번 달 신작 도서</button><br/>
        </div>
        <div id="recommendList">
            <a href="#"><img src="./image/알림.jpg"></a>
            <a href="#"><img src="./image/알림.jpg"></a>
            <a href="#"><img src="./image/알림.jpg"></a>
            <a href="#"><img src="./image/알림.jpg"></a>
            <a href="#"><img src="./image/알림.jpg"></a>
        </div>
        

    </body>


</html>