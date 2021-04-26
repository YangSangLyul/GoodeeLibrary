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
    <style>
        #map{
            width:800px;
            height:500px;
            background-color:black;
            position: absolute;
            top: 30%;
            left: 28%;
        }
        #mapSearch{
            width:350px;
            height:60px;
            /* background-color:red; */
            position: absolute;
            top:23%;
            left: 41%;
            text-align:center;
        }
    </style>
</head>
<body>
    <div id="mapSearch">
        <form action="mapSearch">
            출발지 : <input type="text" name="search" placeholder="검색해주세요">
            <input type="submit" value="검색">
        </form>
    </div>
    <div id="map">ss</div>
</body>
</html>