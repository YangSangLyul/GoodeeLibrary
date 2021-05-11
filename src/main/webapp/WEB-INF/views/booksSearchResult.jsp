<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            
            .searchBookName p{
            	width:200px;
            	overflow:hidden;
            	text-overflow:ellipsis;
            	white-space: nowrap;
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
        	#btn_rv{
        		background-color: #f3f3f3ff;
        		margin-left:40px;
        	}
        	
        	#hopeLink{
        		color: gray;
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

            <input type="text" id="searchContent" name="searchContent" placeholder="검색어를 입력 해 주세요." value="${searchText}"/>

            <input type="button" id="searchBtn" value="검색"/>
        </div>
        </form>
        <br/>
        <br/>
        <!-- 검색을 했는데 결과가 없을 때 등장하는 텍스트 -->
        <p id="searchResult" style="text-align: center;">검색결과 '${searchText}' 총 ${searchCount}권이 검색되었습니다.</p>
        
        <c:if test="${fn:length(searchList) == 0}">
        <div class="searchResultContent">
        
        	<span>원하시는 도서가 없으신가요? </span><a id="hopeLink" href="./hopeBook"> 희망도서 신청</a><span>을 이용해보세요!</span>
        </div>
        </c:if>
        <!-- 검색결과 영역 -->
        <c:if test="${fn:length(searchList) != 0}">
        <c:forEach items="${searchList}" var="books">
        <div class="searchResultContent">
            <div class="searchImg">
                <a href="searchResultDetail?bookIdx=${books.bookIdx}"><img src="${books.bookImg}"/></a>
            </div>
            <div class="searchBookName">
                <p>${books.bookName}</p>
            </div>
            <div class="reserveChk">
            	<c:if test="${books.bookState eq 'B001'}">
                <p>예약가능</p>
                </c:if>
                <c:if test="${books.bookState eq 'B002'}">
                <p>예약불가</p>
                </c:if>
            </div>
            <div class="searchResultOther">
                저자명 : ${books.writer}<br/>
                출판사 : ${books.publisher}<br/>
                등록번호 : ${books.bookIdx}
            <button id="btn_rv" onclick="location.href='./review_WriteForm?bookIdx=${books.bookIdx}'">리뷰작성하기</button>
            </div>
            <hr/>
        </div>
        </c:forEach>
        </c:if>

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