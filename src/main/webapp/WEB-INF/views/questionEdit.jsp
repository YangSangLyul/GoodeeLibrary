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
         <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        
    </head>
    <style>

    #qdBackground{
       /*  background-color: wheat; */
             width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 26%;
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
    .b1{
       position: absolute;
       top: 98%;
       left: 34%;
   }
   .b2{
    position: absolute;
    top: 120%;
       left: 38%; 
   }
    #home{
                font-size: 50;
                color: blue;
            }

            #topMenu{
                height: 30px;
                margin-left: 20%;
                margin-top: -10px;
            }

            #topMenu ul{
                /* 메인 메뉴 안의 ul을 설정 : 상위메뉴+하위메뉴*/
                list-style-type: none;
                margin: 0px;
                padding: 0px;
            }

            #topMenu ul button{
                /*메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴)*/
                color: gray;
                background-color: white;
                float: left;
                line-height: 30px;
                vertical-align: middle;
                text-align: center;
                position: relative;
                margin-left: 30px;
                border: 1px solid gray;
                border-radius: 5px;
                width: 200px;
            }

            .topMenuNotice{
                position: absolute;
                margin-left: 1500px;
                margin-top: -60px;
            }

            .topMenuNotice button{
                border: 0;
                outline: 0;
            }

            #adminMenu{
                display: none;
            }

            #adminService{
                display: none;
            }

            #loginOffBox{
                
                float: right;
                margin-top: -80px;
            }
            #loginOnBox{
                float: right;
                margin-top: -80px;
            }
            #loginOffBox a:link { 
                color: blue; 
                text-decoration: none;
            }
            #loginOffBox a:visited {
                color: blue; 
                text-decoration: none;
            }
            #loginOffBox a:hover {
                color: blue;
            }
            
            #loginOnBox a:link { 
                color: blue; 
                text-decoration: none;
            }
            #loginOnBox a:visited {
                color: blue; 
                text-decoration: none;
            }
            #loginOnBox a:hover {
                color: blue;
            }
            
            #home a:link { 
                color: blue; 
                text-decoration: none;
            }
            #home a:visited {
                color: blue; 
                text-decoration: none;
            }
            #home a:hover {
                color: blue;
            }
            i{
            font-size: 50px;
            }
            
              #titleMenu {
            border: 1px solid black;
            background-color: blue;
            width: 200px;
            height: 50px;
            text-align: center;
            padding-top: 20px;
        }

        .menu{
            border: 1px solid black;
            background-color: white;
            width: 200px;
            height: 40px;
            text-align: center;
            padding-bottom: 20px;
        } 
         a{
            color:white
        }
        a:link,a:visited{
            color: black;
            text-decoration: none;
        } 
          #sid{
         position: absolute;
         top: 17%;
         left: 11%;
        }
        button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
</style>
<body>
<jsp:include page="header.jsp"/>
<div id="sid">
<jsp:include page="bookuseSidebar.jsp"/>
</div>

    <div id="qdBackground">
        <form action="/questionDetail/questionEditing">
            <table>
                <tr>
                    <td>${map.subject}
                        제목
                        <input type="hidden" value="${map.QUEIDX}" name="queidx">
                        <input type="text"  name="subject" id="s"  value="" style="border: 1px solid gray" autofocus>
                        <script type="text/javascript">
                        	$("#s").val("${map.SUBJECT}");
                        </script>
                    </td>
                    <td>
                        문의유형<br>
                        <select name="type" id="selbox">
                          <option value="Q001" <c:if test="${map.TYPE =='Q001'}">selected</c:if>>열람실</option>
                          <option value="Q002" <c:if test="${map.TYPE =='Q002'}">selected</c:if>>도서</option>
                          <option value="Q003" <c:if test="${map.TYPE =='Q003'}">selected</c:if>>서비스</option>
                          <option value="Q004" <c:if test="${map.TYPE =='Q004'}">selected</c:if>>기타</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>작성자<br>
                        <p>${map.ID}</p>
                    </td>
                    <td>날짜<br>
                        <p>${map.REG_DATE}</p>
                    </td>
                </tr>
                <tr> 
                    <td colspan="2">문의내용
                        <div id="editable" contenteditable="true" class="gw4" style="width:650px;height:180px; background-color: white; border: 1px solid black;overflow: scroll ">${map.CONTENT}</div>
						<input id="content" type="hidden" name="content" value=""/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><br>
                        <input type="button" value="사진업로드"  onclick="fileUp()"> <br>
                        <br>
                	<input type="radio" name="false" value="FALSE" id="tfC">질문 비공개 &nbsp;&nbsp;
            		<input type="radio" name="false" value="TRUE" checked id="tfCK">질문 공개
                    </td>
                </tr>    
            </table>
            <input id="save" type="button" value="작성완료" style="position: absolute;top:120%;left: 55%;" />
            <input class="b2" type="button" value="취소" onclick="location.href='../../questionDetail/${map.QUEIDX}'"/>    
        </form>
           
        </div>
    </body>
    
    <script>
    $("#libraryInfo").css('background-color','#337ab7').css("color","white");

    $(".menu:eq(3)").css("background-color","#337ab7");

    $(".menu").hover(function () {
        $(this).css("backgroundColor", "red");
    }, function () {
    	 $(".menu:eq(3)").css("background-color","#337ab7");
        $(".menu:eq(0)").css("backgroundColor", "white");
        $(".menu:eq(1)").css("backgroundColor", "white");
        $(".menu:eq(2)").css("backgroundColor", "white");
    })

$("#save").click(function(){
	//editable 에 있는 내용을 content의 value 넣기
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




$("#librarySearch").click(function(){
	location.href = '../../booksSearch';
});

function menuCall(){
	var loginId = "${sessionScope.loginId}";
	
	console.log('현재 로그인한 사람 ',loginId);
	
	if(loginId == 'admin'){
		$("#libraryMy").css("display","none");
		$("#adminService").css("display","inline");
		
		$("#adminService").click(function(){
			location.href = 'adminService';
		});
	}
}

menuCall();
</script>
    </html>