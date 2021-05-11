<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
   	<title>내 문의 내역 리스트</title>
   	<!-- Tip!! 제이쿼리가 부트스트랩보다 위에 있어야해 -->
   	<!-- 제이쿼리 (보통 부트스트랩이랑 같이 사용) -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
   	<!-- 부트스트랩 (반응형 디자인을 위한 css 라이브러리) -->
   	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
     	
	<!-- 페이징 라이브러리(제이쿼리 반드시 필요, 버전도 맞아야함!) -->
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
		    margin-left: 45%;
		    margin-bottom: 1%;
		    border: 1px solid black;
		}
		#body{
			position: absolute;
			text-align: center;
		    background-color: beige;
		    margin-left: 25%;
		    width: 1400px;
		    height: 900px;
		}
       
		#table th{
		    background-color:#c5d8f1ff;
		    text-align: center;
		    border:1px solid black;
		    width:10px;
		    height:30px;
		}
		#table td{
		    background-color:white;
		    text-align: center;
		    border:1px solid black;
		    position: relative;
		    top: 30%;
		    margin-bottom: 80px;
		    height:40px;
		}
       
        #QuestionTable{
            text-align: center;
            position: absolute;
            left:10%;
            top: 10%;
        }
        
        .n1{
            width: 50px;
            height: 10px;
        }
        .n2{
            width: 50px;
            height: 30px;
        }
        
        #paging{
	        position: fixed;
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
	<!-- 헤더 영역 -->
    <jsp:include page="header.jsp"/> 
    <div id="my_title">${loginId}의 문의 내역</div>
   	<div>
   	<div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
    <div id="body">
        <!-- <div id="buttonBox">
            <button name="QAll">전체</button>
            <button onclick="location.href='QRoom'">열람실</button>
            <button onclick="location.href='QBook'">도서</button>
            <button onclick="location.href='QService'">서비스</button>
            <button onclick="location.href='QOthers'">기타</button>
            <button class="writebox" onclick="location.href='questionWrite'">글쓰기</button>
        </div> -->

        <div id="QuestionTable">
            <table id='table'>
                <tr>
                    <th class='n1'>글번호</th>
                    <th class='n2'>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>답변</th>
                </tr>
             <tbody id="question_list">
             
             </tbody>
                <%-- <c:forEach items="${questionList}" var="list">
				<tr>
					<td class="n1">${list.queidx}</td>
					<td class="n2"><a href="./question_detail?idx=${list.queidx}">${list.subject}</a></td>
					<td>${list.id}</td>
					<td>${list.reg_date}</td>
					<td>${list.ansstatus}</td>
				</tr>
				</c:forEach> --%>     	
				<tr>
					<!-- 페이징 번호 보여주기 -->
		            <td id="paging" colspan="5">
		            	<!-- 플러그인 사용 -->
		            	<div class="container">
		            		<nav aria-label="page navigation" style="text-align:center">
		            			<ul class="pagination" id="pagination"></ul>
		            		</nav>
		            	</div>
		            </td>
		         </tr>
            </table>
        </div>
    </div>
    </div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(4)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(4)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})
var showPage=1;

listCall(showPage);

function listCall(reqPage){         

	var reqUrl ='./myLib_question/'+5+"/"+reqPage;
   $.ajax({
      url: reqUrl
      ,type:'get'
      ,data:{}
      ,dataType:'JSON'
      ,success:function(data){
         console.log(data);
         showPage = data.currPage;
         listPrint(data.page_list);
        
         $("#pagination").twbsPagination({
      	   startPage:data.currPage,//시작페이지
      	   totalPages:data.range,//총 페이지
      	   visiblePages:5,//5개씩 보여주겠다.(1~5)
      	   onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
      		   //console.log(evt);
      		   //console.log(page); 
      		   listCall(page);
      	   } 
         });
         
      }
      ,error:function(error){
         console.log(error);
         
      }
   });
}

function listPrint(page_list){
	  var content="";
	  
	  for(var i=0; i<page_list.length;i++){
		content += "<tr>"
		content += "<td calss='n1'>"+page_list[i].queidx+"</td>"
		content += "<td calss='n2'><a href='./myLib_question_detail?idx="+page_list[i].queidx+"&&ansstatus="+page_list[i].ansstatus+"'>"+page_list[i].subject+"</a></td>"
		content += "<td>"+page_list[i].id+"</td>"
		var date = new Date(page_list[i].reg_date);
		content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
		
		if(page_list[i].ansstatus == 'FALSE'){
			content += "<td>답변대기중</td>";
		}else if(page_list[i].ansstatus == 'TRUE'){
			content += "<td>답변완료</td>";
		}
	  	content += "</tr>"
  }
  $("#question_list").empty();  
  $("#question_list").append(content);
}

</script>
</html>