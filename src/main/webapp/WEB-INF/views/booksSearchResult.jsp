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
            
            #sideBar{
        		position: absolute;
        		margin-left: 10%;
        		margin-top: 3%;
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
        <!-- 검색을 했는데 결과가 없을 때 등장하는 텍스트 -->
        <p id="searchResult" style="text-align: center;">검색결과 '${searchText}' 총 ${searchCount}권이 검색되었습니다.</p>
        <!-- 검색결과 영역 -->
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
            </div>
            <hr/>
        </div>
        </c:forEach>
        

    </body>
    <script>

    </script>


</html>