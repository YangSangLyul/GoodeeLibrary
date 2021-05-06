<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰내역</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#main {
		width: 800px;
		height: 400px;
		margin: auto;
		text-align: center;
	}
	
	.subject {
		border: 1px solid lightgray;
		width: 300px;
		margin: auto;
	}
	
	#review {
		margin: 5px;
	}
	
	.review_content {
		width: 750px;
		padding: 15px;
		height: 400px;
		border-bottom: 1px solid lightgray;
	}
	
	#r_table { 
		border-collapse: collapse;
	 	width: 750px;
	}
	
	#b_info{
		width: 200px;
		height: 160px;
		font-size: 14px;
		vertical-align: top;
	}
	
	#b_info div{
		margin-top: 10px;
		width: 80%;
	}
	
	#re_content{
	  width: 500px;
		height: 250px;
		vertical-align: top;
		background-color: #f2f2f2;
	}
	
	#re_comm{
		width: 350px;
	}
	
	.re_img, .re_cnt{
		display: inline;
		font-size: 14px;
	}
	
	.re_date{
		font-size: 13px;
		float: right;
		margin-bottom: 10px;
	}
	
	#re_report{
		float: right;
		margin-top: 10px;
		padding: 3px;
		width: 25%;
		font-size: 14px;
		border: none;
		font-weight: 600;
		color: #0070c0;
		background-color: #e8ecf4;
	}
	
	.re_btn{
		width: 30%;
		padding: 10px;
		margin-top: 35px;
		font-size: 14px;
		border: 1px solid lightgray;
		margin-left: 230px;
	}
	.text{
		width: 550px;
    	height: 250px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="mySidebar.jsp"/>
   	<div id="main">
		<div class="subject">
			<h3 id="review">${loginId}의 리뷰 작성하기</h3>
		</div>
    <div class="review_content">
    <form action="review_write" method="POST">
    <table id="r_table">
    <input type="hidden" name="bookIdx" value="${ReviewDetail.bookIdx}"/>
    <input type="hidden" name="id" value="${loginId}"/>
    <input type="hidden" name="blind_status" value="N"/>
 					<tr>
						<td rowspan="3" id="b_info">
							<a href="#">
								<img src="${ReviewDetail.bookImg}" width="150" height="200" />
							</a>
							<br/>
							<div class="writer"><b>서명</b> ${ReviewDetail.bookName}</div>
							<div class="writer"><b>저자명</b> ${ReviewDetail.writer}</div>
							<div><b>출판사</b> ${ReviewDetail.publisher}</div>	
						</td>
						<td colspan="2" id="re_content">
								<input class="text" type="text" name="content"/>
						</td>
					<tr>					
						<td rowspan="2">
							<input type="button" class="re_btn" id="save" value="저장">
							<input type="button" class="re_btn" onclick="location.href='booksSearch'" value="취소">
						</td>
					</tr> 
				</table>
				</form>
			</div>
	</div>
</body>


<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

$("#save").click(function(){
	//$('#content').val($('#editable').html());
	$('form').submit();
});
</script>
</html>