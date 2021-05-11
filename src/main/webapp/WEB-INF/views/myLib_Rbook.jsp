<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>나의 도서 예약 내역</title>
            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    

		<!-- 페이징 라이브러리(제이쿼리가 반드시 필요함, 버전도 맞아야 함) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <style>
    
    #sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 200px;
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
	
	
	#table{
		position: relative;

	    margin-left: 15%;
	    top: 10%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	#table th{
	    background-color:#c5d8f1ff;
	    text-align: center;
	}
	#table td{
	    background-color:white;
	    text-align: center;
	}
	table,tr,th,td{
	    width:700px;
	    height:50px;
	    text-align: center;
	    border: 1px solid black;
	    border-collapse: collapse;
	}        	
	#paging{
        
        position: fixed;
        left:20%;
        top:80%;
     }
     
     #noReserveBook{
     	position: relative;
     	top:5%;
   
     }
   
   #btn{
   	background-color: lime;
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

    <div id="my_title">${loginId}의 도서예약 내역</div>
    <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
    
    <div id="body">
    <p id="noReserveBook">현재 예약되거나 대여중인 도서가 없습니다.</p>
    
        <table id="table">
            <tr>
                <th>예약/대여 날짜</th>
                <th>도서명</th>
                <th>상태</th>
                <th>취소/반납</th>
            </tr>
            <tbody id="reserve_list">
             
             </tbody>
            <!-- <tr>
                <td>21.04.05</td>
                <td>자바 스크립트</td>
                <td>예약중</td>
                <td>예약취소</td>
            </tr> -->
         
       </table>
       			<!-- 페이징 번호 보여주기 -->
            <div id="paging">
            	<!-- 플러그인 사용 -->
            	<div class="container">
            		<nav aria-label="page navigation" style="text-align:center">
            			<ul class="pagination" id="pagination"></ul>
            		</nav>
            	</div>
            </div>
    </div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(1)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(1)").css("background-color","#337ab7");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(4)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})

function writeForm(aaa){
	console.log("책번호");
	console.log(aaa);
	console.log($("#bookIdx").val());
	var parent = $(aaa).parent();
	var childValue = $(parent.children()[1]).attr("value")
	console.log(parent);
	console.log('요소 값 가져오기 : ',childValue);
	window.open('review_WriteForm?bookIdx='+childValue,'pop','width=840,height=460,top=280');
}

var showPage=1;

listCall(showPage);

function listCall(reqPage){         

	//주소 다른주소로 보내라.
	var reqUrl ='./myLib_Rbook/'+reqPage;
   $.ajax({
      url: reqUrl
      ,type:'get'
      ,data:{}
      ,dataType:'JSON'
      ,success:function(data){
         showPage = data.currPage;
         if(data.reserve_list.length == 0){
        	 console.log('아무것도 없슴다');
        	 $("#noReserveBook").css("display","inline");
        	 $("#table").css("display","none");
         }else{
        	 console.log('뭐라도 있네요')
        	 $("#table").css("display","block");
        	 $("#noReserveBook").css("display","none");
         	listPrint(data.reserve_list);
         }
         $("#pagination").twbsPagination({
      	   startPage:data.currPage,//시작페이지
      	   totalPages:data.range,//총 페이지
      	   visiblePages:5,//5개씩 보여주겠다.(1~5)
      	   onPageClick:function(evt,page){
      		   listCall(page);
      	   } 
         });
      }
      ,error:function(error){
         console.log(error);
         
      }
   });
}


function listPrint(reserve_list){
	  var content="";
	  for(var i=0; i<reserve_list.length;i++){
		  
	  	console.log(reserve_list[i].rstate);
	  	if(reserve_list[i].rstate == 'R001' ||reserve_list[i].rstate == 'R002'){
		content += "<tr>"
		var date = new Date(reserve_list[i].REG_DATE);
		content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
		content += "<td><a href='./myRBookDetail?bookIdx="+reserve_list[i].BOOKIDX+"'>"+reserve_list[i].BOOKNAME+"</a></td>"
		//content += "<td>"+reserve_list[i].bstate+"</td>"
		if(reserve_list[i].rstate == 'R001'){
			content += "<td>예약중</td>"
			content += "<td><a href='./reserveBookCancel?reserveBookIdx="+reserve_list[i].RESERVEBOOKIDX+"'>예약취소</a></td>"
		}else if(reserve_list[i].rstate == 'R002'){
			content += "<td>대여중</td>"
			content += "<td><a href='./myBookReturn?reserveBookIdx="+reserve_list[i].RESERVEBOOKIDX+"'>반납하기</a></td>"
		}
		
	    		  
	  }else if(reserve_list[i].rstate == 'R003'){
			content += "<tr>"
			var date = new Date(reserve_list[i].REG_DATE);
			content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
			content += "<td>"+reserve_list[i].BOOKNAME+"</td>"
			content += "<td>반납완료</td>"
			var bookIdx = reserve_list[i].BOOKIDX;
			console.log('책번호:'+bookIdx);
			content += "<td><input type='button' onclick='writeForm(this)' value='리뷰작성하기' />"
			content += "<input type='hidden' id='bookIdx' name='bookIdx' value='"+bookIdx+"'/></td>"
			//href='./review_WriteForm?bookIdx="+reserve_list[i].BOOKIDX+"'>리뷰작성하기</a></td>
	  }
}
	  content += "</tr>"
	  $("#reserve_list").empty();  
	  $("#reserve_list").append(content);
}

</script>
</html>