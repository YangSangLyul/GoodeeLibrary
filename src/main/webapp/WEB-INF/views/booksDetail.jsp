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
                height: 200px;
                margin: 10px 50px;
                width: 150px;
            }

            .searchBookName{
            	position: relative;
                font-size: 30px;
                font-weight: 600;
                width: 700px;
                left: 25%;
               	margin-top: -225px;
               	
            }


            #booktable{
                margin-left: 250px;
                width: 70%;
                height: 60%;
                border-radius: 5px;
            }

            #booktable,td,th{
                border-bottom: 1px solid lightgray;
                border-collapse: collapse;
                padding : 10px 20px;
            }

            #booktable th{
                width: 65px;
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
            
           #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        	
        	.bookmain{
        		padding: 10px;
    			background-color: #f9f7f7ed;
    			height: 465px;
   				margin-top: 15px;
        	}
        	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
        </script>
    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="dataserchSidebar.jsp"></jsp:include>
        </div>
        
        <!-- 검색창 영역-->
        <div id="container">
            <h2>도서 상세보기</h2>
            <hr/>
            <div class="bookmain">
            <div class="searchImg">
                <img src="${searchDetail.bookImg}"/>
            </div>
            <div class="searchBookName">
                <p>${searchDetail.bookName}</p>
            </div>

            <table id="booktable">
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
                    <td>${reserveCnt} / 3</td>
                </tr>
                <tr>
                    <th>도서상태</th>
                    <td><c:if test="${reserveCnt <= '2'}">
		                <p>예약가능</p>
		                </c:if>
		                <c:if test="${reserveCnt >= '3'}">
		                <p>예약불가</p>
		                </c:if>
                	</td>
                </tr>
            </table>
            </div>
            <c:if test="${reserveCnt <= '2'}">
		                <button id="reserve" onclick="location.href='reserveBook?bookIdx=${searchDetail.bookIdx}'">도서예약</button>

		    </c:if>
            
            <button id="back" onclick="history.go(-1)">이전으로</button>
        </div>
        

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(0)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
    })
    
    	var msg = "${msg}";
    	var cantReserveMsg = "${cantReserveMsg}";
    	
    	if(msg != ""){
    		alert(msg);
    	}
    	
    	if(cantReserveMsg != ""){
    		alert(cantReserveMsg);
    	}
    
    	
    </script>


</html>