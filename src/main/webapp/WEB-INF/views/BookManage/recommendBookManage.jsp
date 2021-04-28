<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>J-Query</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>

        </style>
    </head>
    <body>
        <div>
            <h2>사서 추천 도서</h2>
            <form>
                <table>
                    <tr>
                        <th>${params.bookName}</th>
                    </tr>
                    <tr>
                        <th>추천 사유</th>
                        <td><textarea placeholder="추천 사유를 입력해 주세요." style="resize: none;"></textarea></td>
                    </tr>
                    <tr>
                        <th colspan="2"><input type="submit" value="등록"></th>
                    </tr>
                </table>
            </form>
        </div>
    </body>
    <script>

    </script>
</html>