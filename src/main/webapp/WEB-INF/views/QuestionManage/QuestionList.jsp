<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의내역 리스트</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
<style>
table{
    width: 650px;
    height: 100px;
    margin-left: 365px;
    margin-top: 10px;
    text-align: center;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	padding: 5px 10px;
}

#btn{
	margin-left: 1400px;
}
            button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
</head>
<body>
	<div style="text-align: left; margin-bottom: 70px;">
    	<jsp:include page="../adminHeader.jsp"/>
   	</div>
	<div id="btn">
		<button>답변완료</button>
		<button>답변하기</button>
	</div>
	<div>
		<table>
			<tr>
				<th>문의번호</th>
				<th>제목</th>
				<th>문의날짜</th>
				<th>답변여부</th>
			</tr>
			<tbody id="list">
				<!-- 불러온 데이터 뿌리는 영역 -->
			</tbody>
			<tr>
				<td id="paging" colspan="6">
					<!-- 플러그인 사용 -->
					<div class="container">
						<nav aria-label="page navigation" style="text: align: center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div> <!-- // 플러그인 사용 -->
				</td>
			</tr>
		</table>
	</div>
</body>
<script>
	$("#adminLibraryQuestion").css('background-color','#337ab7').css("color","white");
	var showPage = 1;

	// 몇개를 보여줄 것인지/몇페이지
	listCall(showPage); // 시작하자마자 이 함수를 호출

	function listCall(reqPage) {
		var reqUrl = './questionList/' + reqPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : {},
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				showPage = data.currPage;
				listPrint(data.list);
				$("#pagination").twbsPagination({
					startPage : data.currPage, // 시작 페이지
					totalPages : data.range, // 생성 가능한 최대 페이지
					visiblePages : 10, // 5개씩 보여 주겠다.(1~5)
					onPageClick : function(evt, page) { // 각 페이지를 눌렀을 경우
						listCall(page);
					}
				});
			},
			error : function(error) {
				console.log(error);
			}
		});
	}

	
		$('.ellipsis').each(function() {
				var length = 5; //글자수
			$(this).each(function() {
					if ($(this).text().length >= length) {
					$(this).text($(this).text().substr(0, length) + '...');
				}

			}); 
		});
		
	function listPrint(list) {
		var content = "";
		var length = 10;
		var subject = '';
		if (list.length > 0) {
			for (var i = 0; i < list.length; i++) {
				content += "<tr>";
				content += "<td>" + list[i].queIdx + "</td>";
				console.log('현재 제목의 문자길이는? ',list[i].subject.length);
				// 문자열 길이 10 넘어가면 ... 으로 처리
				 if(list[i].subject.length > length) {
					subject = list[i].subject.substring(0, length) + '...';
				}  else {
					subject = list[i].subject;
				}
				 
				content += "<td class='ellipsis'><a href='QuestionDetail?queIdx=" + list[i].queIdx + "'>"+subject+"</a></td>";
						
				var date = new Date(list[i].reg_date);
				content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>";

				if (list[i].ansStatus == 'FALSE') {
					content += "<td>답변하기</td>";
				} else {
					content += "<td>답변완료</td>";
				}
				content += "</tr>";
			}
		} else {
			content = "<h2>해당 목록이 없습니다.</h2>";
		}
		
		$("#list").empty();
		$("#list").append(content);
	}
</script>
</html>