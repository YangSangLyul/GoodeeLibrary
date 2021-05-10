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
        </style>
    </head>
    <body>
        <jsp:include page="../adminHeader.jsp"/>
    	<jsp:include page="./bookManageSidebar.jsp"/>
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

    </script>
</html>