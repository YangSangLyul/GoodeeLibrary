<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 제이쿼리 -->		
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 부트스트랩 이있다. -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
		
	<!-- 페이징 라이브러리  (제이쿼리 반드시 필요 ,버전도 맞아야함..)-->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <style>
        #noticeBackground{
           /*  background-color: blanchedalmond; */
            width: 900px;
            height: 500px;
            position: absolute;
            left: 27%;
            top: 27%;
        }
        #search{
            width: 100%;
            height: 100%;
            position: absolute;
            left: 27%;
            top: 5%;
        }
        select{
            font-size: large;
        }
        input{
            font-size: large;
        }
        #noticeTable{
            width: 100%;
            height: 100%;
            /* background-color: red; */
        }
        table{
            position: absolute;
            width: 300px;
            left: 3%;
            top: 20%;
            text-align:center;
        }
       
        td{
            border: 1px solid gray;
            height: 40px;
        }
        .n1{
            width: 10%;
            height: 10%;
        }
        .n2{
            width: 70%;
            height: 10%;
        }
        #header{
        margin-top: 20px;
        margin-right: 10px;
        }
         i{
        font-size: 50px;
        }
        #search{
       margin-left: -20%;
        }
        #sid{
        position: absolute;
        top: 17%;
        left: 11%;
        }
        #titleMenu {
            border: 1px solid black;
            background-color: blue;
            width: 200px;
            height: 72px;
            text-align: center;
            padding-top: 20px;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 60px;
            text-align: center;
            padding-bottom: 20px;
        } 
         a{
            color:white
        }
        a:link,a:visited{
            color: black;
            text-decoration: none;
        } 
        p {
		display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
          button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
    </style>
</head>
<body onload=listCall(showPage);>
<div id="header">
<jsp:include page="header.jsp"/>
</div>
<div id="sid">
 <jsp:include page="bookuseSidebar.jsp"></jsp:include>

</div>

    <div id="noticeBackground">
       	<div id="search">
       	
       	
                <select  id="searchSelect">
                
                    <option value="전체">전체</option>
                    <option value="제목">제목</option>
                    <option value="내용">내용</option>
                </select>
                
                <input id="searchName"  type="text"  placeholder="검색해주세요" name="searchName">
                <button onclick="aCall()">검색</button>
       
       	</div>
      
           <table>
			<thead style="color:#0000FF;
			font-weight: bold;
        	border: 1px solid gray;
            height: 60px;">
				<tr>
					<td >번호</td>
					<td >제목</td>
					<td >작성일</td>
				</tr>
			</thead>
			<tbody id="list">
				
			</tbody>
			<tr>
				<td id="paging" colspan="6" style="border: 0px solid white;">
				<!-- 플러그인사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align:center">
						<ul class="pagination" id="pagination">
						
						</ul>
					</nav>
				</div>
				</td>
			</tr>
			
		</table>
   </div>
    
</body>

<script type="text/javascript">

$("#libraryInfo").css('background-color','#337ab7').css("color","white");

$(".menu:eq(1)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(1)").css("background-color","#337ab7");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
})

 var showPage=1;

/*  listCall(showPage);  */

 function aCall(){
	 var showPage=1;
	$("#pagination").twbsPagination('destroy');
	 listCall(showPage); 
 }
 function listCall(reqPage){
	 var params = {
				searchSelect:$("#searchSelect").val()
				,search:$("#searchName").val()		
		}
	var reqUrl = './notice/'+reqPage;
		$.ajax({
			url:reqUrl,
			type:'GET',
			data:params,
			dataType:'JSON',
			success:function(data){
				console.log(data);
				showPage = data.currPage;
				listPrint(data.list);
					console.log(data.range)
				$("#pagination").twbsPagination({
					startPage:data.currPage, //시작페이지
					totalPages:data.range,//생성 가능 최대 페이지
					visiblePages:10,//10개씩 보여주겟다.
					onPageClick:function(evt,page){
						listCall(page);
					}
				})

			},
			error:function(error){
				console.log(error);
			}
		});	
	}

	
function listPrint(list){
	var content="";
	
	for(var i =0;i<list.length;i++){
		var b= list[i].noticeidx;
		content +="<tr>"
		content +="<td class='n1' style='width:60px;'>"+list[i].noticeidx+"</td>"
		content +="<td class='n2'>"+"<a href='noticeDetail/"+b+"'>"+list[i].subject+"</a></td>"
		var date = new Date(list[i].reg_date);
		content +="<td style='width:100px;'>"+date.toLocaleDateString("ko-KR")+"</td>"
		content +="</tr>"
	}
	
	$("#list").empty();  /* empty는 안의 내용만 버리기    remove는 #list자체를 지우는것 */
	$("#list").append(content);
}
	

</script>
</html>