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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style type="text/css">
	.storyCotainer{
		max-width: 550px;
		min-width: 600px;
	}
	.storyWrapper{
		width: 500px;
		margin: 0 auto;
		justify-content: center;
	}
	
	.storyBox{
		margin: 0 auto;
		border: 1px solid black;
		width: 470px;
		height: 100px;
		overflow: hidden;
		border-radius: 10px;
	}
	
	.storySlider{
		height: 100px;
		display: inline-flex;
		justify-content: flex-start;
		align-items: center;
		flex-wrap: nowrap;
		position: relative;
		transition: all ease 1s 0s;
	}
	
	.storyCircle{
		border: 1px solid black;
		width: 55px;
		height: 55px;
		margin-bottom: 5px;
		border-radius: 100px;
		background: none;
	}
	
	.sotryBtnBox{
		z-index: 1;
	}
	
	.storyMoveBtn{
		background-color: lightgray;
		border-radius: 100px;
		width: 30px;
		height: 30px;
		line-height: 30px;
		position: relative;
		text-align: center;
		cursor: pointer;
	}
	
	.storyPreBtn{
		top: -60px;
		left: 20px;
	}
	
	.storyNextBtn{
		top: -90px;
		left: 450px;
	}
	
	.storyObject{
		text-align: center;
		margin-left: 15px;
		font-size: 9pt;
		color: gray;
	}
</style>

<script type="text/javascript">
	$(function(){
		i=1;
		$("div.storyNextBtn").click(function(){
			i=i+420;
			$(".storySlider").css({'transform':'translateX(-'+i+'px)'});
		})
		
		$("div.storyPreBtn").click(function(){
			i=i-420;
			$(".storySlider").css({'transform':'translateX('+i+'px)'});
		})
	})
</script>

</head>
<body>
<div class="storyCotainer">
	<div class="storyWrapper">
		<div class="storyBox">
			<div class="storySlider">
				<div class="storyObject">
					<div class="storyCircle"></div>
					<span class="storyWriter">내 스토리</span>
				</div>
			</div>
		</div>
		<div class="sotryBtnBox">
			<div class="storyPreBtn storyMoveBtn">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</div>
			<div class="storyNextBtn storyMoveBtn">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</div>
		</div>
	</div>
</div>
</body>
</html>