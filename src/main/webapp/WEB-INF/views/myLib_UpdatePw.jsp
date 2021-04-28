<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <meta charset="UTF-8">
      <title>회원정보수정 - 비밀번호 변경</title>
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

      #find_btn{
        margin-top: 20px;
      }

      input[type="password"] {
        width: 110%;
        height: 30px;
        padding: 5px;
        margin: 10px;
      }

      button {
        width: 100px;
        height: 40px;
        margin: 20px 5px;
        font-size: 15px;
        background-color: #94a7be;
        color: white;
        border: none;
        border-radius: 5px;
      }
      </style>
   </head>
   <body>
        <div id="main">
      <div class="subject"><h3>비밀번호 변경</h3></div>
      <form action="myLib_UpdatePw" method="POST">
        <table id="findFields">
          <tr>
            <td id="title">새 비밀번호</td>
            <td>
              <input
                type="password"
                name="name"
                value=""
                placeholder="새로운 비밀번호를 입력해주세요."
              />
            </td>
          </tr>
          <tr>
            <td id="title">비밀번호 확인</td>
            <td>
              <input
                type="password"
                name="name"
                value=""
                placeholder="비밀번호를 다시 입력해주세요."
              />
            </td>
          </tr>
        </form>
        </table>
        <br/>
        <span></span>
      <button class="find_button" onclick="pwcheck()">변경</button>
      <button class="find_button" onclick="location.href='myUpdate.html'">취소</button>
        </div>
    </div>
   </body>
   <script>
   </script>
</html>