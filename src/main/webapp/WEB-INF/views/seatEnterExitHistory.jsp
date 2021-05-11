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
        		width: 1200px;
        		height: 700px;
        		font-size: 30px;
        		font-weight: 600;
        		text-align: center;
        		margin-left: 20%;
        		margin-top: 7%;
        		background-color: #eeece1ff;
        	}
        	
        	tbody td,th{
        		
        		margin-top: 30px;
        		width:200px;
        		height:80px;;
        		border: 1px solid black;
        		text-align: center;
        		background-color: white;
        		font-size: 30px;
        		font-weight: 600;
        	}
        	
        	thead th{
        		text-align: center;
        		background-color: #c5d8f1ff;
        	}
        	
        	#show{
        		margin-top:50px;
        	}
        	
     
        	
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    

		<!-- 페이징 라이브러리(제이쿼리가 반드시 필요함, 버전도 맞아야 함) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>

    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
        </div>
        
        <div id="userInOut">
        	<span style="color: blue;">${loginId}</span>
        	&nbsp;&nbsp;님의 입/퇴실 히스토리
        </div>
        
        <div id="container">
        	
        	<div id="show">
        	<table>
        		<thead style="margin-top:50px;">
        	    <tr>
        			<th>날짜</th>
        			<th>입실</th>
        			<th>퇴실</th>
        		</tr>
        		</thead>
				<tbody id="list">
					<!-- 불러온 데이터 뿌리는 영역 -->
				</tbody>
				</table>
				
					<div id="paging">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align: center;">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</div>
        	</div>
        	
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
    
	var showPage = 1;
	
	listCall(showPage);
	
	function listCall(reqPage){
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './seatEnterExitHistoryReq/'+reqPage;
		$.ajax({
			url:reqUrl
			,type:'GET'
			,data:{}
			,dataType:'JSON'
			,success:function(data){
				console.log(data);
				
				if(data.success == '0'){
					console.log('현재 히스토리 없음!');
					$("#list").empty();
					$("table").css("display","none");
				}else if(data.success != '0'){
				$("table").css("display","inline");
				//현재 페이지를 가져옴
				showPage = data.currPage;
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.history);
				//pagePrint(data.range); // 플러그인 미사용 페이징 처리
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage// 시작 페이지
					,totalPages:data.range //생성 가능 최대 페이지
					,visiblePages:5 //5개씩 보여주겠다 (1~5)
					,onPageClick:function(evt,page) { //각 페이지를 눌렀을 경우
						//console.log(evt);
						//console.log(page);
						listCall(page);
					}
				});
				}
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function listPrint(list){
		

		
		var content = "";
		
		
		for(var i=0;i<list.length;i++){
			

			
			//총 8개가 나옴
			var start = new Date(list[i].useStart);
			var enter = new Date(list[i].useEnd);
			
			
			
			var oneAmPm = 'AM'; // 초기값 AM
			var twoAmPm = 'AM';
			
			if(start.getHours() >= 12){
				oneAmPm = 'PM';
			}
			
			if(enter.getHours() >= 12){
				twoAmPm = 'PM';
			}
			
			
			var toDay = start.getFullYear() +" - "+(start.getMonth() + 1) +" - "+start.getDate();
			var startShow = oneAmPm+" "+start.getHours() +" : " + start.getMinutes();
			var enterShow = twoAmPm+" "+enter.getHours() +" : " + enter.getMinutes();
			
			content += "<tr>"
			content += "<td>"+toDay+"</td>";
			content += "<td>"+startShow+"</td>";
			content += "<td>"+enterShow+"</td>";
			content += "</tr>"
		}
		
		//그리기전에 이전 내용을 비우는 작업을 해야한다(그래야 쌓이지 않음)
		$("#list").empty();
		$("#list").append(content);
		
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