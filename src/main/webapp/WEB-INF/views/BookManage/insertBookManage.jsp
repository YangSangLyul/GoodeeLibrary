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
            <form>
                <table>
                    <tr>
                        <th>도서명</th>
                        <td><input type="text" name="" placeholder="도서명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>저자명</th>
                        <td><input type="text" name="" placeholder="저자명을 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>출판사</th>
                        <td><input type="text" name="" placeholder="출판사를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>등록번호</th>
                        <td><input type="text" name="" placeholder="등록번호를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>책소개</th>
                        <td><input type="text" name="" placeholder="책소개를 입력해 주세요."></td>
                    </tr>
                    <tr>
                        <th>표지</th>
                        <td><input type="text" name="" placeholder="대표 사진을 넣어주세요.">
                            <button>사진 업로드</button>
                        </td>
                    </tr>
                </table>
                <input type="submit" value="등록완료">
            </form>
        </div>
    </body>
    <script>

    </script>
</html>