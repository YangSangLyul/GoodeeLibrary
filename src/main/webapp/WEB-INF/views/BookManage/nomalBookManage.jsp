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
            top: 25%;
            left: 25%;
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
            <form>
                <span><input type="checkbox" name="R001" value="예약중"/>예약중</span>
                <span><input type="checkbox" name="B001" value="예약가능"/>예약가능</span>
                <span><input type="checkbox" name="B002" value="예약불가"/>예약불가</span>
                <span><input type="checkbox" name="B007" value="숨김"/>숨김</span>
                <input type="submit" value="검색"/>
            </form>
        </div>
        <button>도서 등록</button>

        <div>
            <table>
                <tr>
                    <td rowspan="5">
                        이미지 넣을 위치
                    </td>
                </tr>
                <tr>
                    <th>책 제목</th>
                    <td>
                        <select name="bookState">
                            <option value="">예약가능일 때만 상태 변경 가능</option>
                            <option value="">숨김</option>
                            <option value="">예약중인 도서에만 예약 승인 가능</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">저자명</td>
                </tr>
                <tr>
                    <td colspan="2">출판사</td>
                </tr>
                <tr>
                    <td colspan="2">등록번호</td>
                </tr>
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