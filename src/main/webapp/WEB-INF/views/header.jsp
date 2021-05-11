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
                font-size: 50px;
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
        </style>
        
    </head>
    <body>
        <div id="home">
            <a href="../../../"><i>구디 도서관</i></a>
        </div>

        
        <nav id="topMenu">
            <!-- 일반 유저 메뉴 영역-->
            <div id="userMenu">
            <ul>
                <li class="topMenuLi"> 
                    <button id="libraryInfo" onclick="location.href='../../../wayFind'">도서관 이용안내</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="libraryService" onclick="location.href='../../../reviewList'">도서관 서비스</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="librarySearch">자료 검색</button>
                </li>
                <li class="topMenuLi">
                    <button id="libraryMy" onclick="location.href='../../../myLib_reserveSeatInOut'">마이 라이브러리</button>
                    <!-- onclick="location.href='myLib_reserveSeatInOut'" -->
                    
                    <!-- 관리자가 로그인할 경우 나타나게 될 메뉴
                         마이 라이브러리는 숨김처리 됨
                    -->
                    <button id="adminService">관리자 서비스</button>
                </li>
            </ul>
            </div>
        </nav>

		
        <div class="topMenuNotice">

            <a href="./userNotification"><img id="light" src="../../image/알림.jpg" width="100" height="80"/></a>
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
            <a href="../../memLogout"> 로그아웃</a>
        </div>
        </c:if>
        <br/>
        <hr/>
    </body>
	<script>
		$("#librarySearch").click(function(){
			location.href = '../../booksSearch';
		});
		
		function menuCall(){
			var loginId = "${sessionScope.loginId}";
			
			console.log('현재 로그인한 사람 ',loginId);
			
			if(loginId == 'admin'){
				$("#libraryInfo").click(function(){
					location.href = 'adminNotice';
				});
				$("#libraryMy").css("display","none");
				$("#adminService").css("display","inline");
				
				$("#adminService").click(function(){
					location.href = 'adminService';
				});
			}
			
			if(loginId == 'admin' || loginId == ''){
				$(".topMenuNotice").css('display','none');
				$("#libraryMy").css('display','none');
			}else{
				$(".topMenuNotice").css('display','block');
				$("#libraryMy").css('display','block');
			}
		}
		
		menuCall();
		
		
		$("#notification").click(function() {
			location.href = './userNotification';
		})
	</script>

</html>