<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지사항 상세보기</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                /* text-align: center; */
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
            #content{
                overflow: auto;
            }
            #btn{
                margin-left: 470px;
            }
        </style>
    </head>
    <body>
        <!-- 여기는 상단 메뉴 자리 -->
        <hr/>
        <table>
            <tr>
                <th>제목</th>
                <td>기존 공지사항</td>
            </tr>
            <tr>
                <th>내용</th>
                <td id="content">공지사항의 내용을 상세하게 볼 수 있다.</td>
            </tr>
            <tr>
                <!-- 글을 쓰거나 수정 할 때 팝업체크 여부에 따라 값이 고정되게 수정하기 -->
                <th>팝업<input type="checkbox"></th>
                <td>날짜</td>
            </tr>
        </table>
        <br/>
        <div id="btn">
            <button>삭제하기</button>
            <button>수정하기</button>
            <button>이전으로</button>
        </div>
    </body>
</html>