<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 알림내역</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                width: 700px;
                height: 100px;
                margin: auto;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
            } 
            h4{
                text-align: left;
            }
            input[type='button']{
                position: absolute;
                left: 1170px;
                top: 230px;
            }
        </style>
    </head>
    <body>
        <!-- 여기는 상단 메뉴 자리 -->
        <hr/>
        <h4>알림 내역</h4>
        <table>
            <tr>
                <th>종류</th>
                <th>알림내용</th>
                <th>수신일</th>
                <th>확인</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td><button>읽음처리</button></td>
            </tr>
        </table>
        <!-- 페이징 여기서 -->
    </body>
</html>