<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	#sideBar{
       		position: absolute;
        	margin-left: 10%;
        	margin-top: 3%;
        }
    #my_title{
    	
	    text-align: center;
	    background-color: white;
	    width: 200px;
	    height: 30px;
	    margin-left: 40%;
	    margin-bottom: 1%;
	    border: 1px solid black;
	}
	#body{
		position: absolute;
		text-align: center;
	    background-color: beige;
	    margin-left: 25%;
	    width: 1000px;
	    height: 900px;
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
   .btn{
   		margin-top:60%;
   		width:70px;
   }
   	button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div id="my_title">${loginId}의 문의 내역</div>
    <div id="body">
        <form action="question_edit" method="POST">
            <table>
            	<input type="hidden" name="idx" value="${question_info.queidx}"/>
            	<input type="hidden" name="answer" value="${question_info.ansstatus}"/>
                <tr>
                    <td>
                        제목
                        <input type="text" name="subject" value="${question_info.subject}">
                    </td>
                    <td>
                        문의유형<br>
                        <select name="Qtype" id="selbox">
                            <option value="Q001"<c:if test="${question_info.type =='Q001'}">selected</c:if>>열람실</option>
                            <option value="Q002"<c:if test="${question_info.type =='Q002'}">selected</c:if>>도서</option>
                            <option value="Q003"<c:if test="${question_info.type =='Q003'}">selected</c:if>>서비스</option>
                            <option value="Q004"<c:if test="${question_info.type =='Q004'}">selected</c:if>>기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>작성자<br>
                        <p>${question_info.id}</p>
                    </td>
                    <td>날짜<br>
                        <p>${question_info.reg_date}</p>
                    </td>
                </tr>
                <tr> 
                    <td colspan="2">문의내용
                        <div id="editable" contenteditable="true" class="gw4" style="width:650px;height:180px; background-color: white; border: 1px solid black;overflow: scroll ">${question_info.content}</div>
						<input id="content" type="hidden" name="content" value=""/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br>
                        <input type="button" value="사진업로드" onclick="fileUp()">
                    </td>
                </tr>
            </table>
            <input id="save" class="btn" type="button" value="저장"/>
	        <input id="cancel" class="btn" type="button" value="취소" onclick="location.href='./myLib_question_detail?idx=${question_info.queidx}&&ansstatus=FALSE'"/>
        </form>
        <!-- <button id="b2" onclick="location.href='./question_detail?idx='">취소</button> -->
    </div>
</body>
<script>

$("#libraryMy").css('background-color','#337ab7').css("color","white");

$(".menu:eq(4)").css("background-color","#337ab7");

$(".menu").hover(function () {
    $(this).css("backgroundColor", "red");
}, function () {
	 $(".menu:eq(4)").css("background-color","#337ab7");
    $(".menu:eq(1)").css("backgroundColor", "white");
    $(".menu:eq(0)").css("backgroundColor", "white");
    $(".menu:eq(2)").css("backgroundColor", "white");
    $(".menu:eq(3)").css("backgroundColor", "white");
    $(".menu:eq(5)").css("backgroundColor", "white");
})

$("#save").click(function(){
	$("#editable a").find("b").remove();
	$("#editable a").removeAttr('onclick');
	$('#content').val($('#editable').html());
	$('form').submit();
});

$(document).ready(function(){
	console.log("b붙이기")
	$("#editable").find("a").append("<b>X</b>");
	$("#editable a").attr("onclick","del(this)");
})
function fileUp(){
	window.open('/uploadForm','file_upload','width=400,height=100,top=280');
}

function del(elem){
	console.log(elem);
	var newFileName = elem.id.substring(elem.id.lastIndexOf("/")+1);
	console.log(newFileName);
	
	//1.실제 파일 삭제 요청	
	$.ajax({
		url:'/fileDelete',
		type:'get',
		data:{"fileName":newFileName},
		dataType:'json',
		success:function(d){
			console.log(d);
			if(d.success == 1){
				//2. 파일 삭제 요청이 완료 되면 화면에 나타난 사진 삭제				
				$(elem).remove();//이미지와 X버튼 삭제
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
}
</script>
</html>