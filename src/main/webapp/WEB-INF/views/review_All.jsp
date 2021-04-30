<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <style>
                #main {
        width: 400px;
        height: 300px;
        margin: 200px auto;
      }

      .subject{
        border: 1px solid ;
        width: 300px;
        margin: auto;
      }
      
      h3{
        margin: 5px;
      }

      div{
        text-align: center;
      }

      .option{
        float: right;
      }

      .option li{
        border: 1px solid lightgray;
        width: 100px;
        padding: 8px;
        list-style: none;
      }

      .option li:hover{
        background-color: lightgreen;
      }

      .option a{
        text-decoration: none;
        color: black;
      }

      .review_content{
        width: 600px;
        height: 500px;
        border: 1px solid;
      }

      table tr td{
        border: 1px solid;
      }
      </style>
   </head>
   <body>
         <div id="main">
        <div class="subject"><h3>리뷰 모아보기</h3></div>
        <div class="option">
          <ul>
            <li><a href="#">유형</a></li>
            <li><a href="#">최신순</a></li>
            <li><a href="#">추천순</a></li>
          </ul>
        </div>
        <div class="review_content">
        <table>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </table>  
        </div>
    </div>
   </body>
   <script>
   </script>
</html>