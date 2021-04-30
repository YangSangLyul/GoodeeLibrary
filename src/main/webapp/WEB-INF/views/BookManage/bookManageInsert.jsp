<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="icon.png">
        <title>J-Query</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>

        </style>
    </head>
    <body>
        <div>
            <h2>신규 도서 등록</h2>
            <form action="bookInsert" method="POST">
                <table>
                    <tr>
                        <th>도서명</th>
                        <td><input type="text" name="bookName" placeholder="도서명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>저자명</th>
                        <td><input type="text" name="writer" placeholder="저자명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>출판사</th>
                        <td><input type="text" name="publisher" placeholder="출판사를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>책소개</th>
                        <td><input type="text" name="story" placeholder="책소개를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>표지 URL</th>
                        <td><input type="text" name="bookImg" placeholder="대표 사진 경로를 넣어주세요."></td>
                    </tr>
                </table>
                <input type="submit" value="등록완료">
            </form>
        </div>
    </body>
    <script>

    </script>
</html>