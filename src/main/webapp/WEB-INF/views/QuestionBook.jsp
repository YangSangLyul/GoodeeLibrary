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
<jsp:include page="bookuseSidebar.jsp"></jsp:include>
    <div id="QBack">
        <div id="buttonBox">
            <button onclick="location.href='QuestionAll'">전체</button>
            <button onclick="location.href='QuestionRoom'">열람실</button>
            <button onclick="location.href='QuestionBook'">도서</button>
            <button onclick="location.href='QuestionService'">서비스</button>
            <button onclick="location.href='QuestionGuitar'">기타</button><!--etc-->
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
                 <tbody id="list">
				
				</tbody>
                <tr>
				<td id="paging" colspan="6">
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
    </div>
</body>
<script type="text/javascript">
var showPage=1;

listCall(showPage); 


function listCall(reqPage){
	
		var reqUrl = './QuestionBook/'+reqPage;
		
		$.ajax({
			url:reqUrl,
			type:'GET',
			dataType:'JSON',
			success:function(data){
				console.log(data);
				showPage = data.currPage;
				console.log(data.range);
				console.log(data.list)
				listPrint(data.list);
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
		var b= list[i].queidx;
		content +="<tr>"
		content +="<td class='n1'>"+list[i].queidx+"</td>"
		content +="<td class='n2'>"+"<a href='questionDetail/"+b+"'>"+list[i].subject+"</a></td>"
		content +="<td>"+list[i].id+"</a></td>"
		var date = new Date(list[i].reg_date);
		content +="<td>"+date.toLocaleDateString("ko-KR")+"</td>"
		if(list[i].showstatus=='TRUE'){
		content +="<td>답변완료</td>"
		}else if(list[i].showstatus=='FALSE'){
		content +="<td>답변대기중</td>"	
		} 
		content +="</tr>"
	}
	
	$("#list").empty();  /*   empty는 안의 내용만 버리기    remove는 #list자체를 지우는것  */
	$("#list").append(content);
} 
</script>



</html>