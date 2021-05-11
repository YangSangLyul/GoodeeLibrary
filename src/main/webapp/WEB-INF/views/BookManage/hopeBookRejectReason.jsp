<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<title>도서 거부</title>
		<style>
			#reject{
				width: 200px;
				height: 100px;
			}
			button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
		</style>
	</head>
	<body>
		<form action="/main/hopeBookRejectReason" method="GET">
				<input type="hidden" name="hopeBooksNumber" value="${hopeBooksNumber}"/>
			<div>
				<h4>희망도서 신청 거부 사유</h4>
				<textarea id="reject" name="reject" style="resize: none;"></textarea>
		        <input type="button" id="save" value="확인"/>
			</div>
		</form>
	</body>
	<script>
		$("#save").click(function(){
			//$("form").submit();
			var reject = $("#reject").val();
			var hopeBooksNumber = ${hopeBooksNumber};
			
			params = {};
			params.reject = reject;
			params.hopeBooksNumber = hopeBooksNumber;
			
			$.ajax({
				url : "hopeBookRejectReason",
				type : 'POST',
				data : params,
				dataType : 'JSON',
				success : function(data) {
					console.log(data);
					if(data.success > 0) {
						alert('희망도서 거부에 성공 했습니다.');
						self.close();
					}
				},
				error : function(error) {
					console.log(error);
				}
			});
		});
	</script>
</html>