<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>J-Query</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        table, th,td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 5px 10px;
        }
        #adminQuestionContainer{
        	position:absolute;
        	left:25%;
        	top:25%;
        	width:20%;
        	height: auto;
        	border: 1px solid black;
        	padding: 5px 10px;
        }
        #adminQuestionContainer div{
        	position:relative;
        }
        
        #adminQuestionContainer span{
        	width:100px;
        	position:relative;
        	overflow: scroll;
        	word-break:break-all;
        }
                    button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
    </style>
</head>

<body>
	<jsp:include page="../adminHeader.jsp"></jsp:include>
    <div id="adminQuestionContainer">
        <h2 style="text-align: center;">문의 상세보기</h2>
        <div>
            <h4>문의 내역</h4>
            <hr/>
            <span>${queDetail.content}</span>
            <hr/>
        </div>
        <div>
        	<h4>답변</h4>
        	<c:if test="${queDetail.ansStatus eq 'TRUE'}">
        	<span>${ansContent}</span>
        	<hr/>
        	</c:if>
            <c:if test="${queDetail.ansStatus eq 'FALSE'}">
            <form id="answerInsert" action="answerInsert" method="POST">
            <input type="hidden" name="queIdx" value="${queDetail.queIdx}"/>
        	<span><textarea id="answerContent" name="answerContent" placeholder="답변을 입력해주세요"></textarea></span>
        	</form>
        	<hr/>
        	</c:if>
            
        </div>
        <div>
        <c:if test="${queDetail.ansStatus eq 'FALSE'}">
        <button id="answerSubmit">답변 작성하기</button>
        </c:if>
        <c:if test="${queDetail.ansStatus eq 'TRUE'}">
        <span>답변완료</span>
        </c:if>
        </div>
    </div>
</body>
<script>
$("#adminLibraryQuestion").css('background-color','#337ab7').css("color","white");
	var msg = "${msg}";
	
	if(msg != ""){
		alert(msg);
	}

	$("#answerSubmit").click(function(){
		if($("#answerContent").val() == ""){
			alert('답변을 입력하세요!');
		}else{
			$("#answerInsert").submit();
		}
	});

</script>

</html>