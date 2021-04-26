<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>알림</title>
        <style>

            table{
                margin-left: 30px;
                width: 80%;
                border-radius: 5px;
            }

            table,td,th{
                border: 1px solid gray;
                border-collapse: collapse;
                text-align: center;
                padding: 10px;
            }

            table th{
                background-color: #c5d8f1ff;
            }

            table td button{
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
            }

            a:link { 
                color: blue; 
                text-decoration: none;
            }
            a:visited {
                color: blue; 
                text-decoration: none;
            }
            a:hover {
                color: blue;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
    </head>
    <body>
        <!-- 헤더 영역 -->
        <iframe src="header.html" width="100%" frameborder="0" scrolling="no">
        </iframe>
        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알림 내역</h2>
        <!-- 유저 알림 영역 -->
        <table>
            <tr>
                <th>종류</th>
                <th>알림내용</th>
                <th>수신일</th>
                <th>확인</th>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
            <tr>
                <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr>
        </table>
        <!-- 페이징 영역은 fixed로 고정시킬 예정-->
        <br/>
        <h2 style="text-align: center;">페이징 영역</h2>
    </body>


</html>