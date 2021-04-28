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
             background-color: wheat;
             width: 900px;
            height: 500px;
            position: absolute;
            left: 28%;
            top: 35%;
         }
        
         table{
             width: 800px;
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
            left: 50%;
            top: 5%;
        }
        select{
            font-size: large;
        }
        input{
            font-size: large;
        }
       
     </style>
</head>

<body>
<jsp:include page="bookuseSidebar.jsp"/>
    <div id="FAQback">
        <div id="search">
            <form action="FAQSearch">
                <select name="searchSelect" id="searchSelect">
                    <option value="전체" selected>전체</option>
                    <option value="제목">제목</option>
                    <option value="내용">내용</option>
                </select>
                <input type="text" name="search" placeholder="검색해주세요">
                <input type="submit" value="검색하기">
            </form>
        </div>
            <table>
                <tr class="clT">
                    <th>번호</th>
                    <th>제목</th>
                </tr>
                <tr class="client">
                    <td>1번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>2번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>3번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>4번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>5번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>6번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>7번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>8번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>9번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
                <tr class="client">
                    <td>10번</td>
                    <td>~~~~~~~~~~~~~~~~~~~~~~~~~</td>
                </tr>
                <tr class="librarian">
                    <td>답변</td>
                    <td>Coral reefs are amongst the most productive areas of the ocean. Each coral contains microscopic algae
                        within its tissue that are able to capture the energy of the Sun and convert it into food. The
                        corals benefit from this, and this helps support a whole community of life. There’s a tight
                        recycling of nutrients through the food web, every species being food for another, all
                        interconnected like a jigsaw puzzle.</td>
                </tr>
            </table>
            
            
            
            <script>
                $(function () {
                    //    $('dl>dt:first').addClass('selected');
                    $('.librarian:not(:first)').hide();
                    
                    $('.client').on('click', function (e) {
                        var displaySrc = $(this).next('.librarian').css('display');
                        if (displaySrc == 'none') {
                            $('.librarian').slideUp(10);
                            $(this).next('.librarian').slideDown(10);
                            $('.client').removeClass('selected');
                            $(this).addClass('selected');
                        }
                    })
                })
                </script>
        
    </div>
</body>

</html>