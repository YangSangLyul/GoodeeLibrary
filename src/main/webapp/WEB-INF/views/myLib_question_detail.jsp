<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
	#sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 300px;
	    height: 40px;
	    margin-left: 40%;
	    margin-bottom: 2%;
	    border: 1px solid black;
	}
	#body{
		position: absolute;
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 1000px;
	    height: 900px;
	}
    table{
        position: absolute;
        left: 15%;
        top: 5%;
        background-color: white;
    }
   td{
     
       border: 1px solid gray;
       background-color:white;
       width: 300px;
       height: 100px;
       vertical-align: top;
   }
   .btn{
   		margin-top:60%;
   		width:70px;
   }
   button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
<body>
	<jsp:include page="header.jsp"/>
	<div id="my_title">${loginId}의 문의 상세내역</div>
	<div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
    <div id="body">
        <table>
           <tr>
               <td>제목<hr/><br/>
               ${question_info.subject}</td>
               	<td>유형<hr/><br/>
				<c:if test="${question_info.type eq 'Q001'}">열람실</c:if> 
				<c:if test="${question_info.type eq 'Q002'}">도서</c:if> 
				<c:if test="${question_info.type eq 'Q003'}">서비스</c:if> 
				<c:if test="${question_info.type eq 'Q004'}">기타</c:if> 
				</td>
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
            	${question_info.answer}
            </td>
        </tr>
     
        </table>
        <!-- 관리자 답변이 있을 경우 -->
		<c:if test="${question_info.ansstatus eq 'TRUE'}">
			<button class="btn" onclick="location.href='./MyQuestion'">목록</button>
		</c:if>
        <!-- if 관리자 답변이 없을 경우 -->
        <c:if test="${question_info.ansstatus eq 'FALSE'}">
			<button class="btn" onclick="location.href='./editForm?idx=${question_info.queidx}'">수정</button>
	        <button class="btn" onclick="location.href='./MyQuestion'">목록</button>
	        <button class="btn" onclick="location.href='./question_delete?idx=${question_info.queidx}'">삭제</button>
        </c:if>
    </div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(4)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(4)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})
</script>
</html>