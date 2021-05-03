<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>책 상세보기</title>
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
            	position: relative;
                font-size: 30px;
                font-weight: 600;
                width: 700px;
                left: 25%;
               	margin-top: -200px;
            }

 
            table{
                margin-left: 250px;
                
                width: 70%;
                height: 60%;
                border-radius: 5px;
            }

            table,td,th{
                border: 1px solid gray;
                border-collapse: collapse;
                text-align: center;
            }

            table th{
                background-color: #c5d8f1ff;
            }

            #container button{
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
            
           #loginOffBox{
                
                
                margin-top: -80px;
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
                <img src="${bookDetail.bookImg}"/>
            </div>
            <div class="searchBookName">
                <p>${bookDetail.bookName}</p>
            </div>

            <table>
                <tr>
                    <th>저자명</th>
                    <td>${bookDetail.writer}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${bookDetail.publisher}</td>
                </tr>
                <tr>
                    <th>등록번호</th>
                    <td>${bookDetail.bookIdx}</td>
                </tr>
                <tr>
                    <th>책소개</th>
                    <td id="story">${bookDetail.story}</td>
                </tr>
                <tr>
                    <th>예약인원</th>
                    <td>${reserveCnt} / 3</td>
                </tr>
                <tr>
                    <th>도서상태</th>
                    <td><c:if test="${reserveCnt ne 3}">
                    		<c:if test="${borrowId eq loginId}">
                    			<p>${loginId}님, 현재 대여중입니다.</p>		
                    		</c:if>
		                	<c:if test="${borrowId ne loginId}">
		                		<c:if test="${reserveId eq loginId}">
                    				<p>${loginId}님, 현재 예약중입니다.</p>
                    			</c:if>
                    			<c:if test="${reserveId ne loginId}">
                    				<p>예약가능</p>
                    			</c:if>
                    		</c:if>
                    	</c:if>
		                <c:if test="${reserveCnt eq 3}">
		                <p>예약불가</p>
		                </c:if>
                	</td>
                </tr>
            </table>
            <c:if test="${reserveCnt ne 3}">            
            	<c:if test="${reserveId eq loginId}">
					<button id="reserveCancel" onclick="location.href='./myRBookCancel?bookIdx=${bookDetail.bookIdx}'">도서예약취소</button>
				</c:if>
				<c:if test="${reserveId ne loginId}">
					<c:if test="${borrowId eq loginId}">
                  		<button id="bookReturn">도서반납하기</button>	
            		</c:if>
            		<c:if test="${borrowId ne loginId}">
						<button id="reserve" onclick="location.href='./mybookReserve?bookIdx=${bookDetail.bookIdx}'">도서예약</button>
					</c:if>
				</c:if>
		    </c:if>
            
            <button id="back" onclick="location.href='./MyLibrary'">이전으로</button>
        </div>
        

    </body>
    <script>
    	
    	
    	$("#bookReturn").click(function() {
    		location.href = 'myRBookCancel';
    	});
    </script>


</html>