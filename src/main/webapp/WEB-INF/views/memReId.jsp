<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <title>아이디 찾기 완료</title>
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
        background-color: #94a7be;
        color: white;
        border: none;
        border-radius: 5px;
      }
    </style>
  </head>
  <body>
    <div class="main">
      <h3>아이디 찾기완료</h3>
      <hr />
      <div id="find_img">
        <img src="./image/lock.png">
      </div>
      <div id="find_content">
        <span class="what">님의 아이디는</span>
        <br/>
        <span class="what">입니다.</span>
      </div>
        <div id="find_btn">
          <button class="find_button" onclick="location.href='memLogin'">로그인</button>
          <button class="find_button" onclick="location.href='memfindPw'">비밀번호 찾기</button>
        </div>
    </div>
</body>
</html>