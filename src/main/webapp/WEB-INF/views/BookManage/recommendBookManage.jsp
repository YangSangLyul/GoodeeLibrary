<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>J-Query</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
			table, tr,th, td{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 20px 10px;
            }
            .recommendBook{
            	position: absolute;
            	top: 25%;
            	left: 25%;
            }
            #bookName{
            	width: 500px;
            }
            #reason{
            	width: 500px;
            	height: 300px;
            }
            #recommendBookbtn{
            	text-align: right;
            }
            #recommendBookTitle{
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
        <div class='recommendBook'>
            <h2 id="recommendBookTitle">사서 추천 도서</h2>
            <form action="insertRecommendBook" method="POST">
            	<input type="hidden" name="bookIdx" value="${params.bookIdx}">
                <table>
                    <tr>
                        <th colspan="2" id="bookName">${params.bookName}</th>
                    </tr>
                    <tr>
                        <th>추천 사유</th>
                        <td><textarea id="reason" name="reason" placeholder="추천 사유를 입력해 주세요." style="resize: none;"></textarea></td>
                    </tr>
                    <tr>
                        <th colspan="2" id='recommendBookbtn'><input type="submit" value="등록"></th>
                    </tr>
                </table>
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