<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
<title>J-Query</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		<button>도서 등록</button>
		<div>
			<c:if test="${list.size() ne 0}">
				<table>
					<c:forEach items="${list}" var="book">
						<c:forEach items="${book.reserveBookDTO}" var="reserveBook">
							<tr>
								<td rowspan="4"><img src="${book.bookImg}" width="100px"
									height="100px" /></td>
								<th>${book.bookName}</th>
								<c:if test="${book.bookState eq 'B001'}">
									<td><select id="bookState" name="bookState">
											<option value="">선택</option>
											<option value="B001">예약가능</option>
											<option value="B005">훼손</option>
											<option value="B006">분실</option>
											<option value="B007">기타</option>
									</select> <input type="button" value="변경"
										onclick="bookStateChange(${book.bookIdx})" /></td>
								</c:if>
							</tr>
							<tr>
								<td colspan="3">${book.writer}</td>
							</tr>
							<tr>
								<td colspan="3">${book.publisher}</td>
							</tr>
							<c:if test="${reserveBook.id eq null}">
								<tr>
									<td colspan="3"><c:if test="${book.bookState eq 'B001'}">
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
								</c:if></td>
								</tr>
							</c:if>

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
	</div>
</body>
<script>
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