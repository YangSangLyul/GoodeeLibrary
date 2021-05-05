<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>내 희망도서</title>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>
	#my_title{
	    text-align: center;
	    background-color: white;
	    width: 200px;
	    height: 30px;
	    margin-left: 40%;
	    border: 1px solid black;
	}
	#body{
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 800px;
	    height: 400px;
	}
	
	body div{
	    text-align: center;
	}
	
	#table{
	    border: 1px solid black;
	    border-collapse: collapse;
	    margin-left: 15%;
	    margin-top: 20%;
	    margin-bottom: 80px;
	    text-align: center;
	}
	#table th{
	    background-color:#c5d8f1ff;
	}
	#table td{
	    background-color:white;
	}
	table,th,td{
	    border: 1px solid black;
	    border-collapse: collapse;
	}
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
   	<div>
    <div id="my_title">${loginId}의 희망도서 신청 내역</div>
    <jsp:include page="mySidebar.jsp"/>
    <div id="body">
        <table id="table">
            <tr>
                <th>도서명</th>
                <th>신청일자</th>
                <th>처리상태</th>
            </tr>
            <br/>
            <tbody id="hope_list">
             
            </tbody>
        	<tr>
			<!-- 페이징 번호 보여주기 -->
            <td id="paging" colspan="4">
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

listCall(showPage);

function listCall(reqPage){         

	//주소 다른주소로 보내라.
	var reqUrl ='./myLib_Hbook/'+10+"/"+reqPage;
   $.ajax({
      url: reqUrl
      ,type:'get'
      ,data:{}
      ,dataType:'JSON'
      ,success:function(data){
         console.log(data);
         console.log(data.hope_list);
         showPage = data.currPage;
         listPrint(data.hope_list);
         //pagePrint(data.range);//플러그인 미사용 페이징 처리!
         //플러그인 사용
         
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

function pagePrint(range){
	  console.log("생성 가능 페이지 : "+range);
	  console.log("현재 페이지 : "+showPage);
	  var content="";
	  var start=1;
	  var end = range >= 10? 10: range;
	  
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


function listPrint(hope_list){
	  var content="";
	  for(var i=0; i<hope_list.length;i++){
		content += "<tr>"
		content += "<td><a href='./myHBookDetail?hopeBooksNumber="+hope_list[i].HOPEBOOKSNUMBER+"'>"+hope_list[i].HB_BOOKNAME+"</a></td>"
		var date = new Date(hope_list[i].HB_DATE);
		content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>"
		//content += "<td>"+reserve_list[i].bstate+"</td>"
		if(hope_list[i].HB_STATE == 'H001'){
			content += "<td>신청중</td>"
		}else if(hope_list[i].HB_STATE == 'H002'){
			content += "<td>승인</td>"
		}else if(hope_list[i].HB_STATE == 'H003'){
			console.log(hope_list[i].REJECT);
			var reject = hope_list[i].REJECT;
			content += "<td><input type='button' value='거부' onclick='reason()'/></td>"
			content += "<input type='hidden' name='reject' value='${hope_list[i].REJECT}'/>"	
		}
		content += "</tr>"

	  $("#hope_list").empty();  
	  $("#hope_list").append(content);

	  }
}
function reason(){
	console.log("버튼 클릭");
	console.log(hope_list);
	console.log(hope_list.reject);
	console.log("거부이유");
	
	alert("신청거부되었습니다.");
}	
</script>
</html>