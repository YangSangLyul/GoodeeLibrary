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
         #QBack{
            background-color: blanchedalmond;
            width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
        }
        #buttonBox{
            position: absolute;
            left: 20%;
        }
        .writebox{
            position: absolute;
            left: 180%;
        }
        #QuestionTable{
            text-align: center;
            position: absolute;
            left: 16%;
            top: 10%;
        }
        .n1{
            width: 100px;
            height: 10px;
        }
        .n2{
            width: 400px;
            height: 30px;
        }
    </style>
</head>

<body>
	<!-- 헤더 영역 -->
    <jsp:include page="header.jsp"/>
    <div id="QBack">
        <div id="buttonBox">
            <button>전체</button>
            <button>열람실</button>
            <button>도서</button>
            <button>서비스</button>
            <button>기타</button>
            <button class="writebox" onclick="location.href='questionWrite'">글쓰기</button>
        </div>

        <div id="QuestionTable">
            <table>
                <tr>
                    <th class="n1">글번호</th>
                    <th class="n2">제목</th>
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
</body>
<script>
var showPage=1;
//listCall('./myLib_question/5/1');//시작하자 마자 이 함수를 호출
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
         //pagePrint(data.range);//플러그인 미사용 페이징 처리!
         //플러그인 사용
         ///*
         $("#pagination").twbsPagination({
      	   startPage:data.currPage,//시작페이지
      	   totalPages:data.range,//총 페이지
      	   visiblePages:5,//5개씩 보여주겠다.(1~5)
      	   onPageClick:function(evt,page){//각 페이지를 눌렀을 경우
      		   console.log(evt);
      		   console.log(page); 
      		   listCall(page);
      	   } 
         });
         //*/
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


function listPrint(page_list){
	  var content="";
	  
	  for(var i=0; i<page_list.length;i++){
		content += "<tr>"
		content += "<td class='n1'>"+page_list[i].queidx+"</td>"
		//Idx 값 불러오는거 수정하기!!
		content += "<td class='n2'><a href='./question_detail?idx=50'>"+page_list[i].subject+"</a></td>"
		content += "<td>"+page_list[i].id+"</td>"
		var date = new Date(page_list[i].reg_date);
		content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
		content += "<td>"+page_list[i].ansstatus+"</td>"
		  	content += "</tr>"
	    		  
	  }
	  $("#question_list").empty();  
	  $("#question_list").append(content);
}

</script>
</html>