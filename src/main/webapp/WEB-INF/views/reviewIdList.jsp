<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>특정 아이디 리뷰 모아보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#main {
	width: 400px;
	height: 300px;
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

.re_option {
	float: right;
}

.re_option li {
	border: 1px solid lightgray;
	width: 100px;
	padding: 8px;
	list-style: none;
}

.re_option li:hover {
	background-color: lightgreen;
}

.re_option a {
	text-decoration: none;
	color: black;
}

.review_content {
	width: 715px;
	padding: 15px;
	border-bottom: 1px solid lightgray;
}

#r_table {
	border-collapse: collapse;
 	width: 715px;
}

#b_img{
	width: 130px;
	height: 160px;
}

#b_name, #b_content{
  width: 400px;
  height: 50px;
}

#b_name,#re_name{
	background-color: #f2f2f2;
	font-size:16px;
}

.b_info{
	margin-left: 8px;
}

.re_img, .re_cnt{
  display: inline;
  margin: 0 15px;
}

.re_detail,.re_id{
  text-align: center;
}

#re_name a{
  color: gray;
  text-decoration: none;
}

#re_name a:hover{
  color: #0070c0;
  text-decoration: underline;
}

#re_btn{
	width: 70%;
	padding: 10px;
	margin: 0;
	font-size: 14px;
	font-weight:600;
	color: #0070c0;
	background-color: #e8ecf4;
	border: 1px solid lightgray;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="bookserviceSidebar.jsp"/>
	<div id="main">
		<div class="subject">
			<h3 id="review">님의 리뷰 모아보기</h3>
		</div>
		<div class="re_option">
			<ul>
				<li><a href="#">유형</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="#">추천순</a></li>
			</ul>
		</div>
		<c:forEach items="${review}" var="review">
			<div class="review_content">
				<table id="r_table">
 					<tr>
						<td rowspan="3" id="b_img">
							<a href="#">
								<img src="${review.bookImg}" width="117" height="162" />
							</a>	
						</td>
						<td id="b_name">
							<div class="b_info">${review.bookName}</div>
						</td>
            			<td id="re_name">
							<div class="re_id">ID : ${review.id}</div>
						</td>
					</tr>
					<tr>
						<td rowspan="2" id="b_content">
							<div class="b_info">저자명 : ${review.writer}</div>
							<div class="b_info">출판사 : ${review.publisher}</div>
							<div class="b_info">출판일 : 2020</div>
						</td>
						<td id="re_recomm">
							<div class="re_img">🤍🧡</div>
							<div class="re_cnt">추천수 : ${review.cnt}</div>
						</td>
					</tr>
					<tr>					
						<td>
							<div class="re_detail">
							<input type="button" id="re_btn" onclick="location.href='reviewIdList'" value="리뷰 상세보기">
							</div>
						</td>
					</tr> 
				</table>
			</div>
		</c:forEach>
	</div>
</body>
<script>
   </script>
</html>