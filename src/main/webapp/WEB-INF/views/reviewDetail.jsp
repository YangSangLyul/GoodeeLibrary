<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

#re_btn{
	width: 30%;
	padding: 10px;
	margin-top: 35px;
	font-size: 14px;
	border: 1px solid lightgray;
	margin-left: 230px;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="bookserviceSidebar.jsp"/>
	<div id="main">
		<div class="subject">
			<h3 id="review">${dto.id} 님의 리뷰</h3>
		</div>
			<div class="review_content">
				<table id="r_table">
					<div class="re_date">작성날짜 : ${dto.reg_date}</div>
 					<tr>
						<td rowspan="3" id="b_info">
							<a href="#">
								<img src="${dto.bookImg}" width="150" height="200" />
							</a>
							<br/>
							<div class="writer"><b>서명</b> ${dto.bookName}</div>
							<div class="writer"><b>저자명</b> ${dto.writer}</div>
							<div><b>출판사</b> ${dto.publisher}</div>	
						</td>
						<td colspan="2" id="re_content">
								<div>${dto.content}</div>	
						</td>
					<tr>
						<td id="re_comm">
							<div class="re_img">🤍<a href="reviewLike">🧡</a></div>
							<div class="re_cnt">추천수 ${dto.cnt}</div>
						</td>
						<td>		
							<div><input type="button" id="re_report" onclick="location.href='reviewReport'" value="신고"></div>
						</td>
					</tr>
					<tr>					
						<td>
							<div><input type="button" id="re_btn" onclick="location.href='reviewList'" value="목록으로"></div>
						</td>
					</tr> 
				</table>
			</div>
	</div>
</body>
<script>
/* $(".writer").each(function(){
    var length = 12; //표시할 글자수 정하기
    $(this).each(function(){
        if( $(this).text().length >= length ){
            $(this).text( $(this).text().substr(0,length)+'...') 
            //지정할 글자수 이후 표시할 텍스트
        }
    });
}); */
   </script>
</html>