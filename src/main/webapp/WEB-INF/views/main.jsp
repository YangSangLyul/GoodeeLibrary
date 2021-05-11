<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Main</title>
        <style>
            #searchBox{
                position: absolute;
                left: 35%;
            }

            #searchBox input[type="text"]{
                width: 500px;
                text-align: center;
            }

            #place{
                position: absolute;
                left: 5%;
                top: 30%;
                width: 500px;
                height: 300px;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: #c5d8f1ff;
            }

            /*여기는 어떻게 될지 몰라서
            임의의 사진으로 영역 잡아놓음...
            */
            #place img{
                padding: 5px;
                width: 490px;
                height: 230px;
            }
            #noticeBox{
                position: absolute;
                width: 100px;
                left: 40%;
                top: 27%;
            }

            #notice{
                position: absolute;
                width: 40%;
                height: 28%;
                left: 40%;
                top: 34%;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: #c5d8f1ff;
            }
            .noticeContent{
                padding: 5px;
                margin: 10px;
                position: relative;
                width: 95%;
                height: 10%;
                border: 1px solid gray;
                border-radius: 5px;
                background-color: white;
                margin-top: 20px;
            }

            #btnList{
                position: absolute;
                left: 26%;
                top: 70%;
            }

            #btnList button{
                width: 150px;
                height: 50px;
                background-color: white;
                border: 1px solid gray;
            }

            #btnList #adminRecommend{
                background-color: #c5d8f1ff;
            }

            #recommendList{
                position: absolute;
                left: 33%;
                top: 70%;
                width: 47%;
                height: 20%;
                border: 1px solid gray;
                border-radius: 5px;
                padding: 5px;
            }

            #recommendList img{
                margin-left: 15px;
                width: 180px;
                height: 210px;
                padding: 10px;
            }

            #noticeAll{
                position: absolute;
                left: 74.8%;
                top: 29.8%;
            }

            #noticeAll button{
                width: 100px;
                height: 40px;
                background-color: #c5d8f1ff;
                border: 1px solid gray;
                border-radius: 5px;
            }

            a:link { 
                color: gray; 
                text-decoration: none;
            }
            a:visited {
                color: gray; 
                text-decoration: none;
            }
            a:hover {
                color: gray;
            }
            #popup{
            	position: absolute;
                width: 400px;
                height: 400px;
                background-color: white;
                top:20%;
                left:35%;
                border: 1px solid black;
                z-index: 5; 
                text-align: center;
            }
               	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        
    </head>
    <body>
        <!-- 헤더 영역 -->
        <jsp:include page="header.jsp"/>
        <!-- 팝업 -->
		<div id="popup">
			<c:if test="${pop.noticestatus eq 'true'}">
				<h2 style="font-size: 40px;">${pop.subject}</h2>
				<br/>
				<h4 style="font-size: 20px;">${pop.content}</h4>
				<div style="font-size: 20px; margin-top: 130px;">
				<hr/>
					오늘 하루 열지 않기<input type="checkbox" style="width: 20px; height: 20px;" id="todayChk" name="todayChk" >
					<a href="#" onclick="closeBtn();" style="color: blue; margin-left: 100px; font-size: 25px;" id="closeBtn" >X</a>
				</div>
			</c:if>
		</div>
		
        <!-- 검색창 영역-->
        <form id="searchForm" action="bookSearchReq" method="POST">
        <div id="searchBox">
            <select name="search">
                <option value="도서명">도서명</option>
                <option value="저자">저자</option>
            </select>

            <input type="text" id="searchContent" name="searchContent" placeholder="검색어를 입력 해 주세요."/>

            <input type="button" id="searchBtn" value="검색"/>
        </div>
        </form>

        <!--도서관 위치 영역-->
        <div id="place">
            <p style="text-align: center;">도서관 위치</p>
            <div style="position: absolute; left: 5px"> <jsp:include page="mainMap.jsp"/></div>
        </div>

        <!--공지사항 영역-->
        <div id="noticeBox">
            <p style="text-align: center; background-color: #c5d8f1ff; height: 30px; padding: 10px; border: 1px solid gray; border-radius: 5px;">공지사항</p>
        </div>
        <!--공지사항 목록은 최신순으로 4개까지만...-->
        <div id="noticeAll">
            <button onclick="location.href='notice'">더보기</button>
        </div>
        
        <div id="notice">
            <c:forEach items="${noticeList}" var="dto">
            <div class="noticeContent">
                <a href="noticeDetail/${dto.noticeidx}">${dto.content} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                <p style="text-align: right; margin-top: -20px;">${dto.noticeidx} 번 게시글&nbsp;&nbsp;${dto.reg_date}</p>
            </div>
            </c:forEach>
        </div>

        <!--추천도서 영역-->
        <div id="btnList">
            <button id="adminRecommend" onclick="listCall()">사서 추천 도서</button><br/>
            <button id="monthReview" onclick="reviewListCall()">월간 리뷰多 도서</button><br/>
            <button id="monthNewBook" onclick="recommendListCall()">이번 달 신작 도서</button><br/>
        </div>
        <div id="recommendList">
        </div>
        

    </body>
    <script>
    
    //팝업 쿠키 굽기
    $(document).ready(function(){
	    cookiedata = document.cookie;
	    if(cookiedata.indexOf("close=Y")<0){
	    	$("#popup").css("display","block");
	    }else{
	    	$("#popup").css("display","none");
	    }
	});
    
	function getCookie(cname) {
	    var name = cname + "=";
	    var ca = document.cookie.split(';');
	    for(var i=0; i<ca.length; i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ') c = c.substring(1);
	        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
	    }
	    return "";
	}
	
	function setCookie(cname, cvalue, exdays) {
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+d.toUTCString();
	    document.cookie = cname + "=" + cvalue + "; " + expires;
	}
	
	function closeBtn(){ //닫기 버튼 클릭 시 
    	
	    if($('input:checkbox[name=todayChk]')[0].checked) {
	    	console.log("체크");
	    	setCookie("close","Y",1);
	    }
	    $("#popup").css("display","none");
	}
	
	//alert
    var msg = "${msg}";
    if(msg!=""){
    	alert(msg);
    }
    
    //시계.. printClock, addZeros 함수 인용 출처 : https://bbaksae.tistory.com/23
    function printClock() {

        var clock = document.getElementById("month");            // 출력할 장소 선택
        
        
        var currentDate = new Date();     // 현재시간
        //현재 월
        var calendar = currentDate.getMonth()+1;
        
        console.log('현재월 : ',calendar);
        
        return calendar;
    }
    
    //시작은 무조건 사서 추천도서 5개 불러오기
	listCall();
	
	//사서 추천도서
	function listCall(){
		
		var children = document.getElementById("btnList");
		
		console.log(children.childNodes);
		
		// 0 1 2 3 4 5 6 7 8 9
		
		for(var i = 1;i<children.childNodes.length;){
			
			console.log('색 체크 확인');
			children.childNodes[i].style.backgroundColor = 'white';
			
			if(i == 1){
				children.childNodes[i].style.backgroundColor = '#c5d8f1ff';
			}
			i = i + 3;
		}
		
		var month = printClock();
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './mainRecommendBooksList/'+month;
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
					$("#recommendList").empty();
				}else if(data.success != '0'){
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.list);
				}
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	//추천을 많이 받은 도서
	function reviewListCall(){
		
		var children = document.getElementById("btnList");
		
		console.log(children.childNodes);
		
		// 0 1 2 3 4 5 6 7 8 9
		
		for(var i = 1;i<children.childNodes.length;){
			
			console.log('색 체크 확인');
			children.childNodes[i].style.backgroundColor = 'white';
			
			if(i == 4){
				children.childNodes[i].style.backgroundColor = '#c5d8f1ff';
			}
			i = i + 3;
		}
		
		var month = printClock();
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './reviewRecommendBooksList/'+month;
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
					$("#recommendList").empty();
				}else if(data.success != '0'){
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.list);
				}
			}
			,error:function(error){
				console.log(error);
			}
		});
	}
	
	//사서추천도서 리스트
	function recommendListCall(){
		
		var children = document.getElementById("btnList");
		
		console.log(children.childNodes);
		
		// 0 1 2 3 4 5 6 7 8 9
		
		for(var i = 1;i<children.childNodes.length;){
			
			console.log('색 체크 확인');
			children.childNodes[i].style.backgroundColor = 'white';
			
			if(i == 7){
				children.childNodes[i].style.backgroundColor = '#c5d8f1ff';
			}
			i = i + 3;
		}
		
		var month = printClock();
		//restful service 는 ajax를 통해 호출하여 사용하는 경우가 많지만
		//그렇다고 restful service == ajax 라고 생각해서는 안된다..
		var reqUrl = './authorRecommendBooksList/'+month;
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
					$("#recommendList").empty();
				}else if(data.success != '0'){
				//가져온 리스트를 뿌려주는 함수 실행
				listPrint(data.list);
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
			content += "<a href='searchResultDetail?bookIdx="+list[i].bookIdx+"'><img src='"+list[i].bookImg+"'/></a>";
		}

		//그리기전에 이전 내용을 비우는 작업을 해야한다(그래야 쌓이지 않음)
		$("#recommendList").empty();
		$("#recommendList").append(content);
		
	}
    
	$("#searchBtn").click(function(){
		if($("#searchContent").val() == ''){
			alert('검색할 내용을 입력해주세요!');
		}else{
			$("#searchForm").submit();
		}
	});
    </script>


</html>