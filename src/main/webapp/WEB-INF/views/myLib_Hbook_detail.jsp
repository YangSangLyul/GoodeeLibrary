<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>나의 희망도서 상세내역</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
		#my_title{
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
	    margin-left: 25%;
	    width: 800px;
	    height: 400px;
	}
	
	body div{
	    text-align: center;
	}
	
	#table{
	    border: 1px solid black;
	    border-collapse: collapse;
	    margin-left: 15%;
	    margin-top: 20%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	#table th{
	    background-color:#c5d8f1ff;
	}
	#table td{
	    background-color:white;
	}
	table,th,td{
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	</style>
</head>
<body>
<jsp:include page="header.jsp"/>
    <div id="my_title">${loginId}의 희망도서 상세 내역</div>
    <div>
    
    <div id="body">
        <table id="table">
            <tr>
                <td>신청일자</td>
                <td>${HbookDetail.hb_date}</td>
            </tr>
            <tr>
                <td>신청자</td>
                <td>${HbookDetail.id}</td>
            </tr>
            <tr>
                <td>희망도서명</td>
                <td>${HbookDetail.hb_bookName}</td>
            </tr>
            <tr>
                <td>저자</td>
                <td>${HbookDetail.writer}</td>
            </tr>
            <tr>
                <td>출판사</td>
                <td>${HbookDetail.publisher}</td>
            </tr>
            <tr>
                <td>신청사유</td>
                <td>${HbookDetail.hopeReason}</td>
            </tr>
        </table>
        <button onclick="location.href='./MyHopeBook'">목록</button>
    
    </div>
</div>
</body>
<script>
</script>
</html>