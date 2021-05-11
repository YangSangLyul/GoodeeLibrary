<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">

<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <meta http-equiv="X-UA-Compatible" content="ie=edge">
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <title>FAQ</title>
     <style>
         #FAQback{
           /*   background-color: wheat; */
             width: 900px;
            height: 500px;
            position: absolute;
            left: 25%;
            top: 27%;
         }
        
         table{
             width: 1024px;
             height: 450px;
             position: absolute;
             top: 13%;
             left: 5%;
         }
       .clT,.client,.librarian{
           background-color: white;
           text-align: center;
       }
       .clT th{
           width: 100px;
           height: 30px;
           text-align: center;
       }
       #search{
            width: 100%;
            height: 100%;
            position: absolute;
            left: 6%;
            top: 3%;
        }
        select{
            font-size: large;
        }
        input{
            font-size: large;
        }
       .librarian{
       		display: none;
       }
       #sid{
       position: absolute;
       top: 17%;
       left: 11%;
       }
       #header{
       margin-top: 25px;
       margin-left: 10px;
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
            height: 38px;
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
        p{
      	
        }
         #header{
        margin-top: 25px;
        margin-right: 10px;
        }
         i{
        font-size: 50px;
        }
       button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
     </style>
</head>

<body>
<div id="header">
<jsp:include page="header.jsp"/>
</div>
<div id="sid">

<jsp:include page="bookuseSidebar.jsp"/>
</div>
    <div id="FAQback">
        <div id="search">
            <form action="FAQSearch">
                <select name="searchSelect" id="searchSelect">
                    <option value="전체" selected>전체</option>
                    <option value="제목">제목</option>
                    <!-- <option value="답변">답변</option> -->
                </select>
                <input type="text" name="search" placeholder="검색해주세요">
                <input type="submit" value="검색하기">
            </form>
        </div>
            <table>
                <tr class="clT">
                    <th style="background-color: #148CFF;width:60px;height: 60px;">번호</th>
                    <th style="background-color: #148CFF;width:60px;height: 60px;">제목</th>
                </tr>
                <c:forEach items="${dto}" var="dto">
                <tr class="client">
                    <td style="background-color: #FFACB7;width:60px;">${dto.faqidx}번</td>
                    <td style="background-color: #FFC6C3;width:200px;'">${dto.content}</td>
                </tr>
                <tr class="librarian">
                    <td style="background-color: #FFF0F5;width:60px;">답변</td>
                    <td style="background-color: #FFF0F5;width:200px;">${dto.anwser}</td>
                </tr>
                </c:forEach>
            </table>
            
            
            
            <script>
            $("#libraryInfo").css('background-color','#337ab7').css("color","white");

            $(".menu:eq(2)").css("background-color","#337ab7");

            $(".menu").hover(function () {
                $(this).css("backgroundColor", "red");
            }, function () {
            	 $(".menu:eq(2)").css("background-color","#337ab7");
                $(".menu:eq(0)").css("backgroundColor", "white");
                $(".menu:eq(1)").css("backgroundColor", "white");
                $(".menu:eq(3)").css("backgroundColor", "white");
            })
            
                $(function () {
                    //    $('dl>dt:first').addClass('selected');
                    $('.librarian:not(:first)').hide();
                    
                    $('.client').on('click', function (e) {
                        var displaySrc = $(this).next('.librarian').css('display');
                        if (displaySrc == 'none') {
                            $('.librarian').slideUp(5);
                            $(this).next('.librarian').slideDown(5);
                            $('.client').removeClass('selected');
                            $(this).addClass('selected');
                        }
                    })
                })
                
                
                
                 var msg = "${msg}";
   				 if(msg!=""){
    						alert(msg);
   				 }
                </script>
        
    </div>
</body>

</html>