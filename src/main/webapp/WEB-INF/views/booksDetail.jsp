<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>booksDetail</title>
        <style>
            #container{
                position: absolute;
                left: 25%;
                width: 60%;
            }

            .searchImg img{
                
                width: 200px;
                height: 200px;
            }

            .searchBookName{
                font-size: 30px;
                font-weight: 600;
                padding: 5px;
                width: 350px;
                position: absolute;
                left: 25%;
                top: 15%;
            }

            
            table{
                margin-left: 250px;
                margin-top: -130px;
                width: 70%;
                border-radius: 5px;
            }

            table,td,th{
                border: 1px solid gray;
                border-collapse: collapse;
                text-align: center;
                padding: 10px;
            }

            table th{
                background-color: #c5d8f1ff;
            }

            button{
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
                position: relative;
                width: 100px;
                height: 50px;
                margin-top: 30px;
                margin-left: 50px;
                left: 40%;
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
        <script>
            var menu3 = window.parent.document.getElementById("search");
            menu3.css('background-color','blue');
        </script>
    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        <!-- 검색창 영역-->
        <div id="container">
            <h2>도서 상세보기</h2>
            <hr/>
            <div class="searchImg">
                <img src="${searchDetail.bookImg}"/>
            </div>
            <div class="searchBookName">
                <p>${searchDetail.bookName}</p>
            </div>

            <table>
                <tr>
                    <th>저자명</th>
                    <td>${searchDetail.writer}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${searchDetail.publisher}</td>
                </tr>
                <tr>
                    <th>등록번호</th>
                    <td>${searchDetail.bookIdx}</td>
                </tr>
                <tr>
                    <th>책소개</th>
                    <td id="story">${searchDetail.story}</td>
                </tr>
                <tr>
                    <th>예약인원</th>
                    <td>1 / 3</td>
                </tr>
                <tr>
                    <th>도서상태</th>
                    <td><c:if test="${searchDetail.bookState eq 'B001'}">
		                <p>예약가능</p>
		                </c:if>
		                <c:if test="${searchDetail.bookState eq 'B002'}">
		                <p>예약불가</p>
		                </c:if>
                	</td>
                </tr>
            </table>
            <button id="reserve">도서예약</button>
            <button id="back">이전으로</button>
        </div>
        

    </body>


</html>