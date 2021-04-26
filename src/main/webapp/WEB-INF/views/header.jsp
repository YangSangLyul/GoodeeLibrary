<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>navgation bar</title>
        <style>
            table,td,th{
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px 10px;
                background-color: #c5d8f1ff;
                color: blue;
            }
            #home{
                font-size: 50;
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

            #adminMenu{
                display: none;
            }

            #adminService{
                display: none;
            }

            #loginOffBox{
                
                float: right;
                margin-top: -80px;
            }
            #loginOnBox{
                display: none;
                float: right;
                margin-top: -80px;
            }
            a:link { 
                color: blue; 
                text-decoration: none;
            }
            a:visited {
                color: blue; 
                text-decoration: none;
            }
            a:hover {
                color: blue;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <div id="home">
            <a href="./"><i>구디 도서관</i></a>
        </div>

        
        <nav id="topMenu">
            <!-- 일반 유저 메뉴 영역-->
            <div id="userMenu">
            <ul>
                <li class="topMenuLi"> 
                    <button id="libraryInfo">도서관 이용안내</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="libraryService">도서관 서비스</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="librarySearch">자료 검색</button>
                </li>
                <li class="topMenuLi">
                    <button id="libraryMy">마이 라이브러리</button>
                    <!-- onclick="location.href='myLibrary'" -->
                    
                    <!-- 관리자가 로그인할 경우 나타나게 될 메뉴
                         마이 라이브러리는 숨김처리 됨
                    -->
                    <button id="adminService">관리자 서비스</button>
                </li>
            </ul>
            </div>
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


        <div class="topMenuNotice">
            <a href="#"><img id="light" src="./image/알림.jpg" width="100" height="80"/></a>
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
            user1님 반갑습니다. | 
            <a href="#"> 로그아웃</a>
        </div>
        </c:if>
        <br/>
        <hr/>
    </body>
	<script>
		$("#librarySearch").click(function(){
			location.href = 'booksSearch';
		});
	</script>

</html>