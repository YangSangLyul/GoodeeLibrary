<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>블라인드 리스트</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                width: 650px;
                height: 100px;
                margin: auto;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
            } 
            button{
                padding: 10px;
                padding-inline: 35px;
                margin: 20px;
            }
            h4{
                text-align: left;
            }
            #decision{
                position: absolute;
                left: 1139px;
                top: 235px;
            }
        </style>
    </head>
    <body>
        <!-- 상단 네비게이션 자리 -->
        <hr/>
        <div id="tabMenu">
            <button onclick="location.href='ReviewKing'">이달의 리뷰왕</button>
            <button onclick="location.href='ReportList'">신고 리스트</button>
            <button onclick="location.href='BlindList'">블라인드 리스트</button>
        </div>
        <br/>
        <table>
            <tr>
                <th>번호</th>
                <th>신고사유</th>
                <th>블라인드사유</th>
                <th>등록날짜</th>
                <th>해제</th>
            </tr>
            <c:forEach items="${blind}" var="blind">
	            <tr>
	                <td>${blind.blindIdx}</td>
	                <td><a class="reason" href="reportDetail?idx=${blind.reportIdx}">${blind.reportReason}</a></td>
	                <td>${blind.blindReason}</td>
	                <td>${blind.blind_date}</td>
	                <td>
	                    <input type="button" id="blind" value="블라인드 해제"/>
	                </td>
	            </tr>
            </c:forEach>
        </table>
        <!-- 페이징 처리 자리 -->
    </body>
    <script>
    	//10자 초과 시 ...로 표시
	    var txt = document.getElementsByClassName("reason");
	    function textLengthOverCut(text, len, lastTxt) {
    		if (len == "" || len == null) { // 기본값
	            len = 10;
	        }
	        if (lastTxt == "" || lastTxt == null) { // 기본값
	            lastTxt = "...";
	        }
    		for (var i=0; i < txt.length; i++) {
		        if (txt[i].innerText.length > len) {
		            txt[i].innerText = txt[i].innerText.substr(0, len) + lastTxt;
		        }
			}
    		return txt;
	    }
	    textLengthOverCut();
    
    </script>
</html>