<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>알림</title>
        <style>

            table{
                margin-left: 30px;
                width: 80%;
                border-radius: 5px;
                position: relative;
            }

            table,td,th{
                border: 1px solid gray;
                border-collapse: collapse;
                text-align: center;
                padding: 10px;
            }

            table th{
                background-color: #c5d8f1ff;
            }

            table td button{
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
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
            
           #container{
        		position: absolute;
        		width: 1200px;
        		height: 700px;
        		font-size: 30px;
        		font-weight: 600;
        		text-align: center;
        		margin-left: 20%;
        		margin-top: 7%;
        		background-color: white;
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
        <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;알림 내역</h2>
        <!-- 유저 알림 영역 -->
        <div id="container">
        <table>
            <tr>
                <th>종류</th>
                <th>알림내용</th>
                <th>수신일</th>
                <th>확인</th>
            </tr>
			<tbody id="list">
				<c:forEach items="${notification}" var="notifi">
					<input type="hidden" id="reserveBookIdx" value="${notifi.reserveBookIdx}"/>
					<input type="hidden" id="noticeIdx" value="${notifi.noticeIdx}"/>
					<tr>
						<c:if test="${notifi.noType == 'N005'}">
						<td>도서대출예약여부</td>
						</c:if>
						<td>${notifi.content}</td>
						<td>${notifi.read_date}</td>
						<td><button onclick="rental()">대여하기</button></td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(notification) == 0}">
				<tr>
					<td colspan="4">현재 알림이 없습니다...</td>
				</tr>
				</c:if>
			</tbody>
        </table>
		</div>
    </body>
    <script>
    
    function rental(){
    	
    	var idx = $("#reserveBookIdx").val();
    	var noticeIdx =$("#noticeIdx").val();
    	
    	console.log('대여 요청');
    	
    	location.href='rentalBook?reserveBookIdx='+idx+"&&noticeIdx="+noticeIdx;
    }
    
	var showPage = 1;
	
	//listCall(showPage);
	
	function listCall(reqPage){
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './userNotificationReq/'+reqPage;
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
				$("table").css("display","block");
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
		
		//            <tr>
/*                 <td>문의글답변</td>
                <td><a href="#">행사 일정 문의</a></td>
                <td>2021-04-19</td>
                <td><button id="readNotification">읽음처리</button></td>
            </tr> */
		

		
		var content = "";
		
		
		for(var i=0;i<list.length;i++){
			
			
			
			content += "<tr>"
			content += "<td>"+"</td>";
			content += "<td>"+"</td>";
			content += "<td>"+"</td>";
			content += "</tr>"
		}
		
		//그리기전에 이전 내용을 비우는 작업을 해야한다(그래야 쌓이지 않음)
		$("#list").empty();
		$("#list").append(content);
		
	}
    </script>


</html>