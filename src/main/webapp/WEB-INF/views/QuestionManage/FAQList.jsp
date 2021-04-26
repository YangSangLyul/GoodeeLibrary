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
            <h2>FAQ 자주묻는 질문</h2>
            <form>
                <select name="FAQSearchType">
                    <option value="all">전체</option>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="FAQSearch"/>
                <button>검색</button>
            </form>
            <table>
                <tr>
                    <th>번호</th>                    
                    <th>제목</th>                                   
                </tr>
                <tr>
                    <th>1</th>                    
                    <th>테스트</th>                    
                </tr>
            </table>
            <button>글쓰기</button>
        </div>
    </body>
    <script>

    </script>
</html>