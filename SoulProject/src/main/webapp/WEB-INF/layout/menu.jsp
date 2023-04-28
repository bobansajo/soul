<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
nav{
   height:60%;
}
.nav_header {
   width: 240px;
   overflow: hidden;
   padding: 20px;
   box-sizing: border-box;
}
.nav_header>ul>li {
   width: 240px;
   overflow: hidden;
}
.nav_header>ul>li:hover .mainMenu {
   background-color: #fafafc;
   text-decoration: none;
   color: #000;
}
.mainMenu {
   display: block;
   float: left; width : 100%;
   height: 40px;
   color: #000;
   line-height: 40px;
   font-size: 18px;
   font-weight: bold;
   border-bottom: 1px solid #fff;
   position: relative;
   width: 100%;
}
.logo {
   float: left;
   padding: 30px;
}
.more {
width: 100%;
   float: left;
   padding: 30px;
}
.morebtn{
   display: block;
   float: left; width : 100%;
   height: 40px;
   color: #000;
   line-height: 40px;
   font-size: 18px;
   font-weight: bold;
   border-bottom: 1px solid #fff;
   position: relative;
   width: 80%;
}
.morebtn:hover{
   width:100%;
   background-color: #fafafc;
   text-decoration: none;
   color: #000;
}



</style>
</head>
<body>


</style>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
>>>>>>> e3c2ef041f7ed7d7b33e1bd1688ef07e1d7778f9

<div class="logo">
 <img alt="logo" src="/image/soullogo.png" style="width:120px;">
 </div>
<nav class="nav_header">
    <ul>
        <li>
            <a href="#" class="mainMenu"><span class="glyphicon glyphicon-home" style="padding:10px;"></span>홈</a>

        </li>
        <li>
            <a href="#" class="mainMenu"><span class="glyphicon glyphicon-search" style="padding:10px;"></span>검색</a>
        </li>
        <li>
            <a href="#" class="mainMenu"><span class="glyphicon glyphicon-bell" style="padding:10px;"></span>알림</a>
        </li>
        <li>
            <a href="#" class="mainMenu"><span class="glyphicon glyphicon-user" style="padding:10px;"></span>프로필</a>
        </li>

        <li>
            <a href="#" class="mainMenu" data-toggle="modal" data-target="#myModal" ><span class="glyphicon glyphicon-plus-sign"  style="padding:10px;"></span>만들기</a>
        </li>

        		<li><a href="/user/form" class="mainMenu">회원가입</a></li>


    </ul>
</nav>

<div class="more">
 <a href="#" class="morebtn"><span class="glyphicon glyphicon-menu-hamburger" style="padding:10px;"></span>더보기</a>
</div>

</body>
</html>