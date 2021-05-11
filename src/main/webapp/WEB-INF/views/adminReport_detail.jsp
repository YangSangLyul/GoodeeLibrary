<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>신고 리뷰 상세보기</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            #container{
                width: 700px;
                margin: 20px 550px;
               	padding: 10px;
            }
            table{
                margin-top: 55px;
                width: 700px;
                height: 100px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            } 
            #content{
                overflow: auto;
            }
            #btn{
                margin-left: 340px;
            }
            button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    </head>
    <body>
    	<div style="text-align: left;">
	    	<jsp:include page="adminHeader.jsp"/>
    	</div>
        <div id="container">
	        <h3>신고 리뷰 상세보기</h3>
	        <table>
	            <tr>
	                <th>리뷰 작성일</th>
	                <td>${detail.reg_date}</td>
	            </tr>
	            <tr>
	                <th>리뷰 작성자</th>
	                <td>${detail.id}</td>
	            </tr>
	            <tr>
	                <th>리뷰 내용</th>
	                <td>${detail.content}</td>
	            </tr>
	            <tr>
	                <th>신고일</th>
	                <td>${detail.reportdate}</td>
	            </tr>
	            <tr>
	                <th>신고자</th>
	                <td>${detail.reportId}</td>
	            </tr>
	            <tr>
	                <th>신고사유</th>
	                <td>${detail.reportReason}</td>
	            </tr>
	        </table>
	        <br/>
	        <div id="btn">
	            <button onclick="history.go(-1)">닫기</button>
	        </div>
        </div>
    </body>
    <script>
    $("#adminLibraryReview").css('background-color','#337ab7').css("color","white");
    </script>
</html>