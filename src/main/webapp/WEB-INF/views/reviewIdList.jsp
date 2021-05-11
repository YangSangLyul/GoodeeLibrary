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
	width: 580px;
	margin: 50px auto;
	text-align: center;
}

.subject {
	border: 1px solid lightgray;
	width: 300px;
	margin: auto;
}

#review {
	margin: 10px;
	font-size: 16px;
}

.re_option {
	float: right;
	margin: 20px 0;
}

.re_option ul li {
	border: 1px solid lightgray;
	width: 100px;
	padding: 8px;
	list-style: none;
	float: left;  
}

.re_option li:hover {
	background-color: #e8ecf4;
}

.re_option a {
	text-decoration: none;
	color: black;
}

#r_table {
	border-collapse: collapse;
	margin-left : -100px;
}

#b_img {
	width: 130px;
	height: 160px;
}

#b_name, #b_content {
	width: 400px;
}

#b_name, #re_name {
	background-color: #f2f2f2;
	font-size: 16px;
	height: 50px;
}

.b_info {
	margin-left: 8px;
	font-size: 15px;
}

.re_cnt {
	margin: 25px 69px;
    width: 70px;
}

.re_detail, .re_id {
	text-align: center;
}

#re_name a {
	color: gray;
	text-decoration: none;
}

#re_name a:hover {
	color: #0070c0;
	text-decoration: underline;
}

#re_btn {
	width: 70%;
	padding: 10px;
	margin-bottom: 20px;
	font-size: 14px;
	font-weight: 600;
	color: #0070c0;
	background-color: #e8ecf4;
	border: 1px solid lightgray;
}

#re_recomm{
	width : 200px;
}

#dId{
	font-size: 18px;
	font-weight: 600;
	color : #0070c0; 
}
                  button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
            #sideBar{
			    position: absolute;
			    margin-left: 10%;
			    margin-top: 3%;
			}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="sideBar">
<jsp:include page="bookserviceSidebar.jsp"/>
</div>
	<div id="main">
		<div class="subject">
			<h3 id="review"><span id="dId">${dId}</span> 님의 리뷰 모아보기</h3>
		</div>
		<div class="re_option">
			<ul>
				<li><a href="reviewIdList?id=${dId}">최신순</a></li>
				<li><a href="reviewIdComm?id=${dId}">추천순</a></li>
			</ul>
		</div>
		<c:forEach items="${review}" var="review">
			<div class="review_content">
				<table id="r_table">
 					<tr>
						<td rowspan="2" id="b_img">
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
						<td id="b_content">
							<div class="b_info">저자명 ${review.writer}</div>
							<div class="b_info">출판사 ${review.publisher}</div>
							<div class="b_info">등록일 ${review.reg_date}</div>
						</td>
						<td id="re_recomm">
							<div class="re_cnt">추천수 ${review.cnt}</div>
							<div class="re_detail"><input type="button" id="re_btn" onclick="location.href='reviewDetail?reviewIdx=${review.reviewIdx}'" value="리뷰 상세보기"></div>
						</td>					
					</tr> 
				</table>
			</div>
		</c:forEach>
	</div>
</body>
<script>
$("#libraryService").css('background-color','#337ab7').css("color","white");

$(".menu:eq(0)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(0)").css("background-color","#337ab7");
     $(".menu:eq(1)").css("backgroundColor", "white");
})

</script>
</html>