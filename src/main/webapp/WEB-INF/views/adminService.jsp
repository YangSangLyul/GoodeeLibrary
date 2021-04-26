<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자서비스</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                width: 650px;
                height: 100px;
                margin: auto;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
            } 
            button{
                padding: 50px;
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
        <h3>관리하고자 하는 메뉴를 선택 해주세요.</h1>
        <div id="tabMenu">
            <button>공지사항</button>
            <button>도서관리</button>
            <button>리뷰관리</button>
            <button>문의내역</button>
        </div>
        <hr/>
        <h4>알림 내역</h4>
        <input type="button" value="더보기" id="moreBtn"/>
        <table>
            <tr>
                <th>종류</th>
                <th>알림내용</th>
                <th>수신일</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>        
    </body>
</html>