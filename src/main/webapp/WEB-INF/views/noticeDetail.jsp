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
    <style>
        #noticeBackground{
            background-color: blanchedalmond;
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
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>
    <div id="noticeBackground">
        <span id="noticeSubject">${dto.subject}</span><span id="noticeReg_date">${dto.reg_date}</span>
        <div id="noticeContent">
            ${dto.content}
        <span id="noticeButton">
            <button onclick="location.href='/main/noticea'">목록</button>
        </span>
    </div>
    </div>
</body>
</html>