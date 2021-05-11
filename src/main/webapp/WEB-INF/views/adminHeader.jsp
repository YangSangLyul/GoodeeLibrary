<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String loginId = (String) request.getSession().getAttribute("loginId");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>navgation bar</title>
        <style>
            #home{
                font-size: 50;
                color: blue;
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

            #topMenu{
                height: 30px;
                margin-left: 20%;
                margin-top: -10px;
            }

            #topMenu ul{
                /* 메인 메뉴 안의 ul을 설정 : 상위메뉴+하위메뉴*/
                list-style-type: none;
                margin: 0px;
                padding: 0px;
            }

            #topMenu ul button{
                /*메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴)*/
                color: gray;
                background-color: white;
                float: left;
                line-height: 30px;
                vertical-align: middle;
                text-align: center;
                position: relative;
                margin-left: 30px;
                border: 1px solid gray;
                border-radius: 5px;
                width: 200px;
            }

            .topMenuNotice{
                position: absolute;
                margin-left: 1500px;
                margin-top: -60px;
            }

            .topMenuNotice button{
                border: 0;
                outline: 0;
            }

            #loginOffBox{
                
                float: right;
                margin-top: -80px;
            }
            #loginOnBox{
                float: right;
                margin-top: -80px;
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
        </style>
        
    </head>
    <body>
        <div id="home">
            <a href="./"><i>구디 도서관</i></a>
        </div>

        
        <nav id="topMenu">
            <!-- 관리자 메뉴 영역(관리자 로그인 시 나타남)-->
            <div id="adminMenu">
                <ul>
                    <li class="topMenuLi"> 
                        <button id="adminLibraryInfo">공지사항</button>
                    </li>
        
                    <li class="topMenuLi">
                        <button id="adminLibraryBook">도서 관리</button>
                    </li>
        
                    <li class="topMenuLi">
                        <button id="adminLibraryReview">리뷰 관리</button>
                    </li>
                    <li class="topMenuLi">
                        <button id="adminLibraryQuestion">문의 내역</button>
                    </li>    
                </ul>
            </div>
        </nav>

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
        <br/>
        <hr/>
    </body>
	<script>
	
	$("#adminLibraryInfo").click(function(){
		location.href = 'adminNotice';
	})
	$("#adminLibraryBook").click(function(){
		location.href = 'bookList';
	})
	$("#adminLibraryReview").click(function(){
		location.href = 'ReviewKing';
	})
	$("#adminLibraryQuestion").click(function(){
		location.href = 'questionList';
	})
		
	</script>

</html>