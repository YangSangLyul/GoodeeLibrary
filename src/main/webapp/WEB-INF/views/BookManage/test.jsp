<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style></style>
	</head>
	<body>
		<button onclick="location.href='reserveBook?bookIdx=3'">예약하기</button>
		<button onclick="location.href='reserveBookCancel?reserveBookIdx=5'">예약 취소하기</button>
		<button onclick="location.href='rentalBook?reserveBookIdx=4'">대여하기</button>
		<button onclick="location.href='returnBook?reserveBookIdx=4'">반납하기</button>
	</body>
	<script></script>
</html>