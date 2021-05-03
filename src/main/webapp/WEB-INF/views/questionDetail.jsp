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
</style>
<body>
    <div id="qdBackground">
        <table>
           <tr>
               <td>제목 <br>
				${map.SUBJECT}<input type="hidden" name="QUEIDX" value="${map.QUEIDX}">
               </td>
               <td>유형<br>
               <c:choose>
					<c:when test="${map.TYPE =='Q001'}">열람실</c:when>
               		<c:when test="${map.TYPE =='Q002'}">도서</c:when>
               		<c:when test="${map.TYPE	=='Q003'}">서비스</c:when>
              		<c:when test="${map.TYPE =='Q004'}">기타</c:when>
				</c:choose>
              </td>
           </tr>
           <tr>
            <td>작성자<br>
			${map.ID}
            </td>
            <td>날짜<br>
			${map.REG_DATE}
            </td>
        </tr>
        <tr> 
            <td colspan="2">문의내용 <br>
			${map.CONTENT}
            </td>
        </tr>
        <tr>
            <td colspan="2">답변내용 <br>
                <c:choose>
					<c:when test="${map.ANSSTATUS =='FALSE'}">아직 답변이 달리지 않은 문의 내용입니다 최대한빨리 답변해 드리겠습니다.</c:when>
               		<c:when test="${map.ANSSTATUS =='TRUE'}">${ansstatus}</c:when>
				</c:choose>
            </td>
        </tr>
        </table>

    </div>
</body>
</html>