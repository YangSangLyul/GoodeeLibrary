<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>이 달의 리뷰왕</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <!-- 제이쿼리(제이쿼리가 있어야 아래 라이브러리를 사용할 수 있으므로 최상단에 위치) -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
        <style>
            /* body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            } */
            table{
                width: 210px;
                height: 100px;
                margin-left: 20px;
                margin-top: 10px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
            } 
        </style>
    </head>
    <body>
        <table>
           	<c:forEach items="${chk.hide}" var="mem">
            	<tr>
	                <td>${mem.id}</td>
	            </tr>
           	</c:forEach>
        </table>
    </body>
    <script>
    </script>
</html>