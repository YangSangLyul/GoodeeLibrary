<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지사항</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            #container{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                margin-top: 55px;
                width: 700px;
                height: 100px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
            } 
            #search{
                position: absolute;
                left: 1035px;
    			top: 145px;
            }
            #write{
                position: absolute;
                left: 1180px;
                top: 185px;
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
    	<jsp:include page="header.jsp"/>
    	<div id="container">
	        <select name="searchType">
	            <option value="all">전체</option>
	            <option value="subject">제목</option>
	            <option value="content">내용</option>
	        </select>    
	        <input type="text"/> 
	        <input type="button" value="검색" id="search"/>
	        <input type="button" value="공지등록" id="write" onclick="location.href='noticewriteForm'"/>
	        <table>
	            <tr>
	                <th>글번호</th>
	                <th>제목</th>
	                <th>등록일</th>
	                <th>팝업여부</th>
	            </tr>
	            <c:forEach items="${notice}" var="notice">
		            <tr>
		                <td>${notice.noticeidx}</td>
		                <td><a href="noticeDetail?idx=${notice.noticeidx}">${notice.subject}</a></td>
		                <td>${notice.reg_date}</td>
		                <!-- 팝업은 하나만 가능하니까 radio로 했음 -->
		                <c:if test="${notice.noticestatus eq 'true'}">
			                <td><input type="radio" id="popupCk" checked onclick="return(false);"/></td>
		                </c:if>
		                <c:if test="${notice.noticestatus ne 'true'}">
			                <td><input type="radio" id="popupCk" onclick="return(false);"/></td>
		                </c:if>
		            </tr>
	            </c:forEach>
	        </table>
	        <!-- 페이징 여기서 -->
    	</div>
    </body>
    <script>
	    var msg = "${msg}";
	    if(msg != ""){
	    	alert(msg);
	    }
    </script>
</html>