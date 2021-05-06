<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String loginId = (String) request.getSession().getAttribute("loginId");
%>
<html>
   <head>
      <meta charset="UTF-8">
      <title>신고하기</title>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
      <style>
				#report_Form{
					width: 300px;
					height: 300px;
					border : 1px solid black;
					padding: 3px 24px;
				}

				.report_btn{
					border : 1px solid black;
					width: 50%;
					text-align: center;
					margin: auto;
					
				}

update

      </style>
   </head>
   <body>
	<div id="report_Form">
		<h3>신고하기</h3>
				<div class="report_table">		
						<input type="hidden" id="reviewIdx" name="reviewIdx" value="${dto.reviewIdx}" /> 
						<input type="hidden" id="reportId" name="reportId" value="${dto.id}" />
						<input type="hidden" id="id" name="id" value="${sessionScope.loginId}" />
				</div>
				<div class="report_table">		
						<label>신고 사유 </label>
						<input type="text" id="reportReason" name="reportReason" value=""/>
				</div>
			<div class="report_btn">
				<button id="report_cl" onclick="window.close()">취소</button>
				<button id="report_ok">신고하기</button>
			</div>
	</div>
   </body>
   <script>
   var msg = "${msg}";
   if(msg!=""){
   	alert(msg);
   }
   
/*    $("#report_ok").click(function() {
		if($('#reportReason').val() == '') {
			alert('신고 사유를 입력해주세요.');
		}else{
 		$.ajax({
			type:'POST'
			,url:'reviewReport'
			,data: 
			{"reportReason":$("#reportReason").val()
			,"reportId":$("#reportId").val()
			,"reviewIdx":$("#reviewIdx").val()
			}
			,dataType:'text'
			,success:function(data){
				
			}
		});
 		window.close();
		}
	}); */
   
   $("#report_ok").click(function() {
		if($('#reportReason').val() == '') {
			alert('신고 사유를 입력해주세요.');
		}else{
		$.ajax({
			type:'POST'
			,url:'reviewReport'
			,data: 
			{"reportReason":$("#reportReason").val()
			,"reportId":$("#reportId").val()
			,"reviewIdx":$("#reviewIdx").val()
			}
			,dataType:'text'
			,success:function(data){
				console.log(data);
				if(data.success){
					alert('해당 리뷰가 신고되었습니다.');
					window.close();
				}else{
					alert('이미 신고한 리뷰이거나 신고할수 없는 리뷰ㄴ입니다.');
				}
				
				
			}
		});
		}
	});
   
 
/*    $(document).ready(function() {
		$("#report_ok").click(function() {
			alert('해당 리뷰를 신고합니다.');
			document.form.action = "reviewReport";
			document.form.submit();
			window.open("about:blank","_self").close();
			
		});
   }); */
   </script>
</html>