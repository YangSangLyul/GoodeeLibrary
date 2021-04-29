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
         #QBack{
            background-color: blanchedalmond;
            width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
        }
        #buttonBox{
            position: absolute;
            left: 20%;
        }
        .writebox{
            position: absolute;
            left: 180%;
        }
        #QuestionTable{
            text-align: center;
            position: absolute;
            left: 16%;
            top: 10%;
        }
        .n1{
            width: 100px;
            height: 10px;
        }
        .n2{
            width: 400px;
            height: 30px;
        }
    </style>
</head>
<body>
    <div id="QBack">
        <div id="buttonBox">
            <button onclick="location.href='QuestionAll'">전체</button>
            <button onclick="location.href='QuestionRoom'">열람실</button>
            <button onclick="location.href='QuestionBook'">도서</button>
            <button onclick="location.href='QuestionService'">서비스</button>
            <button onclick="location.href='QuestionGuitar'">기타</button><!--etc-->
            <button class="writebox">글쓰기</button>
        </div>
        <div id="QuestionTable">
            <table>
                <tr>
                    <th class="n1">글번호</th>
                    <th class="n2">제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변</th>
                </tr>
                <c:forEach items="${list}" var="dto">
                <tr>
                    <td class="n1">${dto.queidx}</td>
                    <td class="n2">${dto.subject}</td>
                    <td>${dto.id}</td>
                    <td>${dto.reg_date}</td>
<c:choose>
<c:when test="${dto.ansstatus =='FALSE'}"><td>답변대기중</td></c:when>
<c:when test="${dto.ansstatus =='TRUE'}"><td>답변완료</td></c:when>       	
</c:choose> 
                </tr>                
                </c:forEach>
            </table>
        </div>
    </div>
</body>

</html>