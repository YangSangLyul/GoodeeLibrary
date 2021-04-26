<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 수정</title>
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
                width: 100%;
                height: 300px;
                resize: none;
            }
            #btn{
                margin-left: 570px;
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
                <td>
                    <textarea name="content" id="content">기존 내용</textarea>
                </td>
            </tr>
            <tr>
                <!-- 글을 쓰거나 수정 할 때 팝업체크 여부에 따라 값이 고정되게 수정하기 -->
                <th>팝업<input type="checkbox"></th>
                <td>날짜</td>
            </tr>
        </table>
        <br/>
        <div id="btn">
            <button>작성완료</button>
            <button>닫기</button>
        </div>
    </body>
</html>