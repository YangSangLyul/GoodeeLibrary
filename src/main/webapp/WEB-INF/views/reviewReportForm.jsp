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
		width: 350px;
		height: 330px;
		padding: 3px 10px;
	}
	.report_subject{
		margin: 20px 0 10px 0;
	}
	#reportReason{
		width: 100%;
		height: 40%;
	}
	.report_btn{
		width: 50%;
		text-align: center;
		margin: 20px 0;
		float: right;	
	}
	#report_cl, #report_ok{
		padding: 6px;
		margin: 0 1px;
		border-radius: 3px;
		border: 1px solid lightgray;
		color: white;
	}
      </style>
   </head>
   <body>
	<div id="report_Form">
		<h3>신고하기</h3>
		<hr/>
				<div class="report_table">		
						<input type="hidden" id="reviewIdx" name="reviewIdx" value="${dto.reviewIdx}" /> 
						<input type="hidden" id="reportId" name="reportId" value="${dto.id}" />
						<input type="hidden" id="id" name="id" value="${sessionScope.loginId}" />
				</div>
				<div class="report_table">		
						<div class="report_subject">신고 사유 </div>
						<input type="text" id="reportReason" name="reportReason" placeholder="신고 사유를 입력해 주세요."/>
				</div>
			<div class="report_btn">
				<button id="report_cl" style="background-color:gray; width: 55px;" onclick="window.close()">취소</button>
				<button id="report_ok" style="background-color:rgb(248, 71, 71)">신고하기</button>
			</div>
	</div>
   </body>
   <script>
   var msg = "${msg}";
   if(msg!=""){
   	alert(msg);
   }
   
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
			,dataType:'JSON'
			,success:function(data){
				console.log(data);
				if(data.success == '1'){
					alert('해당 리뷰가 신고되었습니다.');
					window.close();
				}else{
					alert('이미 신고된 리뷰이거나 신고할 수 없는 리뷰입니다.');
					window.close();
				}	
			}
		});
		}
	});
   </script>
</html>