<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>나의 희망도서 상세내역</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
	#sideBar{
	 	position: absolute;
	  	margin-left: 10%;
	  	margin-top: 3%;
	  }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 200px;
	    height: 30px;
	    margin-left: 40%;
	    margin-bottom: 1%;
	    border: 1px solid black;
	}
	#body{
		position: absolute;
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 1000px;
	    height: 900px;
	}
	
	body div{
	    text-align: center;
	}
	
	#table{
		width:400px;
		position: relative;
	    margin-left: 30%;
	    top: 10%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	#table th{
	    background-color:#c5d8f1ff;
	    text-align: center;
	}
	#table td{
		background-color:white;
	    text-align: center;
	    position:relative;
	}
	th,td{
	    height:50px;
	    text-align: center;
	    border: 1px solid black;
	    border-collapse: collapse;
	    position:relative;
	}     
	.btn{
		margin-top:40%;
	}
	</style>
</head>
<body>
<jsp:include page="header.jsp"/>
    <div>
    <div id="my_title">${loginId}의 희망도서 상세 내역</div>
    <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
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
        <button class="btn" onclick="location.href='./MyHopeBook'">목록</button>
    
    </div>
</div>
</body>
<script>
</script>
</html>