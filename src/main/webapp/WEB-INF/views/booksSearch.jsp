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

            .searchResultContent{
                width: 650px;
                height: 200px;
                position: relative;
                margin-top: 50px;
                left: 35%;
            }

            .searchImg img{
                width: 200px;
                height: 200px;
            }

            .searchBookName{
                padding: 5px;
                background-color: #f3f3f3ff;
                width: 350px;
                position: absolute;
                left: 45%;
                top: 0%;
            }

            .reserveChk{
                position: absolute;
                height: 100px;
                width: 200px;
                left: 85%;
                top: 0%;
            }

            .searchResultOther{
                position: absolute;
                left: 45%;
                top: 40%;
            }
            
            #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
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
        
        <div id="sideBar">
        <jsp:include page="dataserchSidebar.jsp"></jsp:include>
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
        <br/>
        <br/>
        <!-- 아무것도 검색 안했을 때 등장하는 텍스트-->
        <p id="noSearch" style="text-align: center;">찾고 싶은 도서를 검색하세요.</p>
        

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(0)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
    })
    
		$("#searchBtn").click(function(){
			if($("#searchContent").val() == ''){
				alert('검색할 내용을 입력해주세요!');
			}else{
				$("#searchForm").submit();
			}
		});
    </script>


</html>