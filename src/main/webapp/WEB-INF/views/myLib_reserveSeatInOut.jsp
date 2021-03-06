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
        <!-- ?????? ?????? -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
        </div>
        
        <div id="userInOut">
        	<span style="color: blue;">${loginId}</span>
        	&nbsp;&nbsp;?????? ???/?????? ??????
        </div>
        
        <div id="container">
        	<div id="today">
        	</div>
        
        	
        	<a href="./seatEnterExitHistory" style="position: relative;top: 80%; left:20%;">?????? ?????? ????????????</a>
        	
        	<div id="enterContainer">
        		<div id="clock">
        		</div>
        		
        		<p id="reserveTime">?????? ??????</p>
        		<p id="reserveStart"></p>
        		
        	</div>
        	<div id="exitBox">
        		
        		<p id="exitTime">?????? ??????</p>
        		<p id="reserveEnd"></p>
        	</div>
        </div>
        
        
        <div id="noReserveContainer">
        	<div id="cantReserve">
        		?????? ????????? ????????? ????????????!!!
        	</div>
        	
        	<a id="goReserve" href="./reserveSeatForm" style="position: relative;top: 35%; left:15%;">?????? ???????????? ??????</a>
        	
        	<a href="./seatEnterExitHistory" style="position: relative;top: 80%; left:20%;">?????? ?????? ????????????</a>
        	
        </div>

    </body>
    <script>
    
    $("#libraryMy").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(0)").css("background-color","#337ab7").css("color","white");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7").css("color","white");
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
    	
    	//????????? ????????? ????????? ?????? ????????? ?????? ui??? ????????????
    	if(list != "" && seatState == "S002"){
    		console.log('????????? ????????? ??????!');
    		$("#noReserveContainer").css("display","none");
    		$("#reserveStart").html(startTime+amPm);
    		$("#reserveEnd").html(endTime+exitAmPm);
    		$("#enterContainer").append("<button id='enter' onclick='enterReq()'>??????</button>");
    		$("#enterContainer").append("<button id='reserveCancel' onclick='reserveCancelReq()'>????????????</button>");
    		$("#enterContainer").append("<p id='cantEnter'>??????????????? ????????????.</p>");
    		$("#exitBox").append("<button id='exit' onclick='exitReq()'>??????</button>");
    	//???????????? ????????? ????????? ?????? ????????? ????????????.
    	}else if(list != "" && seatState == "S003"){
    		console.log('???????????? ????????? ??????!');
    		$("#noReserveContainer").css("display","none");
    		$("#reserveStart").html(startTime+amPm);
    		$("#reserveEnd").html(endTime+exitAmPm);
    		$("#enterContainer").append("<p id='Entering'>?????? ??????????????????.</p>");
    		$("#cantEnter").css("display","none");
    		$("#Entering").css("visibility","visible");
    		$("#Entering").css("top","0%");
    		$("#exitBox").append("<button id='exit' onclick='exitReq()'>??????</button>");
    		$("#exit").css("display","inline");
    	//?????? ????????? ????????? ?????????????????? ????????? ??? ?????? ui??? ????????????.
    	}else{
    		$("#noReserveContainer").css("display","block");
    		$("#container").css("display","none");
    	}
    }
    
    seatList();
    
    //??????.. printClock, addZeros ?????? ?????? ?????? : https://bbaksae.tistory.com/23
    function printClock() {
    	
    	var list = "${mySeat}";

        var clock = document.getElementById("clock");            // ????????? ?????? ??????
        var today = document.getElementById("today");
        var currentDate = new Date();                                     // ????????????
        var calendar = currentDate.getFullYear() + " - " + (currentDate.getMonth()+1) + " - " + currentDate.getDate(); // ?????? ??????
        var amPm = 'AM'; // ????????? AM
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes() ,2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
        if(currentHours >= 12){ // ????????? 12?????? ??? ??? PM?????? ??????, 12??? ??????
            amPm = 'PM';
            
        }

        if(currentSeconds >= 50){// 50??? ????????? ??? ?????? ????????? ??????.
        currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
        }
        //clock.innerHTML = "?????? ?????? : "+ amPm + " " + currentHours+"??? "+currentMinute+"??? "+currentSeconds+"???"; //????????? ????????? ???
        today.innerHTML = calendar;
        
        if(list != ""){
        	clock.innerHTML = "?????? ?????? <br/>"+ currentHours+" : "+currentMinute+" " +amPm; //????????? ????????? ???
        }
        
        
        setTimeout("printClock()",1000);         // 1????????? printClock() ?????? ??????
    }

    function addZeros(num, digit) { // ????????? ????????????
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
    	
    	console.log('?????? ?????? ?????????');
    	
    	<fmt:formatDate var="start" value="${mySeat.reserveStart}" pattern="HH"/>
        <fmt:parseNumber var="intStart" value="${start}" integerOnly="true"/>
        
        var startTime = "${intStart}";
        var currentDate = new Date();                                     // ????????????
        var currentHours = currentDate.getHours(); 
        var currentMinute = currentDate.getMinutes();
        
        //?????? 9?????? ?????????????????? 9??? 10?????? ???????????? ?????? ?????????
        if((currentHours == startTime - 1 && currentMinute < 50)){
        	console.log('?????? ???????????? ??????!');
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
						$("#enterContainer").append("<p id='Entering'>?????? ??????????????????.</p>");
						$("#Entering").css("visibility","visible");
						$("#Entering").css("top","0%");
						$("#cantEnter").css("display","none");
						alert('????????? ?????????????????????!');
						location.reload();
					}else{
						alert('????????? ????????? ????????? ????????????...');
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
        var currentDate = new Date();                                     // ????????????
        var currentHours = currentDate.getHours(); 
        var currentMinute = currentDate.getMinutes();
        
        console.log(startTime,"/",currentHours);
        
        //???????????? 10???????????? ????????? ????????? ??? ??????...
        if((startTime < currentHours && currentMinute >= 50) || startTime < currentHours){
        	console.log('?????? ??????????????? ??? ?????? ?????? ??????!');
        	alert('???????????? 10??????????????? ????????? ????????? ??? ????????????!');
        } else{
        	console.log('?????? ??????????????? ??? ??????');
 			$.ajax({
				url:'./reserveCancelReq'
				,type:'GET'
				,data:{}
				,dataType:'JSON'
				,success:function(data){
					console.log(data);
					if(data.success > 0){
						alert('??????????????? ?????????????????????!');
						location.reload();
					}else{
						alert('??????????????? ?????????????????????...');
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
						alert('?????? ????????? ???????????????.');
						location.reload();
					}else{
						alert('?????? ????????? ?????? ???????????????...');
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
			
			console.log('???????????? ??????!');
		}
    	}
    	test(); */
    </script>


</html>