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
        <!-- ?????? ?????? -->
        <jsp:include page="header.jsp"/>
        
        <div id="sideBar">
        <jsp:include page="dataserchSidebar.jsp"></jsp:include>
        </div>
        <!-- ????????? ??????-->
        <form id="searchForm" action="bookSearchReq" method="POST">
        <div id="searchBox">
            <select name="search">
                <option value="?????????">?????????</option>
                <option value="??????">??????</option>
            </select>

            <input type="text" id="searchContent" name="searchContent" placeholder="???????????? ?????? ??? ?????????." value="${searchText}"/>

            <input type="button" id="searchBtn" value="??????"/>
        </div>
        </form>
        <br/>
        <br/>
        <!-- ????????? ????????? ????????? ?????? ??? ???????????? ????????? -->
        <p id="searchResult" style="text-align: center;">???????????? '${searchText}' ??? ${searchCount}?????? ?????????????????????.</p>
        
        <c:if test="${fn:length(searchList) == 0}">
        <div class="searchResultContent">
        
        	<span>???????????? ????????? ???????????????? </span><a id="hopeLink" href="./hopeBook"> ???????????? ??????</a><span>??? ??????????????????!</span>
        </div>
        </c:if>
        <!-- ???????????? ?????? -->
        <c:if test="${fn:length(searchList) != 0}">
        <c:forEach items="${searchList}" var="books">
        <div class="searchResultContent">
            <div class="searchImg">
                <a href="searchResultDetail?bookIdx=${books.bookIdx}&&searchContent=${searchText}"><img src="${books.bookImg}"/></a>
            </div>
            <div class="searchBookName">
                <p>${books.bookName}</p>
            </div>
            <div class="reserveChk">
            	<c:if test="${books.bookState eq 'B001'}">
                <p>????????????</p>
                </c:if>
                <c:if test="${books.bookState eq 'B002'}">
                <p>????????????</p>
                </c:if>
            </div>
            <div class="searchResultOther">
                ????????? : ${books.writer}<br/>
                ????????? : ${books.publisher}<br/>
                ???????????? : ${books.bookIdx}
            <button id="btn_rv" onclick="location.href='./review_WriteForm?bookIdx=${books.bookIdx}'">??????????????????</button>
            </div>
            <hr/>
        </div>
        </c:forEach>
        </c:if>

    </body>
    <script>
    $("#librarySearch").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(0)").css("background-color","#337ab7").css("color","white");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(0)").css("background-color","#337ab7").css("color","white");
        $(".menu:eq(3)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
    })
    
	$("#searchBtn").click(function(){
		if($("#searchContent").val() == ''){
			alert('????????? ????????? ??????????????????!');
		}else{
			$("#searchForm").submit();
		}
	});
    </script>


</html>