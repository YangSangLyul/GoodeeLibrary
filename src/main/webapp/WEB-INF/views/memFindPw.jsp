<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>비밀번호 찾기</title>
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

      input[type="text"]{
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
       background-color: #c5d8f1;
       color: #0070c0;
       border: none;
       border-radius: 5px;
     }
    </style>
  </head>
  <body>
    <div class="main">
      <h3>비밀번호 찾기</h3>
      <hr />
      <div id="find_img">
        <img src="./image/lock.png">
      </div>
      <form action="join" method="POST">
        <table id="findFields">
          <tr>
            <td id="title">아이디</td>
            <td>
              <input
                type="text"
                name="name"
                value=""
                placeholder="이름을 입력해주세요."
              />
            </td>
          </tr>
          <tr>
            <td id="title">이름</td>
            <td>
              <input
                type="text"
                name="name"
                value=""
                placeholder="이름을 입력해주세요."
              />
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              <input
                type="text"
                name="phone"
                value=""
                placeholder="휴대폰번호를 입력해주세요."
              />
            </td>
          </tr>
        </table>
      </form>
              <button class="find_button" onclick="location.href='memNewPw'">확인</button>
        </div>
    </div>
</body>
</html>