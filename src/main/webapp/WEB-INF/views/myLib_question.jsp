<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
   	<title>내 문의 내역 리스트</title>
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
	<!-- 헤더 영역 -->
    <jsp:include page="header.jsp"/>
    <div id="QBack">
        <div id="buttonBox">
            <button>전체</button>
            <button>열람실</button>
            <button>도서</button>
            <button>서비스</button>
            <button>기타</button>
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
              
                <c:forEach items="${questionList}" var="list">
				<tr>
					<td class="n1">${list.queidx}</td>
					<td class="n2"><a href="./question_detail?idx=${list.queidx}">${list.subject}</a></td>
					<td>${list.id}</td>
					<td>${list.reg_date}</td>
					<td>${list.ansstatus}</td>
				</tr>
				</c:forEach>
                
                <tr>
                    <td class="n1">2</td>
                    <td class="n2">예제예제제목입니달ㅇㄴ마ㅣ릉ㄴㅁ리ㅏㄴㅁㅇㅇㅇㄴㄴㅇ</td>
                    <td>테스트2</td>
                    <td>2022-22-22</td>
                    <td>x</td>
                </tr>
                <tr>
                    <td class="n1">3</td>
                    <td class="n2">예제예제제목입니달ㅇㄴ마ㅣ릉ㄴㅁ리ㅏㄴㅁㅇㅇㅇㄴㄴㅇ</td>
                    <td>테스트1</td>
                    <td>2022-22-22</td>
                    <td>x</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>