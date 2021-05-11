<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지사항 상세보기</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            #container{
                width: 900px;
                margin: 20px 550px;
                /* text-align: center; */
            }
            table{
                margin-top: 180px;
    			margin-left: 200px;
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
            }
            #btn{
                margin-left: 665px;
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
    		<input type="hidden" value="${detail.noticeidx}"/>
	        <table>
	            <tr>
	                <th>제목</th>
	                <td>${detail.subject}</td>
	            </tr>
	            <tr>
	                <th>내용</th>
	                <td id="content">${detail.content}</td>
	            </tr>
	            <tr>
	            	<th>날짜</th>
	                <td>${detail.reg_date}</td>
	            </tr>
	            <tr>
	                <!-- 글을 쓰거나 수정 할 때 팝업체크 여부에 따라 값이 고정되게 수정하기 -->
	                <td colspan="2" style="text-align: center; font-size: 22px; font-weight: 600;">
	                	팝업<input type="checkbox" id="state" value="${detail.noticestatus}" onclick="return(false);">
	                </td>
	            </tr>
	        </table>
	        <br/>
	        <div id="btn">
	            <button onclick="location.href='noticeDel?idx=${detail.noticeidx}'">삭제하기</button>
	            <button onclick="location.href='noticeEditForm?idx=${detail.noticeidx}'">수정하기</button>
	            <button onclick="location.href='adminNotice'">이전으로</button>
	        </div>
    	</div>
    </body>
    <script>
    	$("#adminLibraryInfo").css('background-color','#337ab7').css("color","white");
    
	    var msg = "${msg}";
	    if(msg != ""){
	    	alert(msg);
	    }
	    
	    function popCk() {
	    	var state = document.getElementById("state");
	    	var stateR = $("input:checkbox[id='state']").val();
	    	console.log($("input:checkbox[id='state']").val());
	    	if(stateR =="true"){
	    		state.checked = true;
	    	}else{
	    		state.checked = false;
	    	}
		}
	    popCk();
    </script>
</html>