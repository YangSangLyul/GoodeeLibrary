<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#title{
	    text-align: center;
	    background-color: white;
	    width: 200px;
	    height: 30px;
	    margin-left: 40%;
	    border: 1px solid black;
	}
	
	#body{
		text-align: center;
	    background-color: beige;
		margin-top: 60px;
		margin-bottom: 60px;
	    margin-left: 35%;
	    width: 400px;
	    height: 300px;
	}
	
	body div{
	    text-align: center;
	}
	
	#table{
	    
	    margin-left: 15%;
	    margin-top: 20%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	
	#review{
	    background-color: aquamarine;
	}
	
	.book_name{
	    background-color: white;
	    margin-left: 100px;
	}
</style>
</head>
<body>
    <div id="title">user1의 리뷰</div>
    <div id="body">
        <table id="table">
            <tr>
                <td rowspan="3">
                    <input type="image"/>
                </td>
            
                <td class="book_name">자바 스크립트</td>
                <br/>
                <tr>
                    <td>추천수 : </td>
                </tr>
                <table>
                    <tr>
                        <td>저자명 : </td>
                        <td>박성배지음</td>
                    </tr>
                    <tr>
                        <td>출판사 : </td>
                        <td>Youngjin</td>
                    </tr>
                </table>
                <button id="review">리뷰상세보기</button>
            </tr>
            <br/>

        </table>
        <button>페이징처리하기</button>
    </div>
</body>
</html>