<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>이 달의 리뷰왕</title>
        <!-- favicon:사이트를 대표하는 탭창에 보여지는 이미지 -->
        <link rel="icon" href="icon.jpg">
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
            table{
                width: 650px;
                height: 100px;
                margin: auto;
                text-align: center;
            }
            table,td,th{                
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            } 
            button{
                padding: 10px;
                padding-inline: 35px;
                margin: 20px;
            }
            h4{
                text-align: left;
            }
            #decision{
                margin-top: 10px;
    			margin-left: 510px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    </head>
    <body>
        <!-- 상단 네비게이션 자리 -->
        <hr/>
        <div id="tabMenu">
            <button>이달의 리뷰왕</button>
            <button>신고 리스트</button>
            <button>블라인드 리스트</button>
        </div>
        <br/>
        <!-- <form action="selectKing" method="POST"> -->
	        <table>
	            <tr>
	                <th>번호</th>
	                <th>아이디</th>
	                <th>추천수</th>
	                <th>선정</th>
	            </tr>
	            <c:forEach items="${king.manyUp}" var="list">
		            <tr>
		                <td>${list.rnum}</td>
		                <td><a href="[리뷰모아보기]?id=${list.id}">${list.id}</a></td>
		                <td>${list.cnt}</td>
		                <td><input type="checkbox" onclick="count_ck(this)" name="chk"/></td>
		            </tr>
	            </c:forEach>
	        </table>
	        <br/>
	        <table>
	            <tr>
	                <th>번호</th>
	                <th>아이디</th>
	                <th>리뷰수</th>
	                <th>선정</th>
	            </tr>
	            <c:forEach items="${king.manyReview}" var="list2">
		            <tr>
		                <td>${list2.rnum}</td>
		                <td><a href="[리뷰모아보기]?id=${list2.id}" id="userId">${list2.id}</a></td>
		                <td>${list2.cnt}</td>
		                <td><input type="checkbox" onclick="count_ck(this)" name="chk"/></td>
		            </tr>
	            </c:forEach>
	        </table>
	        <input type="button" value="리뷰왕 선정" id="decision"/>
       <!--  </form> -->
    </body>
    <script>
    	//alert
	    var msg = "${msg}";
		if(msg != ""){
			alert(msg);
		}
		
		//리뷰왕 3명초과 제한
   		var chkbox = document.getElementsByName("chk");
    	function count_ck(obj){
    		var chkCnt = 0;
    		for(var i=0;i<chkbox.length; i++){
    			if(chkbox[i].checked){
    				chkCnt++;
    			}
    		}
    		console.log(chkCnt);
    		if(chkCnt>3){
    			alert("3명까지만 선택 할 수 있습니다.");
    			obj.checked = false;
    			return false;
    		}
    	}
    	
    	//리뷰왕선정
    	$("#decision").click(function() {
    		var chkCnt = 0;
    		var id = $('#userId').val();
    		for(var i=0;i<chkbox.length; i++){
    			if(chkbox[i].checked){
    				chkCnt++;
    			}
    		}
    		//리뷰왕 3명 미만 제한
    		if(chkCnt < 3){
    			alert("이 달의 리뷰왕 3명을 선택 해주세요.");
    			return false;
    		}else{    			
    			var ckData = new Array();
    			//var tdArr = new Array();
    			var ckBox = $("input[name=chk]:checked");
    			
    			//체크 된 체크박스의 값 가져오기
    			ckBox.each(function(i){
    				
    				//ckBox.parent() : ckBox의 부모는 <td>
    				//ckBox.parent().parent() : <td>의 부모이므로 <tr>
    				var tr = ckBox.parent().parent().eq(i);
    				var td = tr.children();
    				
    				//체크된 row의 모든 값 배열에 담기
    				ckData.push(tr.text());
    				
    				//var num = td.eq(0).text();
    				var userId = td.eq(1).text();
    				var cnt = td.eq(2).text();
    				
    				//tdArr.push(userId,cnt);
    				//tdArr.push(userId);
    				//tdArr.push(cnt);    	
    				
    			console.log("userId: "+userId);
    			console.log("cnt: "+cnt);
    			
    			location.href = 'selectKing?id='+userId+'&cnt='+cnt;   
    			});
    		}
    	});
    </script>
</html>