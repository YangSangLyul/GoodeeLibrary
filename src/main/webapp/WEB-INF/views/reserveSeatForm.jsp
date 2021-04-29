<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<button>예약하기</button>
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
				<tr>
					<th>1<input type="radio" class="seatChk" name="seatNum"  value="1" onclick="resetChk(this)"/></th>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="9"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="whatRowNumber(this)" value="10"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="11"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="12"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="13"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="14"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="15"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="16"/></td>
					<td><input type="checkbox" class="timeChk" name="seatTime" onclick="check(this)" value="17"/></td>
				</tr>
				
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