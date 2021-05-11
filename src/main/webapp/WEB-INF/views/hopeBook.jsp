<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>HopeBookRequest</title>
        <style>
            #container{
                position: absolute;
                left: 25%;
                width: 60%;
            }
 
            table{
                margin-left: 100px;
                
                width: 70%;
                height: 60%;
                border-radius: 5px;
            }

            table,td,th{
                border: 1px solid gray;
                border-collapse: collapse;
                text-align: center;
            }
            
            td,th{
            	width:50%;
            	height:50px;            }

            table th{
                background-color: #c5d8f1ff;
            }
            
            #reason td,th{
            	height: auto;
            }
            
            textarea{
                width: 80%;
            	height: auto;
            }

            #container button{
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
                position: relative;
                width: 100px;
                height: 50px;
                margin-top: 30px;
                margin-left: 50px;
                left: 40%;
            }
            
            input[type='text']{
            	width: 80%;
            	height: 50%;
            }
            
           #loginOffBox{
                
                
                margin-top: -80px;
            }

            a:link { 
                color: gray; 
                text-decoration: none;
            }
            a:visited {
                color: gray; 
                text-decoration: none;
            }
            a:hover {
                color: gray;
            }
            
           #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
        </script>
    </head>
    <body onload="printClock()">
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="dataserchSidebar.jsp"></jsp:include>
        </div>
        
        <!-- 검색창 영역-->
        <div id="container">
            <h2>희망도서 신청</h2>
            <hr/>
			<form id='hopeReq' action="hopeBookReq" method="POST">
            <table>
                <tr>
                    <th>신청일자</th>
                    <td><span id="time"></span></td>
                </tr>
                <tr>
                    <th>신청자 *</th>
                    <td><input type="text" name="userId" value="${sessionScope.loginId}" readonly style="background-color:gray;"/></td>
                </tr>
                <tr>
                    <th>희망도서명 *</th>
                    <td><input type="text" id="hopeBook" name="hopeBook" /></td>
                </tr>
                <tr>
                    <th>저자 *</th>
                    <td><input type="text" id="writer" name="writer" /></td>
                </tr>
                <tr>
                    <th>출판사 *</th>
                    <td><input type="text" id="publisher" name="publisher" /></td>
                </tr>
                <tr id="reason">
                    <th>신청사유 *</th>
                    <td><textarea id="reasonText" name="reason"></textarea></td>
                </tr>
            </table>
            </form>
            <button>신청하기</button>
        </div>
        

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(3)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(3)").css("background-color","#337ab7");
        $(".menu:eq(2)").css("backgroundColor", "white");
        $(".menu:eq(0)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
    })
    
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
    
    var cnt = 1;
    //시계.. printClock, addZeros 함수 인용 출처 : https://bbaksae.tistory.com/23
    function printClock() {

        var clock = document.getElementById("time");            // 출력할 장소 선택
        var currentDate = new Date();                                     // 현재시간
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
        var amPm = 'AM'; // 초기값 AM

        clock.innerHTML = calendar;
        
        setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
    }
    
    $('button').click(function(){
    	if($("#hopeBook").val() == ''){
    		alert('희망도서명을 입력해주세요.');
    	}else if($("#writer").val() == ''){
    		alert('저자를 입력해주세요');
    	}else if($("#publisher").val() == ''){
    		alert('출판사를 입력해주세요.');
    	}else if($("#reasonText").val() == ''){
    		alert('신청사유를 입력해주세요')
    	}else {
    		$("#hopeReq").submit();	
    	}
    	
    	
    })
    </script>


</html>