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
            <button onclick="location.href='ReviewKing'">이달의 리뷰왕</button>
            <button onclick="location.href='ReportList'">신고 리스트</button>
            <button onclick="location.href='BlindList'">블라인드 리스트</button>
        </div>
        <br/>
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
	                <td><a href="reviewIdList?id=${list.id}">${list.id}</a></td>
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
    </body>
    <script>
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
    		$.ajax({ 
				url :'hideBtn', 
				type : 'GET', 
				//async: false,
				dataType : 'JSON', 
				data : {}, 
				success:function(data){
					console.log(data);
					//console.log(data.hide.length);
					 if(data.hide.length==0){
						$.ajax({ 
		    				url :'selectKing', 
		    				type : 'POST', 
		    				//async: false,
		    				dataType : 'text', 
		    				data : { 
		    					'tdArr':tdArr
		   					}, 
		   					success: function(data){ 
		   						console.log(data);
		   						//location.href = 'hideBtn';
		   						alert("이 달의 리뷰왕 선정을 완료했습니다.");
							},
							error: function(e){
								console.log(e);
							}
						});
					}else{
						alert("이미 이달의 리뷰왕을 선정했습니다.");
					}
				},
				error: function(e){
					console.log(e);
				}
			});
    		//체크한 체크박스의 개수 가져오기
    		var chkCnt = 0;
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
    			//var ckData = [];
    			var tdArr = [];
    			var test = {};
    			var ckBox = $("input[name=chk]:checked");
    			
    			//체크 된 체크박스의 값 가져오기
    			ckBox.each(function(i){    				
    				//ckBox.parent() : ckBox의 부모는 <td>
    				var tr = ckBox.parent().parent().eq(i);
    				var td = tr.children();    				
    				//체크된 row의 모든 값 배열에 담기
    				//ckData.push(tr.text());
    				var id = td.eq(1).text();
    				var cnt = td.eq(2).text();    				
	    			console.log("id: "+id);
	    			console.log("cnt: "+cnt);
    				//test.put(id,cnt);
    				tdArr.push({"id":id,"cnt":cnt});
    			});
    			//location.href = 'selectKing?id='+id+'&cnt='+cnt;
    		}
    	});
    </script>
</html>