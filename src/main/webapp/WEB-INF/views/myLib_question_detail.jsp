<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    #qdBackground{
        background-color: wheat;
             width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
    }
    table{
        position: absolute;
        left: 15%;
        top: 5%;
        background-color: white;
    }
   td{
     
       border: 1px solid gray;
       width: 300px;
       height: 100px;
       vertical-align: top;
   }
   .btn{
   		padding-right:10px;
   		display:inline-block;
   }
</style>
<body>
    <div id="qdBackground">
        <table>
           <tr>
               <td>제목<hr/><br/>
               ${question_info.subject}</td>
               	<td>유형<hr/><br/>
				${question_info.type}</td>
           </tr>
           <tr>
            <td>작성자<hr/><br/>
               ${question_info.id}

            </td>
            <td>날짜<hr/><br/>
               ${question_info.reg_date}

            </td>
        </tr>
        <tr> 
            <td colspan="2">문의내용<hr/><br/>
               ${question_info.content}

            </td>
        </tr>
        <tr>
            <td colspan="2">답변내용<hr/><br/>
               ${question_info.ansstatus}
            
            </td>
        </tr>
     
        </table>
        <!-- if 관리자 답변이 있을 경우 -->
		<button class="btn" onclick="location.href='./question_edit?idx=${question_info.queidx}'">수정</button>
		<!-- 문의 내역 끝나면 위치 변경 수정필요! -->
		<button class="btn" onclick="location.href=./MyLibrary">목록</button>
        <button class="btn" onclick="location.href='./question_delete?idx=${question_info.queidx}'">삭제</button>
        <!-- 관리자 답변 없을 경우 숨김처리 -->
    </div>
</body>
</html>