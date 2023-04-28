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
<!-- Plugin -->
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css" />
<script src="https://rawgit.com/enyo/dropzone/master/dist/dropzone.js"></script>

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

div.layout div.menu {
	position: fixed;
	width: 200px;
	height: 100%;
	z-index: 100;
}

div.layout div.main {
	max-width: 50%;
	min-width: 300px;
	margin: 0 auto;
	padding-top: 3%;
}

.file_box {
	width: 100%;
	height: 300px;
	border-radius: 10px;
	margin-top: 20px;
	padding: 40px;
	text-align: center;
	background-color: #fff;
	cursor: pointer;
}

.file_name {
	margin: auto;
	width: 100%;
	height: 220px;
	line-height: 220px;
	text-align: center;
	color: gray;
	font-size: 16px;
	text-align: center;
	cursor: pointer;
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
<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" style="padding:10px;">새게시물 만들기</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<div id="dropzone" style="padding:10px;">
					<!-- 	<form action="https://httpbin.org/post"
							class="dropzone needsclick" id="demo-upload">
							<div class="dz-message needsclick">
								<span class="text" style="font-size:16px; font-weight:500;"> 이곳에 사진을 끌어놓으세요</span> 
							</div>
						</form> -->
						<form action="insert" method="post" enctype="multipart/form-data">
							<input type="file" name="upload" class="form-control" multiple="multiple">
							<textarea name="content" style="width: 400px; height: 150px;" 
								class="form-control" required="required">
							</textarea>
							
							<button type="submit" class="btn btn-default">등록</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
  
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