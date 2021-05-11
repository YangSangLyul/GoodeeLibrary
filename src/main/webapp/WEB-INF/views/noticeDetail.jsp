<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
        #noticeBackground{
            /* background-color: blanchedalmond; */
            border: 1px solid gray;
            width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
        }
        #noticeSubject{
            margin-top: 20px;
            padding: 10px;
            width: 25%;
            height: 6.5%;
            border: 1px solid gray;
            position: absolute;
            left: 24%;
        }
        #noticeReg_date{
            margin-top: 20px;
            padding: 10px;
            width: 22%;
            height: 6.5%;
            border: 1px solid gray;
            position: absolute;
            left: 52%;
        }
        #noticeContent{
            margin-top: 20px;
            padding-top: 50px;
            width: 52.2%;
            height: 60%;
            border: 1px solid gray;
            position: absolute;
            top: 12%;
            left: 24%;
        }
        #noticeButton{
            padding: 10px; 
            position: absolute;
            top: 88%;
            left: 46%;
        }
         #sid{
         position: absolute;
         top: 17%;
         left: 11%;
        }
               #titleMenu {
            border: 1px solid black;
            background-color: blue;
            width: 200px;
            height: 52px;
            text-align: center;
            padding-top: 20px;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 40px;
            text-align: center;
            padding-bottom: 20px;
        } 
         a{
            color:white
        }
        a:link,a:visited{
            color: black;
            text-decoration: none;
        } 
          #header{
        margin-top: 25px;
        margin-right: 10px;
        }
         i{
        font-size: 50px;
        }
                  button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
    </style>
</head>
<body>
<div id="header">
<jsp:include page="header.jsp"/>
</div>
<div id="sid">
<jsp:include page="bookuseSidebar.jsp"></jsp:include>
<h1 style="position:absolute;top: 20%;left: 610px; width: 500px; ">${dto.reg_date} 일 공지사항 입니다</h1>
</div>
    <div id="noticeBackground">
        <span id="noticeSubject">${dto.subject}</span><span id="noticeReg_date">${dto.reg_date}</span>
        <div id="noticeContent">
            ${dto.content}
        <span id="noticeButton">
            <button onclick="location.href='../../notice'">목록</button>
        </span>
    </div>
    </div>
</body>
<script>
$("#libraryInfo").css('background-color','#337ab7').css("color","white");

$(".menu:eq(1)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(1)").css("background-color","#337ab7");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
})
</script>
</html>