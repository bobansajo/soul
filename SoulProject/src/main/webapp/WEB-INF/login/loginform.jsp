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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<style type="text/css">
#lform{
width: 50%;
margin: 0 auto;
padding-top: 3%;
}
#gaip{
width: 50%;
margin: 0 auto;
padding-top: 3%;
"text-decoration: none;

}
a{
"text-decoration: none; }

</style>
</head>
<body>

<div id="lform" style="border: 1px solid gray; width: 400px; height: 400px;" align="center" >
<form action="loginprocess" method="post">
	
	
	 <img alt="" src="../image/soullogo.png" style="width: 100px;  margin-bottom: 50px; margin-top: 20px;"> 
	
	<input type="text" name="id" class="form-control" placeholder="아이디"
	required="required" autofocus="autofocus" style="width: 300px; margin-bottom: 5px;"
				value="${sessionScope.saveok==null?'':sessionScope.myid }">


<input type="password" name="pass" class="form-control" placeholder="비밀번호"
	required="required"  style="width: 300px;  margin-bottom: 15px;">

			<input type="checkbox" name="cbsave"   
			${sessionScope.saveok==null?"":"checked" }><b style="font-size: 15px; margin-right: 200px;">아이디저장</b>
			<br>
<button type="submit" class="btn btn-info" style="width: 300px; margin-bottom: 50px;">로그인</button>

</form>
 

 <a href="#" style="  color: black; text-decoration: none; "><b style="font-size: 15px; margin-bottom: 10px;">비밀번호를 잃어버리셨나요?</b></a>
 

</div>

<div id="gaip" style="border: 1px solid gray; width: 400px; height: 65px;" align="center" >
<b style="color: black">계정이없으신가요?</b> 
&nbsp;
<a href="form" style="text-decoration: none;"><b style="color: blue;" >가입하기</b></a>

</div>
</body>
</html>