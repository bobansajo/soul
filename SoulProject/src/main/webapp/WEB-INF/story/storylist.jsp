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
	.storyListContainer{
		width: 100%;
		height: 100%;
	}
	
	.storyListWrapper{
		width: 500px;
		height: 650px;
		/* border: 1px solid white; */
		overflow: hidden;
		margin: 0 auto;
	}
	
	.storyListBox{
		width: 500px;
		height: 650px;
		display: inline-flex;
		align-items: center;
		transition: all ease 1s 0s;
		position: relative;
	}
	
	.storyListObject{
		text-align: center;
	}
	
	.storyListObject img{
		width: 500px;
	}
	
	.storyListOut{
		float: right;
		cursor: pointer;
	}
	
	.storyListBtn{
		background-color: lightgray;
		border-radius: 100px;
		width: 30px;
		height: 30px;
		text-align: center;
		line-height: 30px;
	}
	
	.storyListBtnWrapper{
		position: relative;
		top: -350px;
		width: 500px;
		display: inline-flex;
		justify-content: space-between;
	}
	
	.storyListPreBtn{
	}
	
	.storyListNextBtn{
	}
	
	.storyListMove{
		display: inline-flex;
		align-items: center;
	}
</style>

<script type="text/javascript">
	$(function(){
		i=0;
		
		$(".storyListPreBtn").css("visibility","hidden");
		
		if('${storyListCount}'==1){
			$(".storyListNextBtn").css("visibility","hidden");
		}
		
		$(".storyListNextBtn").click(function(){
			i=i-500;
			/* console.log(i); */
			$(".storyListBox").css({'transform':'translateX('+i+'px)'});
			
			$(".storyListPreBtn").css("visibility","visible");
			
			if(-(i/500)=='${storyListCount-1}'){
				$(".storyListNextBtn").css("visibility","hidden");
			}
		})
		
		$(".storyListPreBtn").click(function(){
			i=i+500;
			/* console.log(i); */
			$(".storyListBox").css({'transform':'translateX('+i+'px)'});
			
			if(i==0){
				$(".storyListPreBtn").css("visibility","hidden");
			}
			
			if('${storyListCount}'!=1){
				$(".storyListNextBtn").css("visibility","visible");
			}
		})
		
		//스토리 나가기(/timeline/main으로)
		$(".storyListOut").click(function(){
			location.href='../timeline/main';
		})
	})
</script>
</head>
<body>
<div class="storyListContainer">
	<div class="storyListOut">
		<span class="glyphicon glyphicon-remove"></span>
	</div>
	<div class="storyListMove">	
		<div class="storyListPreBtn storyListBtn">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</div>
		
		<div class="storyListWrapper">
			<div class="storyListBox">
				<c:forEach items="${storyList }" var="story">
					<div class="storyListObject">
						<img alt="" src="/photo/${story.photo }">
					</div>
				</c:forEach>
			</div>
			
			<!-- <div class="storyListBtnWrapper">
				<div class="storyListPreBtn storyListBtn">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</div>
				<div class="storyListNextBtn storyListBtn">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</div>
			</div> -->
		</div>
		
		<div class="storyListNextBtn storyListBtn">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</div>
	</div>
</div>
</body>
</html>