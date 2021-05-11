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
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<style>
    #qdBackground{
      /*   background-color: wheat; */
      	border: 1px solid gray;
             width: 900px;
            height: 610px;
            position: absolute;
            left: 28%;
            top: 26%;
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
            
            
              #titleMenu {
            border: 1px solid black;
            background-color: blue;
            width: 200px;
            height: 50px;
            text-align: center;
            padding-top: 20px;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 40px;
            text-align: center;
            padding-bottom: 20px;
        } 
         a{
            color:white
        }
        a:link,a:visited{
            color: black;
            text-decoration: none;
        } 
          #sid{
         position: absolute;
         top: 17%;
         left: 11%;
        }
   		.bccc{
   		position: absolute;
   		
   		}
   		i{
   		font-size: 51px;
   		}
   		button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
<body>
<jsp:include page="header.jsp"/>
<div id="sid">
<jsp:include page="bookuseSidebar.jsp"/>
</div>
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
        <tr > 
            <td colspan="2">문의내용 <br>
            <div style="height: 100px; overflow: scroll;">${map.CONTENT}</div>
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
	
	<c:set var="id" value="${sessionScope.loginId}"/>
	<c:set var="mapid" value="${map.ID}"/>
	<c:if test="${id eq mapid}">
	
    <button onclick="location.href='/questionDetail/QuestionEdit/${map.QUEIDX}'" class="bccc" style="top: 85%;left: 27%;width: 70px;height: 40px;">수정하기</button>
    </c:if>
    
    <button onclick="location.href ='/QuestionAll'" class="bccc" style="top: 85%;left: 47%; width: 70px;height: 40px;">목록</button>
    
    <c:if test="${id eq mapid}">
    <button onclick="location.href='/questionDetail/questiondelete/${map.QUEIDX}'" class="bccc" style="top: 85%;left: 65%; width: 70px;height: 40px;">삭제</button>
    </c:if>
    </div>
    
</body>
<script type="text/javascript">
$("#libraryInfo").css('background-color','#337ab7').css("color","white");

$(".menu:eq(3)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(3)").css("background-color","#337ab7");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
})

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