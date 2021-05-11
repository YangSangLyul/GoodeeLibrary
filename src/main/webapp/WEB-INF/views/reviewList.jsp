<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 모아보기</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 라이브러리  (제이쿼리 반드시 필요 ,버전도 맞아야함..)-->
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
.container{
	width: 750px;
}
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
}

.re_detail, .re_id {
	text-align: center;
}

#re_name a {
	color: black;
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

#sideBar{
    position: absolute;
    margin-left: 10%;
    margin-top: 3%;
}
                  button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="sideBar">
	<jsp:include page="bookserviceSidebar.jsp" />
	</div>
	<div id="main">
		<div class="subject">
			<h3 id="review"><b>리뷰 모아보기</b></h3>
		</div>
		<div class="re_option">
			<ul>
				<li><a href="reviewList">최신순</a></li>
				<li><a href="#" id="command">추천순</a></li>
			</ul>
		</div>
			<table id="r_table">
				<tbody id="review_All">

				</tbody>
				<tr>
					<!-- 페이징 번호 보여주기 -->
					<td id="paging" colspan="4">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align: center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>
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

var showPage=1;

$("#command").click(function() {
	listCall2(showPage);
	function listCall2(reqPage){         
	 	var reqUrl ='./reviewCom/'+reqPage;
	   $.ajax({
	      url: reqUrl
	      ,type:'get'
	      ,data:{}
	      ,dataType:'JSON'
	      ,success:function(data){
	         console.log(data);
	         showPage = data.currPage;
	         listPrint(data.list);
	 
	         $("#pagination").twbsPagination({
	      	   startPage:data.currPage,//시작페이지
	      	   totalPages:data.range,//총 페이지
	      	   visiblePages:5,//5개씩 보여주겠다.(1~5)
	      	   onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
	     		   listCall(page);
	      	   } 
	         });     
	      }
	      ,error:function(error){
	         console.log(error);
	      }
	   });
	}

})

listCall(showPage);
function listCall(reqPage){         
 	var reqUrl ='./reviewList/'+reqPage;
   $.ajax({
      url: reqUrl
      ,type:'get'
      ,data:{}
      ,dataType:'JSON'
      ,success:function(data){
         console.log(data);
         showPage = data.currPage;
         listPrint(data.list);
 
         $("#pagination").twbsPagination({
      	   startPage:data.currPage,//시작페이지
      	   totalPages:data.range,//총 페이지
      	   visiblePages:5,//5개씩 보여주겠다.(1~5)
      	   onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
     		   listCall(page);
      	   } 
         });     
      }
      ,error:function(error){
         console.log(error);
      }
   });
}

function listPrint(list){
	  var content="";
	  for(var i=0; i<list.length; i++){
		content += "<tr>"
	  	content += "<td rowspan='2' id='b_img'>"+"<a href='searchResultDetail?bookIdx="+list[i].bookIdx+"' target=window.open('width=500,height=1000')><img src="+list[i].bookImg+" width='117' height='162' /></a>"
		content += "<td id='b_name'>"+"<div class='b_info'>"+list[i].bookName+"</div>"+"</td>"
		content += "<td id='re_name'>"+"<div class='re_id'>"+"<a href='reviewIdList?id="+list[i].id+"'>ID : "+list[i].id+"</a>"+"</div>"+"</td>"
		content += "</tr>"
	
		content += "<tr>"
		content += "<hr/>"
		content += "<td id='b_content'>";
		content += "<div class='b_info'>"+"저자명 "+list[i].writer+"</div>";	
		content += "<div class='b_info'>"+"출판사 "+list[i].publisher+"</div>";
		//content += "<div class='b_info'>"+"리뷰등록일 "+list[i].reg_date+"</div>";
		var date = new Date(list[i].reg_date);
		content +="<div class='b_info'>"+"리뷰등록일 "+date.toLocaleDateString("ko-KR")+"</div>"
		content += "</td>"

		content += "<td id='re_recomm'>"
		content += "<div class='re_cnt'>"+"추천수 "+list[i].cnt+"</div>"
		content += "<div class='re_detail'>"+"<input type='button' id='re_btn' onclick='reviewDetailReq("+list[i].reviewIdx+")' value='리뷰 상세보기' />"+"</div>"	
		content += "</td>"	
		content += "</tr>"	
		}
	  $("#review_All").empty();  
	  $("#review_All").append(content);
}

function reviewDetailReq(idx){
	location.href = "reviewDetail?reviewIdx="+idx;
}

   </script>
</html>