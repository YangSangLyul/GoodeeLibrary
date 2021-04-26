<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지사항</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                margin-top: 55px;
                width: 700px;
                height: 100px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
            } 
            h4{
                text-align: left;
            }
            #search{
                position: absolute;
                left: 1020px;
                top: 30px;
            }
            #write{
                position: absolute;
                left: 1180px;
                top: 80px;
            }
        </style>
    </head>
    <body>
        <!-- 여기는 상단 메뉴 자리 -->
        <hr/>
        <select name="searchType">
            <option value="all">전체</option>
            <option value="subject">제목</option>
            <option value="content">내용</option>
        </select>    
        <input type="text"/> 
        <input type="button" value="검색" id="search"/>
        <input type="button" value="공지등록" id="write"/>
        <table>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>등록일</th>
                <th>팝업여부</th>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <!-- 팝업은 하나만 가능하니까 radio로 했음 -->
                <td><input type="radio" id="popupCk"/></td>
            </tr>
        </table>
        <!-- 페이징 여기서 -->
    </body>
</html>