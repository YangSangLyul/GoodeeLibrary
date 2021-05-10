<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>J-Query</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 반응형 디자인을 위한 CSS/js 라이브러리 -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 라이브러리 -->
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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
	<jsp:include page="../adminHeader.jsp" />
	<jsp:include page="./bookManageSidebar.jsp" />
	<div id="bookManageMain">
		<div id="bookFilter">
			<button id="toggle">필터 옵션</button>
			<div id="filter">
				<span><input type="checkbox" name="filter" value="R001" />예약중</span>
				<span><input type="checkbox" name="filter" value="B001" />예약가능</span>
				<span><input type="checkbox" name="filter" value="B002" />예약불가</span>
				<span><input type="checkbox" name="filter" value="B007" />숨김</span>
				<span><input type="button" onclick="listCall(1)" value="검색" /></span>
			</div>
		</div>
		<button onclick="location.href='bookManageInsert'">도서 등록</button>
		<div>
			<table>
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
	</div>
</body>
<script>
	var showPage = 1;
	var firstData = 'true';

	listCall(showPage); // 시작하자마자 이 함수를 호출

	function listCall(reqPage) {

		var filter = new Array();
		var params = {};
		
		console.log(firstData);
		if(firstData == 'true'){
			console.log('1');
		<c:forEach items="${sessionScope.filter}" var="item">
			filter.push("${item}");
		</c:forEach>
		firstData = 'false';
		}
		
		$("input[name=filter]:checked").each(function() {
			filter.push($(this).val());
			console.log($(this).val());
		})

		console.log('filter : ', filter);
		params.filter = filter;
		var reqUrl = './normalBookFilter/' + reqPage;
		$.ajax({
			url : reqUrl,
			type : 'GET',
			data : params,
			dataType : 'JSON',
			success : function(data) {
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
	function listPrint(list) {
		var content = "";

		if (list.length > 0) {
			for (var i = 0; i < list.length; i++) {
				content += "<tr>";
				if (list[i].reserveBookDTO.length > 0) {
					content += "<td rowspan='5'><img src="+list[i].bookImg+" width='100px' height=100px /></td>";
				} else {
					content += "<td rowspan='4'><img src="+list[i].bookImg+" width='100px' height=100px /></td>";
				}
				if (list[i].bookState == 'B001') {
					content += "<th colspan='2'><a href='bookManageDetail?bookIdx="
							+ list[i].bookIdx
							+ "'>"
							+ list[i].bookName
							+ "</a></th>";
					content += "<td><select id='bookState' name='bookState'";
					content += "<option value=''>선택</option>";
					content += "<option value='B001'>예약가능</option>";
					content += "<option value='B005'>훼손</option>";
					content += "<option value='B006'>분실</option>";
					content += "<option value='B007'>기타</option>";
					content += "</select>";
					content += "<input type='button' value='변경' onclick='bookStateChange("
							+ list[i].bookIdx + ")'/>";
					content += "</td>";
				} else {
					content += "<th colspan='3'><a href='bookManageDetail?bookIdx='"
							+ list[i].bookIdx
							+ ">"
							+ list[i].bookName
							+ "</a></th>";
				}
				content += "</tr>";

				content += "<tr>";
				content += "<td colspan='3'>" + list[i].writer + "</td>";
				content += "</tr>";
				content += "<tr>";
				content += "<td colspan='3'>" + list[i].publisher + "</td>";
				content += "</tr>";
				content += "<tr>";
				content += "<td colspan='3'>" + bookState(list[i].bookState)
						+ "</td>"
				content += "</tr>";

				if (list[i].reserveBookDTO.length > 0) {
					for (var j = 0; j < list[i].reserveBookDTO.length; j++) {
						content += "<tr>";
						content += "<td colspan='3'>"
								+ reserveBookState(list[i]) + "</td>";
						content += "</tr>";
					}
				}
			}
		} else {
			content = "<h2>해당 목록이 없습니다.</h2>";
		}

		function reserveBookState(bookList) {
			reserveBookState = bookList.reserveBookDTO[0].bookState;
			bookName = bookList.bookName;
			id = bookList.reserveBookDTO[0].id;
			reserveNum = bookList.reserveBookDTO[0].reserveBookIdx;
			console.log("id : " + id + " / bookName : " + bookName
					+ " / reserveNumber : " + reserveNum);
			if (reserveBookState == 'R001') {
				//return "예약중 : " + id + " <button onclick='userReserveNotification(\""+ bookName + "/" + id+"\")'>예약승인</button>";
			} else if (reserveBookState == 'R002') {
				return "대여중";
			} else if (reserveBookState == 'R003') {
				return "반납완료";
			}
		}

		function bookState(bookState) {
			if (bookState == 'B001') {
				return "예약가능";
			} else if (bookState == 'B002') {
				return "예약불가";
			} else if (bookState == 'B003') {
				return "대여가능";
			} else if (bookState == 'B004') {
				return "예약중";
			} else if (bookState == 'B005') {
				return "훼손";
			} else if (bookState == 'B006') {
				return "분실";
			} else if (bookState == 'B007') {
				return "기타";
			}
		}

		$("#list").empty();
		$("#list").append(content);
	}

	function userReserveNotification(book) {
		bookInfo = book.split("/");
		console.log(bookInfo[0]);
		console.log(bookInfo[1]);
		var params = {};
		params.bookName = bookInfo[0];
		params.id = bookInfo[1];
		$.ajax({
			type : 'get',
			url : 'userReserveNotification',
			data : params,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				if (data.success > 0) {
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

	$(document).on("change", "#bookState", function() {
		bookState = $(this).val();
	});

	function bookStateChange(bookIdx) {
		console.log(bookIdx + " : " + bookState);

		var params = {};
		params.bookIdx = bookIdx;
		params.bookState = bookState;

		$.ajax({
			type : 'get',
			url : 'bookStateChange',
			data : params,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				if (data.success > 0) {
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

	$('#toggle').click(function() {
		$('#filter').toggle(500);
	})

	$('span').click(function() {
		if ($(this).css('background-color') == 'rgb(197, 216, 241)') {
			$(this).css({
				'background-color' : 'white'
			});
		} else {
			$(this).css({
				'background-color' : '#c5d8f1ff'
			});
		}
	});
</script>

</html>