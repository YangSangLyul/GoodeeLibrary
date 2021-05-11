<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String loginId = (String) request.getSession().getAttribute("loginId");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 글쓰기</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            #container{
                width: 800px;
                margin: 20px 550px;
                /* text-align: center; */
            }
            table{
                margin-top: 190px;
                margin-left: 100px;
                width: 700px;
                height: 100px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            } 
            #content{
                overflow: auto;
                width: 100%;
                height: 300px;
                resize: none;
            }
            #btn{
            	padding: 5px;
           		margin-top: 10px;
                margin-left: 670px;
            }
            input[type='text']{
                width: 100%;
            }
            button,input[type="button"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
    	<jsp:include page="adminHeader.jsp"/>
    	<div id="container">
    		<form action="noticeWrite" method="post">
		        <table>
		        	<input type="hidden" name="id" value="${sessionScope.loginId}"/>
		            <tr>
		                <th>제목</th>
		                <td><input type="text" name="subject" placeholder="제목을 입력해주세요."></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td>
		                    <textarea name="content" id="content" placeholder="내용을 입력해주세요."></textarea>
		                </td>
		            </tr>
		            <tr>
		                <!-- 글을 쓰거나 수정 할 때 팝업체크 여부에 따라 값이 고정되게 수정하기 -->
		                <th>팝업<input type="checkbox" id="state"/></th>
		                <td><input type="hidden" id="stateR" name="popup"/></td>
		            </tr>
		        </table>
    		</form>
		        <div id="btn">
		        	<input type="button" value="작성완료" onclick="popupState()">
		            <button onclick="location.href='adminNotice'">닫기</button>
		        </div>
    	</div>
    </body>
    <script>
    
    	$("#adminLibraryInfo").css('background-color','#337ab7').css("color","white");	
    
    	function popupState() {
    		var state = document.getElementById("state");
    		if(state.checked){
    			$("#stateR").val('true');
    			document.getElementsByTagName("form")[0].submit();
    		}else{
    			$("#stateR").val('false');
    			document.getElementsByTagName("form")[0].submit();
    		}
		}
    </script>
</html>