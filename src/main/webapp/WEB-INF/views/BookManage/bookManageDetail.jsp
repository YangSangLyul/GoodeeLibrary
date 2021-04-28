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
                    <td rowspan="8">
                        <img src="${dto.bookImg}" width="300px" height="300px"/>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">${dto.bookName}</th>
                </tr>
                <tr>
                    <th>저자명</th>
                    <td>${dto.writer}</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>${dto.publisher}</td>
                </tr>
                <tr>
                    <th>등록번호</th>
                    <td>${dto.bookIdx}</td>
                </tr>
                <tr>
                    <th>책소개</th>
                    <td>${dto.story}</td>
                </tr>
                <tr>
                    <th>예약인원</th>
                    <td>${reserveCnt}</td>
                </tr>
                <tr>
                    <th>도서상태</th>
                    <td>${dto.bookState}</td>
                </tr>
            </table>
            <button onclick="location.href='recommendBook?bookIdx=${dto.bookIdx}&bookName=${dto.bookName}'">사서의 추천도서 추가하기</button>
            <button>목록</button>
        </div>
    </body>
    <script>

    </script>
</html>