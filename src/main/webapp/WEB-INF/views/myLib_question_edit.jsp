<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
    background-color: white;
        position: absolute;
        left: 15%;
        top: 5%;
        
    }
   td{
       border: 1px solid gray;
       width: 300px;
       height: 100px;
       vertical-align: top;
   }
  
   input[type="text"]{
       border: 0px solid;
       position: absolute;
       left: 1%;
       top: 10%;
       width: 160px;
       height: 30px;
   }
   input[type="button"]{
       margin-top: 10px;
       margin-left: 5px;
   }
   select{
       margin-top: 10px;
       margin-left: 5px;
       width: 100px;
       height: 50px;
   }
   textarea{
    border: 0px solid;
       resize: none;
       width: 540px;
       height: 90px;
   }
    #b1{
       position: absolute;
       top: 98%;
       left: 34%;
   }
   #b2{
    position: absolute;
    top: 98%;
       left: 55%; 
   }
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <div id="qdBackground">
        <form action="question_edit" method="POST">
            <table>
            	<input type="hidden" name="idx" value="${question_info.queidx}"/>
            	<input type="hidden" name="idx" value="${question_info.ansstatus}"/>
                <tr>
                    <td>
                        제목
                        <input type="text" name="subject" value="${question_info.subject}">
                    </td>
                    <td>
                        문의유형<br>
                        <select name="Qtype" id="selbox">
                            <option value="열람실">열람실</option>
                            <option value="도서">도서</option>
                            <option value="서비스">서비스</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>작성자<br>
                        <p>${question_info.id}</p>
                    </td>
                    <td>날짜<br>
                        <p>${question_info.reg_date}</p>
                    </td>
                </tr>
                <tr> 
                    <td colspan="2">문의내용
                        <textarea name="content" id="" cols="30" rows="10">${question_info.content}</textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br>
                        <input type="button" value="사진업로드">
                    </td>
                </tr>
            </table>
            <input id="save" type="button" value="저장"/>
	        <input id="cancel" type="button" value="취소" onclick="location.href='./question_detail?idx=${question_info.queidx}&&ansstatus=FALSE'"/>
        </form>
        <!-- <button id="b2" onclick="location.href='./question_detail?idx='">취소</button> -->
    </div>
</body>
<script>
$("#save").click(function(){
	//$('#content').val($('#editable').html());
	$('form').submit();
});
</script>
</html>