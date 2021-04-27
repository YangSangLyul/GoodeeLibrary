<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #noticeBackground{
            background-color: blanchedalmond;
            width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
        }
        #search{
            width: 100%;
            height: 100%;
            position: absolute;
            left: 27%;
            top: 5%;
        }
        select{
            font-size: large;
        }
        input{
            font-size: large;
        }
        #noticeTable{
            width: 100%;
            height: 100%;
            /* background-color: red; */
        }
        table{
            position: absolute;
            left: 20%;
            top: 20%;
            text-align:center;
        }
        td,th{
            border: 1px solid gray;
        }
        .n1{
            width: 10%;
            height: 10%;
        }
        .n2{
            width: 70%;
            height: 10%;
        }
    </style>
</head>
<body>
    <div id="noticeBackground">
        <div id="search">
            <form action="noticeSearch" method="get">
                <select name="searchSelect" id="searchSelect">
                    <option value="전체" selected>전체</option>
                    <option value="제목">제목</option>
                    <option value="내용">내용</option>
                </select>
                <input type="text" name="search" placeholder="검색해주세요">
                <input type="submit" value="검색">
            </form>
        </div>
        <div id="noticeTable">
            <table>
                <tr>
                    <th class="n1">글번호</th>
                    <th class="n2">제목</th>
                    <th>등록일</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                	<tr>
                		<td class="n1">${dto.noticeidx}</td>
                		<td class="n2"><a href=/main/noticeDetail/${dto.noticeidx}>${dto.subject}</a></td>
                		<td>${dto.reg_date}</td>
                	</tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>