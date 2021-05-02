<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>J-Query</title>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<!-- 반응형 디자인을 위한 CSS/js 라이브러리 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<!-- 페이징 라이브러리 -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#bookManageMain {
	position: absolute;
	top: 20%;
	left: 20%;
}

table, th, td {
	border: 1px solid black;
}

#filter {
	display: none;
}
</style>
</head>

<body>
	<div id="bookManageMain">
		<div id="bookFilter">
			<button id="toggle">필터 옵션</button>
			<form action="normalBookFilter" method="POST">
				<div id="filter">
					<span><input type="checkbox" name="filter" value="R001" />예약중</span>
					<span><input type="checkbox" name="filter" value="B001" />예약가능</span>
					<span><input type="checkbox" name="filter" value="B002" />예약불가</span>
					<span><input type="checkbox" name="filter" value="B007" />숨김</span>
					<span><input type="submit" value="검색" /></span>
				</div>
			</form>
		</div>
		<button onclick="location.href='bookManageInsert'">도서 등록</button>
		<div>
	 	<c:if test="${list.size() ne 0}">
				<table>
					<c:forEach items="${list}" var="book" varStatus="status">
							<tr>
								<td>
									<img src="${book.bookImg}" width="100px" height="100px" />
								</td>
								<th>
									<a href="bookManageDetail?bookIdx=${book.bookIdx}">${book.bookName}</a>
								</th>
								<c:if test="${book.bookState eq 'B001'}">
									<td>
									<select id="bookState" name="bookState">
											<option value="">선택</option>
											<option value="B001">예약가능</option>
											<option value="B005">훼손</option>
											<option value="B006">분실</option>
											<option value="B007">기타</option>
									</select> 
										<input type="button" value="변경" onclick="bookStateChange(${book.bookIdx})" />
									</td>
								</c:if>
							</tr>
							<tr>
								<td colspan="3">${book.writer}</td>
							</tr>
							<tr>
								<td colspan="3">${book.publisher}</td>
							</tr>
								<tr>
									<td colspan="3">
									<c:if test="${book.bookState eq 'B001'}">
										예약가능
									</c:if> <c:if test="${book.bookState eq 'B002'}">
										예약불가
									</c:if> <c:if test="${book.bookState eq 'B003'}">
										대여가능
									</c:if> <c:if test="${book.bookState eq 'B004'}">
										대여중
									</c:if> <c:if test="${book.bookState eq 'B005'}">
										훼손
									</c:if> <c:if test="${book.bookState eq 'B006'}">
										분실
									</c:if> <c:if test="${book.bookState eq 'B007'}">
										기타
									</c:if>
									</td>
								</tr>
						<c:forEach items="${book.reserveBookDTO}" var="reserveBook">
							<c:if test="${reserveBook.id ne null }">
								<tr>
									<td colspan="3">
									<c:if test="${reserveBook.bookState eq 'R001'}">
										예약중 : ${reserveBook.id} 
										<button onclick="userReserveNotification('${book.bookName}', '${reserveBook.id}')">예약승인</button>
									</c:if> 
									<c:if test="${reserveBook.bookState eq 'R002'}">
										대여중
									</c:if> 
								<c:if test="${reserveBook.bookState eq 'R003'}">
									반납완료
								</c:if></td>
								</tr>
							</c:if>
					 </c:forEach>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${list.size() eq 0}">
				<h2>해당 목록이 없습니다.</h2>
			</c:if>
		</div>
		
		<div>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			</thead>
			<tbody id="list">
				<!-- 불러온 데이터 뿌리는 영역 -->
			</tbody>
			<tr>
				<td id="paging" colspan="6">
					<!-- 플러그인 사용 -->
					<div class="container">
						<nav aria-label="page navigation" style="text:align: center">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
					<!-- // 플러그인 사용 -->
				</td>
			</tr>
		</table>
		</div>
	</div>
</body>
<script>
		var showPage = 1;
		
		// 몇개를 보여줄 것인지/몇페이지
		listCall(showPage); // 시작하자마자 이 함수를 호출
		
		function listCall(reqPage){
			var reqUrl = './normalBookManage/'+reqPage;
			$.ajax({
				url:reqUrl,
				type:'GET',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log(data);
					showPage = data.currPage;
					listPrint(data.list);
					// 플러그인 사용
					$("#pagination").twbsPagination({
						startPage : data.currPage, // 시작 페이지
						totalPages : data.range, // 생성 가능한 최대 페이지
						visiblePages: 10, // 5개씩 보여 주겠다.(1~5)
						onPageClick:function(evt, page) { // 각 페이지를 눌렀을 경우
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
		
		function listPrint(list) {
			var content = "";
		
			for (var i = 0; i < list.length; i++) {
				content += "<tr>";
				content += "<td>" + list[i].bookIdx + "</td>";
				content += "<td>" + list[i].subject + "</td>";
				content += "<td>" + list[i].user_name + "</td>";
		
				var date = new Date(list[i].reg_date);
				content += "<td>" + date.toLocaleDateString("ko-KR") + "</td>";
		
				content += "<td>" + list[i].bHit + "</td>";
				content += "</tr>";
			}
		
			$("#list").empty();
			$("#list").append(content);
		}

		function userReserveNotification(bookName, id){
			console.log(bookName, id);
			
			var params = {};
			params.bookName = id;
			params.id = id;
			
			$.ajax({
				type : 'get',
				url : 'userReserveNotification',
				data : params,
				dataType : 'JSON',
				success : function(data){
					console.log(data);
					if(data.success > 0) {
						alert('예약승인이 완료 되었습니다.');
					} else {
						alert('잠시 후 다시 시도해 주세요.');
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}

// 예약 승인했을 때 대여중으로 바꿔주는 함수
/* 	function reservePerson(bookIdx, id){
		console.log(bookIdx, id);
		
		var params = {};
		params.bookIdx = bookIdx;
		params.id = id;
		
		$.ajax({
			type : 'get',
			url : 'reserveApproval',
			data : params,
			dataType : 'JSON',
			success : function(data){
				console.log(data);
				if(data.success > 0) {
					alert('예약승인이 완료 되었습니다.');
				} else {
					alert('잠시 후 다시 시도해 주세요.');
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	} */

	var bookState = '';
	$("select[name='bookState']").change(function(){
		bookState = $(this).val();
	});

	function bookStateChange(bookIdx){
		console.log(bookIdx + " : " + bookState);
		
		var params = {};
		params.bookIdx = bookIdx;
		params.bookState = bookState;
		
		$.ajax({
			type : 'get',
			url : 'bookStateChange',
			data : params,
			dataType : 'JSON',
			success : function(data){
				console.log(data);
				if(data.success > 0) {
					alert('도서 상태 변경에 성공했습니다.');
				} else {
					alert('잠시 후 다시 시도해 주세요.');
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	
	
	$('#toggle').click(function () {
	    $('#filter').toggle(500);
	})

    $('span').click(function(){
        if($(this).css('background-color') == 'rgb(197, 216, 241)'){
            $(this).css({'background-color':'white'});
        } else{
            $(this).css({'background-color':'#c5d8f1ff'});
        }
    });
</script>

</html>