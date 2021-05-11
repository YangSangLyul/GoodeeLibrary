<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="icon.png">
        <title>J-Query</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
			#newBook{
				position: absolute;
				top: 25%;
				left: 25%;
			}
			td, th{
				height: 50px;
				width: 100px;
			}
			input[type='text'] {
				width: 500px;
			}
			#newBookBtn{
				text-align: right;
			}
			#newBookTitle{
            	color: #c5d8f1ff;
            	text-align: center;
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
        <div id="newBook">
            <h2 id="newBookTitle">신규 도서 등록</h2>
            <form action="bookInsert" method="POST">
                <table>
                    <tr>
                        <th>도서명</th>
                        <td><input type="text" name="bookName" placeholder="도서명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>저자명</th>
                        <td><input type="text" name="writer" placeholder="저자명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>출판사</th>
                        <td><input type="text" name="publisher" placeholder="출판사를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>책소개</th>
                        <td><input type="text" name="story" placeholder="책소개를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>표지 URL</th>
                        <td><input type="text" name="bookImg" placeholder="대표 사진 경로를 넣어주세요."></td>
                    </tr>
                </table>
                <div id='newBookBtn'><input type="submit" value="등록완료"></div>
            </form>
        </div>
    </body>
    <script>
    
    $("#adminLibraryBook").css('background-color','#337ab7').css("color","white");
    
	$(".menu:eq(0)").css("background-color","#337ab7");
	
    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7");
        $(".menu:eq(1)").css("backgroundColor", "white");
    })
    </script>
</html>