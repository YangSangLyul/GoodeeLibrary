<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>신고 리스트</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <!-- 제이쿼리(제이쿼리가 있어야 아래 라이브러리를 사용할 수 있으므로 최상단에 위치) -->
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- 반응형 디자인을 위한 css/js 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>        
        <style>
            /* body{
                width: 1000px;
                margin: 20px 400px;
                text-align: center;
            } */
            table{
                width: 650px;
                height: 100px;
                margin-left: 365px;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                text-align: center;
                padding: 5px;
            } 
            /* button{
                padding: 10px;
                padding-inline: 35px;
                margin: 20px;
            } */
            #decision{
                position: absolute;
                left: 1139px;
                top: 235px;
            }
            #tabMenu{
            	width: 700px;
            	margin-left: 650px;
            }
            .tabBtn{
            	padding: 10px;
                padding-inline: 35px;
                margin: 20px;
            }
            #blind{
            	margin-right: 10px;
            }
            button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
    </head>
    <body>
    	<div>
	    	<jsp:include page="adminHeader.jsp"/>
    	</div>
        <div id="tabMenu">
            <button class="tabBtn" onclick="location.href='ReviewKing'">이달의 리뷰왕</button>
            <button class="tabBtn" style="background-color:blue;color:white;" onclick="location.href='ReportList'">신고 리스트</button>
            <button class="tabBtn" onclick="location.href='BlindList'">블라인드 리스트</button>
        </div>
        <br/>
        <table>
        	<thead>
	            <tr>
	                <th>번호</th>
	                <th>신고ID</th>
	                <th>신고사유</th>
	                <th>신고날짜</th>
	                <th>처리여부</th>
	            </tr>
	        </thead>
            <tbody id="list">
	            <%-- <c:forEach items="${report}" var="report">
		            <tr>
		                <td>${report.reportIdx}</td>
		                <td>${report.reportId}</td>
		                <td><a class="reason" href="reportDetail?idx=${report.reportIdx}">${report.reportReason}</a></td>
		                <td>${report.reportdate}</td>
		                <td>
		                    <input type="button" id="blind" onclick="location.href='blindReason?reportIdx=${report.reportIdx}&reviewIdx=${report.reviewIdx}'" value="블라인드"/>
		                    <input type="button" id="ignore" onclick="location.href='ignore?reportIdx=${report.reportIdx}'" value="무시"/>
		                </td>
		            </tr>
	            </c:forEach> --%>
            </tbody>
            <tr>
				<td id="paging" colspan="6">
					<!-- 플러그인 사용 -->
					<div class="container">
						<nav aria-label="page navigation" style="text-align:center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>
        </table>
    </body>
    <script>
    	$("#adminLibraryReview").css('background-color','#337ab7').css("color","white");
		//페이징
		var showPage = 1;
	
		//1. 몇 개를 보여줄 것인지/몇 페이지 -> 컨트롤러로 전달
		listCall(showPage); //시작하자마자 이 함수를 호출
		
		function listCall(reqPage){
			//restful service는 ajax를 통해 호출하여 사용하는 경우가 많지만
			//그렇다고 restful service == ajax 라고 생각해서는 안된다.
			var reqUrl = './ReportList/'+reqPage;
			$.ajax({
				url:reqUrl,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					showPage = data.currPage;
					listPrint(data.list);
					//플러그인 사용
					$("#pagination").twbsPagination({
						startPage:data.currPage //시작 페이지
						,totalPages:data.range //생성 가능한 최대 페이지
						,visiblePages:10 //10개씩 보여줌
						,onPageClick:function(evt,page){ //각 페이지를 눌렀을 경우
							console.log(evt);
							console.log(page);
							listCall(page);
						}
					});
				},
				error:function(error){
					console.log(error);
				}
			});
		}    	
		//리스트 불러오기
		function listPrint(list) {
			var content = "";
			for(var i=0;i<list.length;i++){
				var idx = list[i].reportIdx;
				content += "<tr>"
				content += "<td>"+list[i].reportIdx+"</td>"
				content += "<td>"+list[i].reportId+"</td>"
				content += "<td>"+"<a class='reason' href='reportDetail/"+idx+"'>"+list[i].reportReason+"</a></td>"
				//java에서 가끔 날짜가 milliseconds로 나올 경우
				var date = new Date(list[i].reportdate);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				content += "<td>"+"<input type='button' id='blind' onclick=reqBlind("+idx+","+list[i].reviewIdx+") value='블라인드'/>"
								+"<input type='button' id='ignore' onclick=reqIgnore("+idx+") value='무시'/>"+"</td>"
				content += "<tr>"
			}
			//10자 초과 시 ...로 표시
			var txt = document.getElementsByClassName("reason");
			console.log(txt);
		    function textLengthOverCut(text, len, lastTxt) {
	    		if (len == "" || len == null) { // 기본값
		            len = 10;
		        }
		        if (lastTxt == "" || lastTxt == null) { // 기본값
		            lastTxt = "...";
		        }
	    		for (var i=0; i < txt.length; i++) {
			        if (txt[i].innerText.length > len) {
			            txt[i].innerText = txt[i].innerText.substr(0, len) + lastTxt;
			        }
				}
	    		return txt;
		    }
			$("#list").empty(content);
			$("#list").append(content);
		    textLengthOverCut();
		}		
	    
	    //alert
	    var msg = "${msg}";
	    if(msg!=""){
	    	alert(msg);
	    }
	    
	    function reqBlind(reportIdx,reviewIdx){
	    	location.href='blindReason?reportIdx='+reportIdx+'&reviewIdx='+reviewIdx;
	    	//window.open('blindReason?reportIdx='+reportIdx+'&reviewIdx='+reviewIdx,'blindreason','width=400 height=100');
	    }
	    
	    function reqIgnore(reportIdx){
	    	location.href='ignore?reportIdx='+reportIdx;
	    }
    
    </script>
</html>