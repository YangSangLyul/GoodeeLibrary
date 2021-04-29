<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>열람실 좌석 예약</title>
        <style>
        	
        	#sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        	
        	#container{
        		position: relative;
        		margin-top: 1%;
        		left: 20%;
        		width: 70%;
        		height: 80%;
        		border: 1px solid gray;
        		background-color: #eeece1ff;
        	}
        	
        	#useState{
        		background-color: #ea9999ff;
        		
        	}
        	
        	#reservingState{
        		background-color: #fff2ccff;
        	}
        	
        	
        	#reserveOkState{
        		background-color: #f3f3f3ff;
        	}
        	
        	#reserveNoState{
        		background-color: #666666ff;
        		color: white;
        	}
        	
        	#stateList{
        		margin-left: 150px;
        	}
        	
        	.stateBox{
        		font-size: 15px;
        		border: 1px solid gray;
        		padding-top: 10px;
        		width: 150px;
        		height: 50px;
        		float: left;
        		margin-left: 20px;
        		margin-top: 20px;
        		text-align: center;
        	}
        	
        	#time{
        		font-size: 30px;
        		width: 400px;
        		height: 50px;
        		border: 1px solid gray;
        		margin-right: 50px;
        		margin-top: 20px;
        		float: right;
        		text-align: center;
        	}
        	
        	#reserveNotice{
        		padding: 5px;
        		font-size: 30px;
        		position: absolute;
        		border: 1px solid gray;
        		text-algin: center;
        		width: 900px;
        		left: 10%;
        		top: 15%;
        	}
        	
        	#reserveBtn{

        		left: 70%;
        		top: 15%;
        		position: absolute;
        	}
        	
        	#reserveBtn button{
        	    width: 100px;
        		height: 50px;
        	}
        	
        	#tblHeader{
        		position: fixed;
        		left: 27.2%;
        		top: 37%;
        	}
        	
        	#tblMain{
        		
        		position: relative;
        	}
        	

        	td{
        		width: 130px;
        		height: 50px;
        		padding: 5px;
        	}
        	
        	th{
        		width:95px;
        	}
        	
        	#tblHeader th,td{
        		width:95px;
        		height: 50px;
        	}
        	
        	table,th,td,tr{
        		background-color: white;
        		border: 1px solid gray;
        		border-collapse: collapse;
        	}
        	
        	#tbl{
        		left: 10%;
        		top: 36%;
        		position: absolute;
        		width:1090px;
        		height:550px;
        		overflow-y: auto; 
        	}
        	
        	input[type="checkbox"]{
        		width:100%;
        		height:100%;
        	}
        	
       	#test:checked~tr{
       	background-color:red;
       	}
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
	    function check(it) {
	    	  tr = it.parentNode.parentNode;
	    	  console.log("셀"+tr);
	    	  tr.style.backgroundColor = (it.checked) ? "gold" : "white";
	    	}
        </script>
    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <!-- 사이드바 영역 -->
		<div id="sideBar">
        	<jsp:include page="bookserviceSidebar.jsp"/>
		</div>
		<div id="container">
			<div id="stateList">
				<div class="stateBox" id="useState">
					사용중
				</div>
				<div class="stateBox" id="reservingState">
					예약중
				</div>
				<div class="stateBox" id="reserveOkState">
					예약가능
				</div>
				<div class="stateBox" id="reserveNoState">
					예약불가
				</div>
				
				<div id="time">
					현재 시간 : AM ?시 ??분
				</div>
			</div>
			
			<div id="reserveNotice">
				원하시는 좌석과 시간을 체크해주시고 예약하기를 클릭해주세요.
			</div>
			
			<div id="reserveBtn">
				<button id="reserveSubmit">예약하기</button>
			</div>
			
			<!-- 예약 테이블 -->
			
			<table id="tblHeader">
				<tr>
					<th>시간/좌석</th>
					<td>09:00~10:00</td>
					<td>10:00~11:00</td>
					<td>11:00~12:00</td>
					<td>12:00~13:00</td>
					<td>13:00~14:00</td>
					<td>14:00~15:00</td>
					<td>15:00~16:00</td>
					<td>16:00~17:00</td>
					<td>17:00~18:00</td>
				</tr>
			</table>
			<div id="tbl">
			<form name="dragchkform" method="GET">
			
			<table id="tblMain" style="background-color: white;">	
			
			<c:forEach items="${list}" var="seat">
			
				<tr>
					<th>${seat.seatNumber}<input type="radio" class="seatChk" name="seatNum"  value="${seat.seatNumber}" onclick="resetChk(this)"/></th>
					
					<c:forEach items="${reserveList}" var="reserve" varStatus="status">
					<fmt:formatDate var="start" value="${reserve.reserveStart}" pattern="HH"/>
					<fmt:formatDate var="end" value="${reserve.reserveEnd}" pattern="HH"/>
					<fmt:parseNumber var="intStart" value="${start}" integerOnly="true"/>
					<fmt:parseNumber var="intEnd" value="${end}" integerOnly="true"/>
					<td>
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '09' || intEnd < '09')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="09"/>
					</c:if>
					</td>
					
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '10' || intEnd < '10')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="10"/>
					</c:if>
					</td>
					<td>
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '11' || intEnd < '11')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="11"/>
					</c:if>
					</td>
					<td>
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '12' || intEnd < '12')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="12"/>
					</c:if>
					</td>
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '13' || intEnd < '13')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="13"/>
					</c:if>
					</td>
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '14' || intEnd < '14')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="14"/>
					</c:if>
					</td>
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '15' || intEnd < '15')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="15"/>
					</c:if>
					</td>
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '16' || intEnd < '16')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="16"/>
					</c:if>
					</td>
					<td>					
					<c:if test="${reserve.seatNumber != seat.seatNumber || (intStart > '17' || intEnd < '17')}">
					<input type="checkbox" class="timeChk" name="seatTime" value="17"/>
					</c:if></td>
					</c:forEach>
				</tr>
			</c:forEach>
			</table>
			</form>
			</div>
			
		</div>

    </body>
    <script>
    	//체크박스 드래그
	    var dragchkstat = "off"; 
	    function dragchkNOOP() { return false; } 
	    function dragchkOnMouseDown() { 
	            if (this.checked) { 
	                    dragchkstat = "uncheck"; this.checked = false; 
	            } else { 
	                    dragchkstat = "check"; this.checked = true; 
	            } 
	            return false; 
	    } 
	    function dragchkOnMouseOver() { 
	            switch (dragchkstat) { 
	                    case "off": 
	                            break; 
	                    case "check": 
	                            this.focus(); this.checked = true; break; 
	                    case "uncheck": 
	                            this.focus(); this.checked = false; break; 
	            } 
	            return false; 
	    } 
	    function dragchkOnMouseUp() { dragchkstat = "off"; return true; } 
	    for (i = 0; i < document.dragchkform.seatTime.length; i++) { 
	            document.dragchkform.seatTime[i].onclick = dragchkNOOP; 
	            document.dragchkform.seatTime[i].onmousedown = dragchkOnMouseDown; 
	            document.dragchkform.seatTime[i].onmouseover = dragchkOnMouseOver; 
	            document.onmouseup = dragchkOnMouseUp; 
	    } 
	    
	    
	    $("#reserveSubmit").click(function(){
	    	console.log($('input:checkbox[name=seatTime]:checked'));
	    	
	    	//1차 조건 : 좌석 체크 여부
	    	if($('input:radio[name=seatNum]:checked').length > 0){
	    		
	    		//2차 조건 시간 선택 여부
		    	if($('input:checkbox[name=seatTime]:checked').length > 0){
		    		//자바스크립트의 경우 tr의 행 주소값을 가져올때 rowIndex를 사용하고 제이쿼리는 index를 사용함
		    		//새로운 조건 추가
		    		console.log($('input:radio[name=seatNum]:checked').parent().parent().index());
		    		if($('input:radio[name=seatNum]:checked').parent().parent().index() != $('input:checkbox[name=seatTime]:checked').parent().parent().index()){
		    			alert('현재 선택한 좌석외의 좌석의 시간은 선택할 수 없습니다!!!');
		    			for(var i=0;i<=$('input:checkbox[name=seatTime]').length;i++){
		    				$('input:checkbox[name=seatTime]')[i].checked = false;	
		    			}
		    			
		    		}
		    		console.log($('input:checkbox[name=seatTime]:checked').parent().parent().index());
		    		alert('1개 이상 선택 되었음');
		    	}else{
		    		alert('좌석 시간을 체크해주세요');	    	
		    	}
	    	}else{
	    		alert('좌석을 체크해야합니다.');
	    	}
	    	

	    });
	    
	    //연속으로 선택할수만 있게
	    $(function(){
	        $(".timeChk").click(function(){
	            var timeChk = new Array();
	            var i=0;
	            $(".timeChk").each(function(index){
	                if($(this).is(":checked")){
	                	timeChk[i]=index;
	                    i++;
	                }
	            });
	            if(timeChk.length != 1){
	                var temp = timeChk[0];
	                for(var k=1; k<timeChk.length; k++){
	                    if(temp+k != timeChk[k]){
	                        alert("연속으로 체크하셔야 합니다.");
	                        if($(this).is(":checked"))
	                            $(this).is(":checked",false);
	                        else
	                            $(this).is(":checked",true);
	                        return false;
	                    }
	                }
	            }
	        });    
	    });
	    
	    function whatRowNumber(dis){
	    	
	    	
	    	var chk = dis.parentNode.parentNode.rowIndex;

		    
		    console.log(radioIdx+"/"+chk);
	    	
	    }
	    
		function resetChk(chk){
				  const checkboxes 
				       = document.getElementsByName('seatTime');
				  
				  checkboxes.forEach((checkbox) => {
				    checkbox.checked = false;
				  });
				
			
		}
	    


    
    </script>


</html>