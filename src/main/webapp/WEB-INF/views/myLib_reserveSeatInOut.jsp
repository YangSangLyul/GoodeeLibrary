<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>InOut</title>
        <style>
        	#userInOut{
        		position: absolute;
        		border: 1px solid black;
        		width: 800px;
        		height: 50px;
        		font-size: 30px;
        		font-weight: 600;
        		text-align: center;
        		margin-left: 25%;
        		margin-top: 3%;
        	}
        
           #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        	
        	#container{
        		position: absolute;
        		border: 1px solid black;
        		width: 1050px;
        		height: 700px;
        		font-size: 30px;
        		font-weight: 600;
        		text-align: center;
        		margin-left: 20%;
        		margin-top: 7%;
        		background-color: #eeece1ff;
        	}
        	
        	#noReserveContainer{
        		position: absolute;
        		border: 1px solid black;
        		width: 1050px;
        		height: 700px;
        		font-size: 30px;
        		font-weight: 600;
        		text-align: center;
        		margin-left: 20%;
        		margin-top: 7%;
        		background-color: #eeece1ff;
        	}
        	
        	#exitBox{
        		position: relative;
        		border: 1px solid black;
        		border-radius: 10px;
        		left: 60%;
        		top: -55%;
        		width: 30%;
        		height: 60%;
        		background-color: white;
        	}
        	
        	#exitTime{
        	    position: relative;
        		left: 10%;
        		top: 30%;
        		width: 80%;
        		height: 20%;
        		font-size: 30px;
        	}
        	
        	#reserveEnd{
        		position: relative;
        		left: 10%;
        		top: 15%;
        		width: 80%;
        		height: 20%;
        		font-size: 30px;
        	}
        	
        	#exit{
        		position: relative;
        		left: 0%;
        		top: 30%;
        		width: 30%;
        		height: 15%;
        		font-size: 20px;
        		display: none;
        	}
        	
        	#cantReserve{
        		position: relative;
        		border: 1px solid black;
        		border-radius: 5px;
        		background-color: white;
        		top: 30%;
        		left: 30%;
        		width: 50%;
        	}
        	
        	#container a:link {
        		color: blue;
        		text-decoration: underline;
        	}
        	
        	#container a:visited {
        		color: blue;
        	}
        	
        	#container a:hover {
        		color: blue;
        	}
        	
        	#noReserveContainer a:link {
        		color: blue;
        		text-decoration: underline;
        	}
        	
        	#noReserveContainer a:visited {
        		color: blue;
        	}
        	
        	#noReserveContainer a:hover {
        		color: blue;
        	}
        	
        	#today{
        		border: 1px solid black;
        		position: relative;
        		left: 40%;
        		top: 5%;
        		width: 30%;
        		background-color: white;
        	}
        	
        	#enterContainer{
        		position: relative;
        		border: 1px solid black;
        		border-radius: 10px;
        		left: 10%;
        		top: 5%;
        		width: 30%;
        		height: 60%;
        		background-color: white;
        	}
        	
        	#clock{
        		position: relative;
        		border: 1px solid black;
        		left: 10%;
        		top: 15%;
        		width: 80%;
        		height: 20%;
        		font-size: 30px;
        	}
        	
        	#reserveTime{
        		position: relative;
        		left: 10%;
        		top: 20%;
        		width: 80%;
        		height: 20%;
        		font-size: 30px;
        	}
        	
        	#reserveStart{
        		position: relative;
        		left: 10%;
        		top: 5%;
        		width: 80%;
        		height: 20%;
        		font-size: 30px;
        	}
        	
        	#enter{
        		position: relative;
        		left: -15%;
        		top: 10%;
        		width: 20%;
        		height: 15%;
        		font-size: 20px;
        	}
        	
        	#reserveCancel{
        		position: relative;
        		left: 8%;
        		top: 6%;
        		width: 20%;
        		height: 15%;
        		font-size: 20px;
        	}
        	
        	#cantEnter{
        		position: relative;
        		left: 8%;
        		top: -20%;
        		width: 80%;
        		height: 10%;
        		font-size: 20px;
        		color: red;
        		visibility: hidden;
        	}
        	
        	#Entering{
        		position: relative;
        		left: 8%;
        		top: -20%;
        		width: 80%;
        		height: 10%;
        		font-size: 20px;
        		color: red;
        		visibility: hidden;
        	}
        	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

    </head>
    <body onload="printClock()">
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
        </div>
        
        <div id="userInOut">
        	<span style="color: blue;">${loginId}</span>
        	&nbsp;&nbsp;님의 입/퇴실 내역
        </div>
        
        <div id="container">
        	<div id="today">
        	</div>
        
        	
        	<a href="./seatEnterExitHistory" style="position: relative;top: 80%; left:20%;">이전 내역 보러가기</a>
        	
        	<div id="enterContainer">
        		<div id="clock">
        		</div>
        		
        		<p id="reserveTime">예약 시간</p>
        		<p id="reserveStart"></p>
        		
        	</div>
        	<div id="exitBox">
        		
        		<p id="exitTime">퇴실 시간</p>
        		<p id="reserveEnd"></p>
        	</div>
        </div>
        
        
        <div id="noReserveContainer">
        	<div id="cantReserve">
        		당일 열람실 예약이 없습니다!!!
        	</div>
        	
        	<a id="goReserve" href="./reserveSeatForm" style="position: relative;top: 35%; left:15%;">좌석 예약하러 가기</a>
        	
        	<a href="./seatEnterExitHistory" style="position: relative;top: 80%; left:20%;">이전 내역 보러가기</a>
        	
        </div>

    </body>
    <script>
    
    $("#libraryMy").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(0)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7");
        $(".menu:eq(1)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(4)").css("backgroundColor", "white");
        $(".menu:eq(5)").css("backgroundColor", "white");
    })
    
    
    function seatList(){
    	
    	<fmt:formatDate var="start" value="${mySeat.reserveStart}" pattern="HH"/>
    	<fmt:formatDate var="end" value="${mySeat.reserveEnd}" pattern="HH"/>
    	<fmt:parseNumber var="intStart" value="${start}" integerOnly="true"/>
    	<fmt:parseNumber var="intEnd" value="${end + 1}" integerOnly="true"/>
    	
    	var amPm = " AM";
    	var exitAmPm = " AM";
    	var list = "${mySeat}";
    	var seatState = "${mySeat.seatStatus}";
    	var start = document.getElementById("reserveStart");
    	var startChk = "${intStart}";
    	var endChk = "${intEnd}";
    	var startTime = "${intStart}"+" : 00";
    	var endTime = "${intEnd}"+" : 00";
    	var i = 1;
    	console.log(list);
    	console.log(startTime,"/",endTime);
    	console.log(seatState);
    	
    	if(startChk >=12){
    		amPm = " PM";
    	}
    	
    	if(endChk >= 12){
    		exitAmPm = " PM";
    	}
    	
    	//예약한 좌석이 있으면 예약 좌석에 대한 ui를 보여주고
    	if(list != "" && seatState == "S002"){
    		console.log('예약한 좌석이 있음!');
    		$("#noReserveContainer").css("display","none");
    		$("#reserveStart").html(startTime+amPm);
    		$("#reserveEnd").html(endTime+exitAmPm);
    		$("#enterContainer").append("<button id='enter' onclick='enterReq()'>입실</button>");
    		$("#enterContainer").append("<button id='reserveCancel' onclick='reserveCancelReq()'>예약취소</button>");
    		$("#enterContainer").append("<p id='cantEnter'>입실시간이 아닙니다.</p>");
    		$("#exitBox").append("<button id='exit' onclick='exitReq()'>퇴실</button>");
    	//사용중인 좌석이 있으면 퇴실 버튼을 보여준다.
    	}else if(list != "" && seatState == "S003"){
    		console.log('사용중인 좌석이 있음!');
    		$("#noReserveContainer").css("display","none");
    		$("#reserveStart").html(startTime+amPm);
    		$("#reserveEnd").html(endTime+exitAmPm);
    		$("#enterContainer").append("<p id='Entering'>현재 입실중입니다.</p>");
    		$("#cantEnter").css("display","none");
    		$("#Entering").css("visibility","visible");
    		$("#Entering").css("top","0%");
    		$("#exitBox").append("<button id='exit' onclick='exitReq()'>퇴실</button>");
    		$("#exit").css("display","inline");
    	//예약 좌석이 없으면 예약화면으로 유도할 수 있는 ui를 보여준다.
    	}else{
    		$("#noReserveContainer").css("display","block");
    		$("#container").css("display","none");
    	}
    }
    
    seatList();
    
    //시계.. printClock, addZeros 함수 인용 출처 : https://bbaksae.tistory.com/23
    function printClock() {
    	
    	var list = "${mySeat}";

        var clock = document.getElementById("clock");            // 출력할 장소 선택
        var today = document.getElementById("today");
        var currentDate = new Date();                                     // 현재시간
        var calendar = currentDate.getFullYear() + " - " + (currentDate.getMonth()+1) + " - " + currentDate.getDate(); // 현재 날짜
        var amPm = 'AM'; // 초기값 AM
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes() ,2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
        if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
            amPm = 'PM';
            
        }

        if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
        currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
        }
        //clock.innerHTML = "현재 시간 : "+ amPm + " " + currentHours+"시 "+currentMinute+"분 "+currentSeconds+"초"; //날짜를 출력해 줌
        today.innerHTML = calendar;
        
        if(list != ""){
        	clock.innerHTML = "현재 시간 <br/>"+ currentHours+" : "+currentMinute+" " +amPm; //날짜를 출력해 줌
        }
        
        
        setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
        var zero = '';
        num = num.toString();
        if (num.length < digit) {
            for (i = 0; i < digit - num.length; i++) {
            zero += '0';
            }
        }
        return zero + num;
    }
    
    function enterReq(){
    	
    	console.log('입실 요청 들어옴');
    	
    	<fmt:formatDate var="start" value="${mySeat.reserveStart}" pattern="HH"/>
        <fmt:parseNumber var="intStart" value="${start}" integerOnly="true"/>
        
        var startTime = "${intStart}";
        var currentDate = new Date();                                     // 현재시간
        var currentHours = currentDate.getHours(); 
        var currentMinute = currentDate.getMinutes();
        
        //만약 9시로 예약을했으면 9시 10분이 넘어가면 입실 불가능
        if((currentHours == startTime - 1 && currentMinute < 50)){
        	console.log('현재 입실시간 아님!');
        	$("#cantEnter").css("visibility","visible");
        } else{
        	
			$.ajax({
				url:'./seatEnterReq'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data);
					if(data.success > 0){
						$("#enter").css("display","none");
						$("#reserveCancel").css("display","none");
						$("#exit").css("display","inline");
						$("#enterContainer").append("<p id='Entering'>현재 입실중입니다.</p>");
						$("#Entering").css("visibility","visible");
						$("#Entering").css("top","0%");
						$("#cantEnter").css("display","none");
						alert('입실에 성공하였습니다!');
						location.reload();
					}else{
						alert('입실이 가능한 상태가 아닙니다...');
					}
				}
				,error:function(error){
					console.log(error);
				}
			});
        }
        
 	
    }
    
    function reserveCancelReq(){
    	<fmt:formatDate var="start" value="${mySeat.reserveStart}" pattern="HH"/>
        <fmt:parseNumber var="intStart" value="${start - 1}" integerOnly="true"/>
            
        var startTime = "${intStart}";
        var currentDate = new Date();                                     // 현재시간
        var currentHours = currentDate.getHours(); 
        var currentMinute = currentDate.getMinutes();
        
        console.log(startTime,"/",currentHours);
        
        //예약시간 10분전에는 예약을 취소할 수 없다...
        if((startTime < currentHours && currentMinute >= 50) || startTime < currentHours){
        	console.log('현재 예약취소할 수 있는 시간 아님!');
        	alert('예약시간 10분전까지만 예약을 취소할 수 있습니다!');
        } else{
        	console.log('현재 예약취소할 수 있음');
 			$.ajax({
				url:'./reserveCancelReq'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data);
					if(data.success > 0){
						alert('예약취소에 성공하였습니다!');
						location.reload();
					}else{
						alert('예약취소에 실패하였습니다...');
					}
				}
				,error:function(error){
					console.log(error);
				}
			});
        }
    }
    
    function exitReq(){
		$.ajax({
				url:'./seatExitReq'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data);
					if(data.success > 0){
						alert('퇴실 처리가 되었습니다.');
						location.reload();
					}else{
						alert('퇴실 처리가 이미 되었습니다...');
					}
				}
				,error:function(error){
					console.log(error);
				}
			});
           	
    }
    
    
    
    
    
/*     	function test(){
		var d = new Date();
		
		if((d.getHours() >= 18 && d.getHours() <= 23) || (d.getHours() >= 0 && d.getHours() <= 8)){
			
			console.log('예약시간 아님!');
		}
    	}
    	test(); */
    </script>


</html>