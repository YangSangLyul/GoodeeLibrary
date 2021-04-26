<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>이 달의 리뷰왕</title>
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
                padding: 10px;
                padding-inline: 35px;
                margin: 20px;
            }
            h4{
                text-align: left;
            }
            #decision{
                position: absolute;
                left: 1139px;
                top: 235px;
            }
        </style>
    </head>
    <body>
        <!-- 상단 네비게이션 자리 -->
        <hr/>
        <div id="tabMenu">
            <button>이달의 리뷰왕</button>
            <button>신고 리스트</button>
            <button>블라인드 리스트</button>
        </div>
        <br/>
        <table>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>추천수</th>
                <th>리뷰수</th>
                <th>선정</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><input type="checkbox" id="king"/></td>
            </tr>
        </table>        
        <!-- 3명까지만 선택 가능하도록 -->
        <input type="button" value="리뷰왕 선정" id="decision"/>
    </body>
</html>