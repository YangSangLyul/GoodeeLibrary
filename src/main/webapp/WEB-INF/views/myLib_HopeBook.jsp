<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>내 희망도서</title>
    <meta charset="UTF-8">
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
	
	#table{
		width:400px;
		position: relative;
	    margin-left: 30%;
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
	    position:relative;
	}
	th,td{
	    height:50px;
	    text-align: center;
	    border: 1px solid black;
	    border-collapse: collapse;
	    position:relative;
	}     
	#paging{
        position: fixed;
        left:20%;
        top:80%;
     }
     .subject{
     	font-style: italic;
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
   	<div>
    <div id="my_title">${loginId}의 희망도서 신청 내역</div>
    <div id="sideBar">
        <jsp:include page="mySidebar.jsp"/>
    </div>
    <div id="body">
        <table id="table">
            <tr>
                <th>도서명</th>
                <th>신청일자</th>
                <th>처리상태</th>
            </tr>
            <tbody id="hope_list">
             
            </tbody>
        </table>
			<!-- 페이징 번호 보여주기 -->
            <div id="paging" colspan="3">
            	<!-- 플러그인 사용 -->
            	<div class="container">
            		<nav aria-label="page navigation" style="text-align:center">
            			<ul class="pagination" id="pagination"></ul>
            		</nav>
            	</div>
            </div>
    </div>
    </div>
</body>
<script>
$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(2)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(2)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(4)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})

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
         showPage = data.currPage;
         listPrint(data.hope_list);
         
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

function listPrint(hope_list){
	  var content="";
	  for(var i=0; i<hope_list.length;i++){
		content += "<tr>"
		content += "<td class='subject'><a href='./myHBookDetail?hopeBooksNumber="+hope_list[i].HOPEBOOKSNUMBER+"'>"+hope_list[i].HB_BOOKNAME+"</a></td>"
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
			console.log(reject);
			content += "<td><input type='button' value='거부' onclick='reason(this)'/>";
			content += "<input type='hidden' id='reject' name='reject' value='"+reject+"'/></td>"	
		}
		content += "</tr>"

	  $("#hope_list").empty();  
	  $("#hope_list").append(content);

	  }
}
function reason(aaa){
	console.log("버튼 클릭");
	console.log("거부이유");
	console.log(aaa);
	console.log($("#reject").val());
	var parent = $(aaa).parent();
	var childValue = $(parent.children()[1]).attr("value")
	console.log(parent);
	console.log('요소 값 가져오기 : ',childValue);
	
	
	alert("거부사유 : "+childValue);
}	
</script>
</html>