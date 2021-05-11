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
            
            #show{
            	
            	position: relative;
            	width: 1000px;
            	height:500px;
            }
            
           .bookImg img{
                position: relative;
                width: 400px;
                height: 400px;
            }
            
            .bookImg{
            	width: 400px;
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
        	
        	#story{
        		position: relative;
        		width:500px;
        		height: 200px;
        		border: 1px solid gray;
        		border-radius: 10px;
        		left: 45%;
        		margin-top: -40%;
        		padding: 10px;
        		overflow: auto;
        	}
        	
        	#reason{
        		position: relative;
        		width:500px;
        		height: 200px;
        		border: 1px solid gray;
        		border-radius: 10px;
        		margin-top: 10px;
        		left: 45%;
        		padding: 10px;
        		overflow: auto;
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
			<h2>사서 추천 도서</h2>
            <hr/>

			<p id="noList">해당 달의 사서 추천 도서가 없습니다...</p>
			
			<div id="show">
				
			</div>
			
			<div id="paging">
				<!-- 플러그인 사용 -->
				<div class="container">
					<nav aria-label="page navigation" style="text-align: center;">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</div>

				
			
        </div>

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(2)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(2)").css("background-color","#337ab7");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(0)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
    })
    
    //시계.. printClock, addZeros 함수 인용 출처 : https://bbaksae.tistory.com/23
    function printClock() {

        var clock = document.getElementById("month");            // 출력할 장소 선택
        
        
        var currentDate = new Date();     // 현재시간
        //현재 월
        var calendar = currentDate.getMonth()+1;
        
        console.log('현재월 : ',calendar);
        
        return calendar;
    }
    
    
	var showPage = 1;
	
	listCall(showPage);
	
	function listCall(reqPage){
		
		var month = printClock();
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './recommendBooksList/'+month+"/"+reqPage;
		console.log(reqUrl);
		$.ajax({
			url:reqUrl
			,type:'GET'
			,data:{}
			,dataType:'JSON'
			,success:function(data){
				console.log(data);
				
				if(data.success == '0'){
					console.log('현재 사서추천도서 없음!');
					$("#noList").css("display","inline");
					$("#show").empty();
				}else if(data.success != '0'){
				$("#noList").css("display","none");
				//현재 페이지를 가져옴
				showPage = data.currPage;
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.list);
				//pagePrint(data.range); // 플러그인 미사용 페이징 처리
				//플러그인 사용
				$("#pagination").twbsPagination({
					startPage:data.currPage// 시작 페이지
					,totalPages:5 //생성 가능 최대 페이지
					,visiblePages:5 //5개씩 보여주겠다 (1~5)
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
		

		for(var i=0;i<list.length;i++){
			//총 8개가 나옴
			content += "<div class='bookImg'>"+"<a href='searchResultDetail?bookIdx="+list[i].bookIdx+"'><img src='"+list[i].bookImg+"'/></a>"+"</div>";
			content += "<div id='story'>"+list[i].story+"</div>";
			content += "<div id='reason'>사서의 추천 이유 : "+list[i].reason+"</div>";
		}

		//그리기전에 이전 내용을 비우는 작업을 해야한다(그래야 쌓이지 않음)
		$("#show").empty();
		$("#show").append(content);
		
	}

    </script>


</html>