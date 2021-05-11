<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>J-Query</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, th, td{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px 10px;
                text-align: center;
            }
            #hopeBookDetail{
            	position: absolute;
            	top: 20%;
            	left: 25%;
            }
            #hopeBookDetail th{
            	width: 200px;
            	height: 60px;
            	text-align: center;
            }
            #hopeBookDetail td{
            	width: 500px;
            }
            #hopeBookList{
            	text-align: center;
            }
            #hopeBookList button{
            	background-color: #c5d8f1ff;
            }
            #hopeBookYN{
            	text-align: right;
            }
            #hopeBookYN button{
            	background-color: #c5d8f1ff;
            	
            }
            button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
           #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        </style>
    </head>
    <body>
      	<jsp:include page="../adminHeader.jsp"/>
      	<div id="sideBar">
    	<jsp:include page="./bookManageSidebar.jsp"/>
    	</div>
        <div id="hopeBookDetail">
            <table>
                <tr>
                    <th>신청일</th>
                    <td>${dto.hb_date}</td>
                </tr>
                <tr>
                    <th>신청자</th>
                    <td>${dto.id}</td>
                </tr>
                <tr>
                    <th>희망도서명</th>
                    <td>${dto.hb_bookName}</td>
                </tr>
                <tr>
                    <th>저자</th>
                    <td>${dto.writer}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${dto.publisher}</td>
                </tr>
                <tr>
                    <th>신청사유</th>
                    <td>${dto.hopeReason}</td>
                </tr>
                <c:if test="${dto.reject ne null}">
                <tr>
                    <th>거절사유</th>
                    <td>${dto.reject}</td>
                </tr>
                </c:if>
                <tr>
                    <td colspan="2"><div id="hopeBookList"><button onclick="location.href='./hopeBookList'">목록</button></div></td>
                </tr>
                <c:if test="${dto.hb_state eq 'H001' }">
	                <tr>
	                    <td colspan="2">
		                    <div id="hopeBookYN">
		                        <button onclick="location.href='hopeBookApprove?hopeBooksNumber=${dto.hopeBooksNumber}'">희망도서 승인</button>
		                        <button onclick="reject()">희망도서 거부</button>
		                    </div>
	                    </td>
	                </tr>
                </c:if>
            </table>
        </div>
    </body>
    <script>
	$("#adminLibraryBook").css('background-color','#337ab7').css("color","white");
	
	$(".menu:eq(1)").css("background-color","#337ab7");
	
	$(".menu").hover(function () {
	    $(this).css("backgroundColor", "red");
	}, function () {
		 $(".menu:eq(1)").css("background-color","#337ab7");
	    $(".menu:eq(0)").css("backgroundColor", "white");
	})
    
    
		function reject(){
			window.open("hopeBookReject?hopeBooksNumber=${dto.hopeBooksNumber}","도서거부", "width=450, height=200, left=100, top=100");
		}
    </script>
</html>