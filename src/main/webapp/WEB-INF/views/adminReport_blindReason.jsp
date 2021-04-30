<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>블라인드 처리 사유</title>
        <style>
            body{
                width: 700px;
                margin: 20px 550px;
                text-align: center;
            }
        </style>
    </head>
    <body>
    	<h3>블라인드 처리 사유</h3>
    	<form action="blindReasonTxt" method="post">
    		<input type="hidden" name="reportIdx" value="${info.reportIdx}"/>
    		<input type="hidden" name="reviewIdx" value="${info.reviewIdx}"/>
	    	<input type="text" name="WhyBlind"/>
	    	<input type="submit" value="전송">
    	</form>
    </body>
    <script>
    
    </script>
</html>