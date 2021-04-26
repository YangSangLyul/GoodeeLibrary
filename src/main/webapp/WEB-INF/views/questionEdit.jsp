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
    </head>
    <style>

    #qdBackground{
        background-color: wheat;
             width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
    }
    table{
    background-color: white;
        position: absolute;
        left: 15%;
        top: 5%;
        
    }
   td{
       border: 1px solid gray;
       width: 300px;
       height: 100px;
       vertical-align: top;
   }
  
   input[type="text"]{
       border: 0px solid;
       position: absolute;
       left: 1%;
       top: 10%;
       width: 160px;
       height: 30px;
   }
   input[type="button"]{
       margin-top: 10px;
       margin-left: 5px;
   }
   select{
       margin-top: 10px;
       margin-left: 5px;
       width: 100px;
       height: 50px;
   }
   textarea{
    border: 0px solid;
       resize: none;
       width: 540px;
       height: 90px;
   }
    #b1{
       position: absolute;
       top: 98%;
       left: 34%;
   }
   #b2{
    position: absolute;
    top: 98%;
       left: 55%; 
   }
</style>
<body>
    <div id="qdBackground">
        <form action="">
            <table>
                <tr>
                    <td>
                        제목
                        <input type="text" value="제목수정해주세욥">
                    </td>
                    <td>
                        문의유형<br>
                        <select name="" id="selbox">
                            <option value="">도서</option>
                            <option value="">열람실</option>
                            <option value="">서비스</option>
                            <option value="">기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>작성자<br>
                        <p>도고정입니다</p>
                    </td>
                    <td>날짜<br>
                        <p>도고정입니다</p>
                    </td>
                </tr>
                <tr> 
                    <td colspan="2">문의내용
                        <textarea name="" id="" cols="30" rows="10"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br>
                        <input type="button" value="사진업로드">
                    </td>
                </tr>
            </table>
        </form>
            <button id="b1">저장</button>
            <button id="b2">취소</button>
        </div>
    </body>
    </html>