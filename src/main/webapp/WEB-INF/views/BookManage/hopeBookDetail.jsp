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
                    <td>${info.reg_date}</td>
                </tr>
                <tr>
                    <th>신청자</th>
                    <td></td>
                </tr>
                <tr>
                    <th>핸드폰번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th>희망도서명</th>
                    <td></td>
                </tr>
                <tr>
                    <th>저자</th>
                    <td></td>
                </tr>
                <tr>
                    <th>출판사</th>
                    <td></td>
                </tr>
                <tr>
                    <th>신청사유</th>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2"><button>목록</button></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button>희망도서 승인</button>
                        <button>희망도서 거부</button>
                    </td>
                </tr>
            </table>

        </div>
    </body>
    <script>

    </script>
</html>