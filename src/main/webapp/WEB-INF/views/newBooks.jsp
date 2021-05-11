<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>newBooksList</title>
        <style>
           #container{
                position: absolute;
                left: 25%;
                width: 60%;
            }
            
            table img{
            	width: 200px;
            	height: 200px;
            }
 
            table{
            	border: 1px solid gray;
                width: 75%;
                height: auto;
                border-radius: 5px;
            }

            table,td,th{
                text-align: center;
                float:left;
            }

            table th{
                background-color: #c5d8f1ff;
            }
            
            td{
            	margin-left: 50px;
            	margin-top: 10px;
            }
            
            #list{
            	float:left;
            }
            
            #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
        	}
        	
        	#noList{
        		display: none;
        		font-size: 30px;
        		font-weight: 600;
        	}
        	
        	#month{
        		position: fixed;
        		left:34.5%;
        		top:13%;
        		height: 50px;
        		width: 50px;
        	}
        	
        	#container h2{
        		
        		width:200px;
        	}
        	        	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    

		<!-- 페이징 라이브러리(제이쿼리가 반드시 필요함, 버전도 맞아야 함) -->
		<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
        

    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="dataserchSidebar.jsp"></jsp:include>
        </div>
		<div id="container">
			<h2>신착 도서 안내</h2>
			<select id="month">
				<option></option>
				<option></option>
				<option></option>
			</select>
            <hr/>

			<p id="noList">해당 달의 신작도서가 없습니다...</p>
			<table>
				<tbody id="list">
					<!-- 불러온 데이터 뿌리는 영역 -->
				</tbody>
				<tr>
					<td id="paging" colspan="6">
						<!-- 플러그인 사용 -->
						<div class="container">
							<nav aria-label="page navigation" style="text-align: center;">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>
        </div>

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(1)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(1)").css("background-color","#337ab7");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(0)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
    })
    
    //시계.. printClock, addZeros 함수 인용 출처 : https://bbaksae.tistory.com/23
    function printClock() {

        var clock = document.getElementById("month");            // 출력할 장소 선택
        $("#month").empty();
        
        var currentDate = new Date();     // 현재시간
        //현재 월
        var calendar = currentDate.getMonth()+1;
        var calendar_prev = calendar - 1;
        var calendar_prev_prev = calendar - 2;
        
        console.log('현재월 : ',calendar,' 이전월 : ',calendar_prev,' 이이전월 : ',calendar_prev_prev);
		
        //new Option(text,value) 형식임
        var firstOption = new Option(calendar+'월',calendar);
        var secondOption = new Option(calendar_prev+'월',calendar_prev);
        var thirdOption = new Option(calendar_prev_prev+'월',calendar_prev_prev);
        
        clock.append(firstOption);
        clock.append(secondOption);
        clock.append(thirdOption);
    }
    
    printClock();
    
    
	var showPage = 1;
	
	listCall(showPage);
	
	$("#month").change(function() {
		//이 구문이 없을 경우 페이지 당 갯수 조정시 페이징 변경이 일어나지 않음.
		$("#pagination").twbsPagination('destroy');
		listCall(showPage);
	});
	
	function listCall(reqPage){
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './newBooks/'+$("#month").val()+"/"+reqPage;
		$.ajax({
			url:reqUrl
			,type:'GET'
			,data:{}
			,dataType:'JSON'
			,success:function(data){
				console.log(data);
				
				if(data.success == '0'){
					console.log('현재 신작도서 없음!');
					$("#noList").css("display","inline");
					$("#list").empty();
					$("table").css("display","none");
				}else if(data.success != '0'){
				$("table").css("display","inline");
				$("#noList").css("display","none");
				//현재 페이지를 가져옴
				showPage = data.currPage;
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.list);
				//pagePrint(data.range); // 플러그인 미사용 페이징 처리
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage// 시작 페이지
					,totalPages:data.range //생성 가능 최대 페이지
					,visiblePages:8 //5개씩 보여주겠다 (1~5)
					,onPageClick:function(evt,page) { //각 페이지를 눌렀을 경우
						//console.log(evt);
						//console.log(page);
						listCall(page);
					}
				});
				}
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	function listPrint(list){
		
		var content = "";
		
		content += "<tr>"
		for(var i=0;i<list.length;i++){
			//총 8개가 나옴
			content += "<td>"+"<a href='searchResultDetail?bookIdx="+list[i].bookIdx+"'><img src='"+list[i].bookImg+"'/></a>"+"</td>";			
		}
		content += "</tr>"
		//그리기전에 이전 내용을 비우는 작업을 해야한다(그래야 쌓이지 않음)
		$("#list").empty();
		$("#list").append(content);
		
	}

    </script>


</html>