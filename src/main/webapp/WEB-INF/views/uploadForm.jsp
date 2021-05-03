<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style></style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>

<body>
<!-- 파일 업로드는 enctype 꼭 있어야함 -->
	<form action="file_upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="fileView(this)"/>
	</form>
</body>
<script>contenteditable="true"
var path="${path}";
console.log(path);

if(path!=""){
	var elem = opener.document.getElementById("editable");
	var content="";
	content +="<br>";
	content +="<a href='#' id='${path}' onclick='del(this)'>";
	content +="<img src='${path}' width='80'/><b>X</b></a>";
	elem.innerHTML += content;
	self.close();
}
	function fileView(elem){
		console.log(elem);
		$('form').submit();
	}
</script>
</html>