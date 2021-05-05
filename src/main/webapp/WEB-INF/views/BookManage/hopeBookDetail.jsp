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
        </style>
    </head>
    <body>
        <div>
            <table>
                <tr>
                    <th>신청일</th>
                    <td>${dto.hb_date}</td>
                </tr>
                <tr>
                    <th>신청자</th>
                    <td>${dto.id}</td>
                </tr>
                <tr>
                    <th>희망도서명</th>
                    <td>${dto.hb_bookName}</td>
                </tr>
                <tr>
                    <th>저자</th>
                    <td>${dto.writer}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${dto.publisher}</td>
                </tr>
                <tr>
                    <th>신청사유</th>
                    <td>${dto.hopeReason}</td>
                </tr>
                <c:if test="${dto.reject ne null}">
                <tr>
                    <th>거절사유</th>
                    <td>${dto.reject}</td>
                </tr>
                </c:if>
                <tr>
                    <td colspan="2"><button onclick="location.href='/main/hopeBookList'">목록</button></td>
                </tr>
                <c:if test="${dto.hb_state eq 'H001' }">
	                <tr>
	                    <td colspan="2">
	                        <button onclick="location.href='hopeBookApprove?hopeBooksNumber=${dto.hopeBooksNumber}'">희망도서 승인</button>
	                        <button>희망도서 거부</button>
	                    </td>
	                </tr>
                </c:if>
            </table>

        </div>
    </body>
    <script>

    </script>
</html>