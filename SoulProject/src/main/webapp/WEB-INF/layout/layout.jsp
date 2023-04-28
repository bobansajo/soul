<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
	div.layout {
		font-size: 1.3em;
		font-family: 'Noto Sans KR';
		width: 100%;
		height: 100%;
	}
	
	div.layout div.menu{
		position: fixed;
		width: 200px;
		height: 100%;
	}
	
	div.layout div.main{
		max-width: 50%;
		min-width: 300px;
		margin: 0 auto;
		padding-top: 3%;
	}
</style>

<script type="text/javascript">
	$(function(){
		side_change();
		
		$( window ).resize(function() {
			side_change();
		});
	})
	function side_change(){
		var windowWidth = $( window ).width();
		if(windowWidth < 800) {
			$("div.menu").hide();
		} else {
			$("div.menu").show();
		}
	}
</script>
</head>
<body>
<div class="layout">
	<div class="menu">
		<tiles:insertAttribute name="menu"/>
	</div>
	<div class="main">
		<tiles:insertAttribute name="main"/>
	</div>
</div>
</body>
</html>