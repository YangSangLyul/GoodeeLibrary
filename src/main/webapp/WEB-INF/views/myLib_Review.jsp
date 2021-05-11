<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리뷰내역</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 300px;
	    height: 30px;
	    margin-left: 40%;
	    margin-bottom: 1%;
	    border: 1px solid black;
	}
	#body{
		position: absolute;
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 1000px;
	    height: 900px;
	}
	
	#frame div{
	    text-align: center;
	}
	
	#table{
	    
	    margin-left: 15%;
	    margin-top: 20%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	
	#review{
	    background-color: aquamarine;
	}
	
	.book_name{
	    background-color: white;
	    margin-left: 100px;
	}
	#border{
	    border-collapse: collapse;
	    border: 1px solid black;
	    margin-bottom: 150px;
	    margin-top: -100px;
	    margin-left: 120px;
	    margin-right: 240px;
	    width: 500px;
	    height: 290px;
	}
		
	.bookimg{
	    width: 100px;
    	height: 150px;
	}	
		
	#paging{
       position: fixed;
       left:20%;
       top:80%;
     }
     	    button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
   <div id="my_title">${loginId}의 리뷰 내역</div>
 <div id="sideBar">
    <jsp:include page="mySidebar.jsp"/>
 </div>
   	<div id="frame">
    <div id="body">
         <table id="table">
           
         <tbody id="review_list">
  
 		</tbody>
           
			<!-- 페이징 번호 보여주기 -->
            <td id="paging" colspan="4">
            	<!-- 플러그인 사용 -->
            	<div class="container">
            		<nav aria-label="page navigation" style="text-align:center">
            			<ul class="pagination" id="pagination"></ul>
            		</nav>
            	</div>
            </td>
            </table>
    </div>
    </div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(3)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(3)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(4)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})
var showPage=1;

listCall(showPage);

function listPrint(review_list){
	  var content="";
	  for(var i=0; i<review_list.length;i++){
	  	content += "<div id='border'>"
		content += "<img class='bookimg' src='"+review_list[i].BOOKIMG+"'/>"+review_list[i].BOOKNAME
		content += "<div>저자명 : "+review_list[i].WRITER+"</div>"
		content += "<div>출판사 : "+review_list[i].PUBLISHER+"</div>"
		var date = new Date(review_list[i].REG_DATE);
		content += "<div>등록날짜 : "+date.toLocaleDateString("ko-KR")+"</div>"
	
		content += "<div>추천수 : "+review_list[i].CNT+"</div>"
		content += "<a href='./myReview_detail?reviewIdx="+review_list[i].REVIEWIDX+"'><input type='button' value='리뷰상세보기'/></a>"
		content += "</div>"	  
	  $("#review_list").empty();  
	  $("#review_list").append(content);
}}

function listCall(reqPage){         

	//주소 다른주소로 보내라.
	var reqUrl ='./myLib_Review/'+reqPage;
   $.ajax({
      url: reqUrl
      ,type:'get'
      ,data:{}
      ,dataType:'JSON'
      ,success:function(data){
         console.log(data.review_list);
         showPage = data.currPage;
         listPrint(data.review_list);
 
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

function pagePrint(range){
	  console.log("생성 가능 페이지 : "+range);
	  console.log("현재 페이지 : "+showPage);
	  var content="";
	  var start=1;
	  var end = range >= 5? 5: range;
	  
	  //이전(5페이지가 넘어 갔을때 나타나는 녀석)
	  if(showPage>5){
		  end = Math.ceil(showPage/5)*5;
		  if(end>range){
			  end = range;
		  }
		  start = end-4;
		  content += "<a href='#' onclick='listCall("+(start-1)+")'>이전</a> |"
	  }

	  //1~5
	  for(var i = start; i<=end; i++){
		  if(i==showPage){
			content += " <b style='color:red'>"+i+"</b> ";	    			  
		  }//else if(range>=i){
		  else{
			  content += " <a href='#' onclick='listCall("+i+")'>"+i+"</a>";
		  }    			  
	  }
	  //다음(range 가 더있을 경우 나타나는 녀석)
	  if(end<range){
		  content += "| <a href='#' onclick='listCall("+(end+1)+")'>다음</a>"
	  }
	  
	  $('#paging').empty();
	  $('#paging').append(content);
}
</script>
</html>