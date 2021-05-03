<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>내 희망도서</title>
    <meta charset="UTF-8">
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
   	<div>
    <div id="my_title">${loginId}의 희망도서 신청 내역</div>
    <jsp:include page="mySidebar.jsp"/>
    <div id="body">
        <table id="table">
            <tr>
                <th>도서명</th>
                <th>신청일자</th>
                <th>처리상태</th>
            </tr>
            <br/>
            <tbody id="hope_list">
             
            </tbody>
        	<tr>
			<!-- 페이징 번호 보여주기 -->
            <td id="paging" colspan="4">
            	<!-- 플러그인 사용 -->
            	<div class="container">
            		<nav aria-label="page navigation" style="text-align:center">
            			<ul class="pagination" id="pagination"></ul>
            		</nav>
            	</div>
            </td>
         </tr>
        </table>
    </div>
    </div>
</body>
<script>
    //팝업창 띄우기 alert
</script>
</html>