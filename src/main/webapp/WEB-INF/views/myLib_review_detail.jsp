<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰내역</title>
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
	    width: 800px;
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
<jsp:include page="header.jsp"/>
   	<div>
    <div id="title">${loginId}의 리뷰 상세 내역</div>
    <jsp:include page="mySidebar.jsp"/>
    <div id="body">
        <table id="table">
            <tr>
                <td rowspan="3">
                    <input type="image"/>                   
                    <td>리뷰상세내역</td>
                    <tr>
                        <td>
                            <input type="text" name="content"/>    
                        </td>
                    </tr>                    
                </td>
                
                
            <table id="table">
            
                    <td class="book_name">도서명</td>
                    <tr>
                        <td>저자명 : </td>
                        <td>박성배지음</td>
                        
                        <tr>추천수: ? </tr>
                        <tr>작성날짜: ? </tr>
                        
                    </tr>
                    <tr>
                        <td>출판사 : </td>
                        <td>Youngjin</td>
                    </tr>
                </table>
                <table>
                </table>
            </tr>
                
                <table>
                    <tr>
                        <button>수정</button>
                        <button>목록</button>
                        <button>삭제</button>
                    </tr>

                </table>
            </tr>
            <br/>

        </table>
    </div>
    </div>
</body>
</html>