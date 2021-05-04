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
<body>
<div id="home">
            <a href="./"><i>구디 도서관</i></a>
        </div>

        
        <nav id="topMenu">
            <!-- 일반 유저 메뉴 영역-->
            <div id="userMenu">
            <ul>
                <li class="topMenuLi"> 
                    <button id="libraryInfo" onclick="location.href='../notice'">도서관 이용안내</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="libraryService" onclick="location.href='../reserveSeatForm'">도서관 서비스</button>
                </li>
    
                <li class="topMenuLi">
                    <button id="librarySearch">자료 검색</button>
                </li>
                <li class="topMenuLi">
                    <button id="libraryMy" onclick="location.href='../MyLibrary'">마이 라이브러리</button>
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
            <a href="#"><img id="light" src="/image/알림.jpg" width="100" height="80"/></a>
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
        <br/>
        <hr/>
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
    
    <button onclick="location.href='/questionDetail/QuestionEdit/${map.QUEIDX}'">수정하기</button>
    <button onclick="location.href ='/QuestionAll'">목록</button>
    <button onclick="">삭제</button>
</body>
<script type="text/javascript">
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

$("#librarySearch").click(function(){
	location.href = '../booksSearch';
});

function menuCall(){
	var loginId = "${sessionScope.loginId}";
	
	console.log('현재 로그인한 사람 ',loginId);
	
	if(loginId == 'admin'){
		$("#libraryMy").css("display","none");
		$("#adminService").css("display","inline");
		
		$("#adminService").click(function(){
			location.href = 'adminService';
		});
	}
}

menuCall();
</script>
</html>