<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>블라인드 처리 사유</title>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <style>
            body{
                /* width: 700px;
                margin-left: 160px;
    			margin-top: 15px; */	
    			width: 700px;
			    margin-left: 800px;
			    margin-top: 400px;
            }
          button,input[type="button"],input[type="submit"]{
            		color: #0070c0;
	    			background-color: #e8ecf4;
	    			border: 1px solid lightgray;
            }
        </style>
    </head>
    <body>
    	<h3>블라인드 처리 사유</h3>
    	<form action="blindReasonTxt" method="post">
    		<input type="hidden" name="reportIdx" value="${info.reportIdx}"/>
    		<input type="hidden" name="reviewIdx" value="${info.reviewIdx}"/>
	    	<input type="text" name="WhyBlind"/>
	    	<!-- <input type="button" onclick="sub()" value="전송"> -->
	    	<input type="submit" value="전송">
    	</form>
    </body>
    <script>
    	/* function sub(){
    		if(document.getElementsByTagName("form")[0].submit()){
	    		self.close();
    		}
    	} */
    </script>
</html>