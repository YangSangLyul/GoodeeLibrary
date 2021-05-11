<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>관리자 공지사항</title>
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
            /* #container{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            } */
            table{
                margin-top: 200px;
                margin-left: 365px;
                width: 700px;
                height: 100px;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                padding: 8px;
                text-align: center;
            } 
            /* #search{
                position: absolute;
                left: 1035px;
    			top: 145px;
            } */
            #write{
                position: absolute;
                left: 1433px;
    			top: 280px;
                padding: 5px 10px;
            }
           button,input[type="button"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
    </head>
    <body>
    	<jsp:include page="adminHeader.jsp"/>
    	<div id="container">
	        <!-- <select name="searchType">
	            <option value="all">전체</option>
	            <option value="subject">제목</option>
	            <option value="content">내용</option>
	        </select>    
	        <input type="text"/> 
	        <input type="button" value="검색" id="search"/> -->
	        <input type="button" value="공지등록" id="write" onclick="location.href='noticewriteForm'"/>
	        <table>
	        	<thead>
		            <tr>
		                <th>글번호</th>
		                <th>제목</th>
		                <th>등록일</th>
		                <th>팝업여부</th>
		            </tr>
		        </thead>
		        <tbody id="list">
		            <%-- <c:forEach items="${notice}" var="notice">
			            <tr>
			                <td>${notice.noticeidx}</td>
			                <td><a href="noticeDetail?idx=${notice.noticeidx}">${notice.subject}</a></td>
			                <td>${notice.reg_date}</td>
			                <!-- 팝업은 하나만 가능하니까 radio로 했음 -->
			                <c:if test="${notice.noticestatus eq 'true'}">
				                <td><input type="radio" id="popupCk" checked onclick="return(false);"/></td>
			                </c:if>
			                <c:if test="${notice.noticestatus ne 'true'}">
				                <td><input type="radio" id="popupCk" onclick="return(false);"/></td>
			                </c:if>
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
    	</div>
    </body>
    <script>
  		//페이징
		var showPage = 1;
	
		//1. 몇 개를 보여줄 것인지/몇 페이지 -> 컨트롤러로 전달
		listCall(showPage); //시작하자마자 이 함수를 호출
		
		function listCall(reqPage){
			$("#adminLibraryInfo").css('background-color','#337ab7').css("color","white");
			//restful service는 ajax를 통해 호출하여 사용하는 경우가 많지만
			//그렇다고 restful service == ajax 라고 생각해서는 안된다.
			var reqUrl = './adminNotice/'+reqPage;
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
				var idx = list[i].noticeidx;
				content += "<tr>"
				content += "<td>"+list[i].noticeidx+"</td>"
				content += "<td>"+"<a href='noticeDetail?idx="+idx+"'>"+list[i].subject+"</a></td>"
				//java에서 가끔 날짜가 milliseconds로 나올 경우
				var date = new Date(list[i].reg_date);
				content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
				if(list[i].noticestatus == 'true'){
					content += "<td>"+"<input type='radio' id='popupCk' checked onclick='return(false);'/>"+"</td>"
				}else{
					content += "<td>"+"<input type='radio' id='popupCk' onclick='return(false);'/>"+"</td>"
				}
				content += "<tr>"
			}
			$("#list").empty(content);
			$("#list").append(content);
		}
    
	    var msg = "${msg}";
	    if(msg != ""){
	    	alert(msg);
	    }
	    
	    
    </script>
</html>