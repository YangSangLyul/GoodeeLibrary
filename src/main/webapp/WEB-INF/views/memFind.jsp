<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>계정찾기</title>
    <style>
      .main {
        width: 400px;
        height: 300px;
        margin: 200px auto;
      }
      h3 {
        text-align: center;
        color: #0070c0;
      }

      img{
        width: 160px;
        margin: 24px;
      }

      div{
        text-align: center;
      }

      .what{
        margin: 6px;
        font-size: 20px;
        color: gray;
      }

      #find_btn{
        margin-top: 20px;
      }
      button {
        width: 30%;
        height: 40px;
        margin: 20px 5px;
        font-size: 15px;
        background-color: #c5d8f1;
        color: #0070c0;
        border: none;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <div class="main">
      <h3>계정 찾기</h3>
      <hr />
      <div id="find_img">
        <img src="./image/lock.png">
      </div>
      <div id="find_content">
        <span class="what">로그인에 문제가 있나요??</span>
        <br/>
        <span class="what">당신이 찾고자 하는 것을 눌러주세요.</span>
      </div>
        <div id="find_btn">
          <button class="find_button" onclick="location.href='findId.html'">아이디 찾기</button>
          <button class="find_button" onclick="location.href='findPw.html'">비밀번호 찾기</button>
        </div>
    </div>
  </body>
</html>