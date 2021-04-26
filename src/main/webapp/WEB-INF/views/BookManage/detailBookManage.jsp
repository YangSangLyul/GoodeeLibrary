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
                        이미지 넣을 위치
                    </td>
                </tr>
                <tr>
                    <th colspan="2">자바 스크립트~~ 책 제목</th>
                </tr>
                <tr>
                    <th>저자명</th>
                    <td>이름</td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td>출판</td>
                </tr>
                <tr>
                    <th>등록번호</th>
                    <td>?</td>
                </tr>
                <tr>
                    <th>책소개</th>
                    <td>..</td>
                </tr>
                <tr>
                    <th>예약인원</th>
                    <td>1/3</td>
                </tr>
                <tr>
                    <th>도서상태</th>
                    <td>대여중(예약가능)</td>
                </tr>
            </table>
            <button>사서의 추천도서 추가하기</button>
            <button>목록</button>
        </div>
    </body>
    <script>

    </script>
</html>