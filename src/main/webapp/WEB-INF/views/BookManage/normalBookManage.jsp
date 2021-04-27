<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>J-Query</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <style>
        #bookManageMain{
            position: absolute;
            top: 20%;
            left: 20%;
        }
        table, th, td{
            border: 1px solid black;
        }
    </style>
</head>

<body>
    <div id="bookManageMain">
        <div id="bookFilter">
            <button id="toggle">필터 옵션</button>
            <form action="normalBookFilter" method="POST">
                <span><input type="checkbox" name="filter" value="R001"/>예약중</span>
                <span><input type="checkbox" name="filter" value="B001"/>예약가능</span>
                <span><input type="checkbox" name="filter" value="B002"/>예약불가</span>
                <span><input type="checkbox" name="filter" value="B007"/>숨김</span>
                <input type="submit" value="검색"/>
            </form>
        </div>
        <button>도서 등록</button>

        <div>
            <table>
            <c:forEach items="${list}" var="book">
                <tr>
                    <td rowspan="3">
                       <img src="${book.bookImg}" width="100px" height="100px"/>
                    </td>
                     <th>${book.bookName}</th>
					 <c:if test="${book.bookState eq 'B001'}">
                    <td>
                        <select name="bookState">
                            <option value="">예약가능일 때만 상태 변경 가능</option>
                            <option value="">숨김</option>
                        </select>
                    </td>
                    </c:if> 
					</tr>
                <tr>
                    <td colspan="2">${book.writer}</td>
                </tr>
                <tr>
                    <td colspan="2">${book.publisher}</td>
                </tr>
            </c:forEach>
            </table>
        </div>
    </div>
</body>
<script>
    $('span').toggle(0);
    $('input[type=submit]').toggle(0);
    $('#toggle').click(function () {
        $('span').toggle(500);
        $('input[type=submit]').toggle(500);
    })

    $('span').click(function(){
        if($(this).css('background-color') == 'rgb(197, 216, 241)'){
            $(this).css({'background-color':'white'});
        } else{
            $(this).css({'background-color':'#c5d8f1ff'});
        }
    });
</script>

</html>