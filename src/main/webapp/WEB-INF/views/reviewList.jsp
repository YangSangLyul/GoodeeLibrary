<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 모아보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#main {
	width: 400px;
	height: 300px;
	margin: 200px auto;
	text-align: center;
}

.subject {
	border: 1px solid;
	width: 300px;
	margin: auto;
}

#review {
	margin: 5px;
}

.option {
	float: right;
}

.option li {
	border: 1px solid lightgray;
	width: 100px;
	padding: 8px;
	list-style: none;
}

.option li:hover {
	background-color: lightgreen;
}

.option a {
	text-decoration: none;
	color: black;
}

.review_content {
	width: 600px;
	height: 500px;
	border: 1px solid;
}

table tr td {
 	border: 1px solid;
 	width: 500px;
	padding: 5px;
}

#b_name{
  width: 150px;
  font-size: 18px;
}

.re_img, .re_cnt{
  border: 1px solid red;
  display: inline;
  margin: 0 15px;
}

.re_detail,.re_id{
  text-align: center;
}

a{
  color: black;
  text-decoration: none;
}
</style>
</head>
<body>
	<div id="main">
		<div class="subject">
			<h3 id="review">리뷰 모아보기</h3>
		</div>
		<div class="option">
			<ul>
				<li><a href="#">유형</a></li>
				<li><a href="#">최신순</a></li>
				<li><a href="#">추천순</a></li>
			</ul>
		</div>
		<c:forEach items="${review}" var="review">
			<div class="review_content">
				<table>
 					<tr>
						<td rowspan="3" id="b_img" width="100px" height="150px">
							<div>
							<a href="#">
								<img src="${review.bookimg}" />
							</a>	
							</div>
						</td>
						<td id="b_name">
							<div class="b_name">${review.bookname}</div>
						</td>
            			<td>
							<div class="re_id"><a href="#">ID : ${review.id}</a></div>
						</td>
					</tr>
					<tr>
						<td rowspan="2" id="b_content">
							<div>${review.writer}</div>
							<div>${review.publisher}</div>
						</td>
						<td id="re_recomm">
							<div class="re_img">하트</div>
							<div class="re_cnt">추천수 : 0</div>
						</td>
					</tr>
					<tr>					
						<td>
							<div class="re_detail">상세보기</div>
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