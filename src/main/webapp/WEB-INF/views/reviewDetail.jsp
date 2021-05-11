<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String loginId = (String) request.getSession().getAttribute("loginId");
%>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#main {
	width: 800px;
	height: 400px;
	margin: 50px auto;
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
	background:#f8f7f7; 
}

#re_comm{
	width: 350px;
}

.re_img{
	display: inline;
	font-size: 15px;
	margin: 3px;
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

#likebtn{
	width: 28px;
	height: 28px;
	margin-top: 8px;
	vertical-align: bottom;
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
			<h3 id="review">${dto.id} 님의 리뷰</h3>
		</div>
			<div class="review_content">
				<table id="r_table">
					<div class="re_date">작성날짜 : ${dto.reg_date}</div>
					<input type="hidden" id="reviewIdx" name="reviewIdx" value="${dto.reviewIdx}"/>
					<input type="hidden" id="id" name="id" value="${dto.id}"/>
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
							<div class="re_img"><img src="./image/delike.png" id="likebtn"></div>	
							<div class="re_img">추천수 <span id="like_cnt"> ${cnt} </span></div>
						</td>
						<c:if test="${sessionScope.loginId ne null}">
						<td>		
							<div><input type="button" id="re_report" onclick="reviewReport()" value="신고"></div>
						</td>
						</c:if>
						<c:if test="${sessionScope.loginId eq null}">
						<td>		
							<div></div>
						</td>
						</c:if>
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

$("#libraryService").css('background-color','#337ab7').css("color","white");

$(".menu:eq(0)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(0)").css("background-color","#337ab7");
     $(".menu:eq(1)").css("backgroundColor", "white");
})

var msg = "${msg}";
	 if(msg!=""){
			alert(msg);
	 }
	 
likeCnt(); 
$("#likebtn").click(function(){
	 var $reviewIdx = $("#reviewIdx");
	 var $id = $("#id");
	 var params = {};
	 params.reviewIdx = $reviewIdx.val();
	 params.id = $id.val();
	$.ajax({
		url: "reviewLike",
          type: "get",
          data: params,
          dataType:'JSON',
          success: function (data) {
       	 	console.log(data);
       	 	console.log("--------------");
       	 	console.log(data.success);
       	 	if(data.success==0){
       	 		$("#likebtn").attr("src","./image/like.png");
       	 		alert("해당 리뷰를 추천하였습니다.");
       	 		likeCnt();
       	 	}else if(data.success==1){
       	 		$("#likebtn").attr("src","./image/delike.png");
       	 		alert("해당 리뷰 추천을 취소하였습니다.");
       	 		likeCnt();
       	 	}else{
       	 		alert("리뷰 추천은 로그인 후 이용할 수 있습니다.");
       	 	}
          }
    });
});

 function likeCnt(){
	 var $reviewIdx = $("#reviewIdx");
	 var params = {};
	 params.reviewIdx = $reviewIdx.val();
	$.ajax({
		url: "reviewLikeCnt",
        type: "get",
        data: params,
        dataType: 'JSON',
        success: function (data) {
        	   console.log("--------------");
        	   console.log(data);
        	   $("#like_cnt").html(data.cnt);	
           }
	});
};


/* $(".writer").each(function(){
    var length = 12; //표시할 글자수 정하기
    $(this).each(function(){
        if( $(this).text().length >= length ){
            $(this).text( $(this).text().substr(0,length)+'...') 
            //지정할 글자수 이후 표시할 텍스트
        }
    });
}); */

var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

function reviewReport(){
	window.open('reviewReportForm?reviewIdx=${dto.reviewIdx}','reviewReportForm','width=450, height=350');
}
   </script>
</html>