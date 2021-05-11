<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String loginId = (String) request.getSession().getAttribute("loginId");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자서비스</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
        	#container{
        		padding: 50px;
			    margin-top: 58px;
			    margin-left: 130px;
			    font-size: 20px;
        	}
        	#home{
                font-size: 50;
                color: blue;
                margin-left: 170px;
            }
            
            #home a:link { 
                color: blue; 
                text-decoration: none;
            }
            #home a:visited {
                color: blue; 
                text-decoration: none;
            }
            #home a:hover {
                color: blue;
            }
            #tabMenu, h3{
                width: 800px;
                margin: 20px 550px;
                text-align: center;
            }
            h3{
            	margin-top: 100px;
            }
            #tabMenu{
            	margin-top: 50px;
            }
            table{
                width: 650px;
                height: 100px;
                margin: auto;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            } 
            button{
                padding: 50px;
			    margin-top: 13px;
			    font-size: 20px;
            }
            h4{
                text-align: left;
            }
            input[type='button']{
                position: absolute;
                left: 1170px;
                top: 230px;
            }
            #loginOffBox{
                float: right;
                margin-top: -35px;
                margin-right: 400px;
            }
            #loginOnBox{
                float: right;
                margin-top: -35px;
                margin-right: 400px;
            }
            #loginOffBox a:link { 
                color: blue; 
                text-decoration: none;
            }
            #loginOffBox a:visited {
                color: blue; 
                text-decoration: none;
            }
            #loginOffBox a:hover {
                color: blue;
            }
            
            #loginOnBox a:link { 
                color: blue; 
                text-decoration: none;
            }
            #loginOnBox a:visited {
                color: blue; 
                text-decoration: none;
            }
            #loginOnBox a:hover {
                color: blue;
            }
            
            button{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
    </head>
    <body>
    	<div id="home">
            <a href="./"><i>구디 도서관</i></a>
        </div>
        <c:if test="${sessionScope.loginId eq null}">
        <div id="loginOffBox">
            <a href="memJoinForm">회원가입 </a>
            |
            <a href="memLogin"> 로그인</a>
        </div>
        </c:if>
        <c:if test="${sessionScope.loginId ne null}">
        <div id="loginOnBox">
            	${sessionScope.loginId} 님 반갑습니다. | 
            <a href="memLogout"> 로그아웃</a>
        </div>
        </c:if>
        <div id="container">
	        <h3>관리하고자 하는 메뉴를 선택 해주세요.</h3>
	        <div id="tabMenu">
	            <button onclick="location.href='adminNotice'">공지사항</button>
	            <button onclick="location.href='bookList'">도서관리</button>
	            <button onclick="location.href='ReviewKing'">리뷰관리</button>
	            <button onclick="location.href='questionList'">문의내역</button>
	        </div>
        </div>
       <%--  <hr/>
        <h4>알림 내역</h4>
        <input type="button" value="더보기" id="moreBtn"/>
        <table>
            <tr>
                <th>종류</th>
                <th>알림내용</th>
                <th>수신일</th>
            </tr>
            <c:forEach items="${noti}" var="noti">
	            <tr>
	                <td>${noti.noType}</td>
	                <td>${noti.content}</td>
	                <td>${noti.read_date}</td>
	            </tr>
            </c:forEach>
        </table>         --%>
    </body>
</html>