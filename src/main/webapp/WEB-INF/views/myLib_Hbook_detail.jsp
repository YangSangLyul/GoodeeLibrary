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
		    margin-top: 10%;
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
    <div id="my_title">user1의 희망도서 신청 상세내역</div>
    <br/>
    <div id="body">
        <table id="table">
            <tr>
                <td>신청일자</td>
                <td>2021-04-19</td>
            </tr>
            <tr>
                <td>신청자</td>
                <td>user1</td>
            </tr>
            <tr>
                <td>핸드폰번호</td>
                <td>010-1234-1234</td>
            </tr>
            <tr>
                <td>희망도서명</td>
                <td>커피를 '자바'라</td>
            </tr>
            <tr>
                <td>저자</td>
                <td>김독서</td>
            </tr>
            <tr>
                <td>출판사</td>
                <td>구디아카데미</td>
            </tr>
            <tr>
                <td>신청사유</td>
                <td>도서관 내 미비치</td>
            </tr>
        </table>
        <button>목록</button>
    </div>
</body>
<script>
    //팝업창 띄우기 alert
</script>
</html>