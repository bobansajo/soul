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
	.boardCotainer{
		max-width: 550px;
		min-width: 600px;
	}

	.boardWrapper{
		width: 500px;
		margin: 0 auto;
		justify-content: center;
	}
	
	.boardBox{
		margin: 0 auto;
		border: 1px solid black;
		border-radius: 10px;
		width: 470px;
		/* height: 850px; */
		margin-bottom: 10px;
	}
	
	.boardWirterBox{
		width: 100%;
		/* height: 8%; */
		height: 67px;
		display: inline-flex;
		align-items: center;
	}
	
	.boardPhoto{
		width: 100%;
		/* height: 56%; */
		height: 475px;
	}
	
	.boardDetail{
		width: 100%;
		height: 30%;
		padding-left: 10px;
		padding-right: 10px;
		margin-bottom: 10px;
	}
	.boardWriterPhoto{
		width: 35px;
		height: 35px;
		border-radius: 100px;
		border: 1px solid black;
		margin-left: 10px;
	}
	
	.boardWriter{
		margin-left: 10px;
		font-size: 10pt;
		font-weight: bold;
	}
	
	.boardCommentMenu{
		font-size: 18pt;
		padding-top: 2px;
	}
	
	.bcdIcon{
		margin-right: 11px;
	}
	
	.boardlikeShow{
		font-size: 12pt;
		margin-top: 8px;
		font-weight: bold;
	}
	
	.boardContent{
		font-size: 11pt;
		margin-top: 7px;
	}
	
	.boardCommentMore{
		font-size: 10pt;
		color: gray;
		margin-top: 5px;
	}
	
	.boardCommentList{
		font-size: 11pt;
		margin-top: 5px;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}
	
	.boardWriteday{
		font-size: 9pt;
		color: gray;
		margin-top: 5px;
	}
	
	.BoardCommentBox{
		width: 100%;
		height: 50px;
		border-top: 1px solid black;
		display: inline-flex;
		align-items: center;
		justify-content: center;
		padding-left: 10px;
	}
	
	.BoardCommentBox span{
		margin-right: 10px;
	}
	
	.BoardCommentBox input {
		width: 82%;
		font-size: 12pt;
		border: none;
	}
	
	.BoardCommentBox button{
		background: none;
		border: none;
		font-size: 11pt;
		color: lightblue;
	}
	
	.boardContent .wr{
		font-weight: bold;
	}
</style>

</head>
<body>
<div class="boardCotainer">
	<div class="boardWrapper">
		<div class="boardBox">
			<div class="boardWirterBox">
				<div class="boardWriterPhoto">
				</div>
				<span class="boardWriter">writer</span>
			</div>
			<div class="boardPhoto">
				<img alt="" src="">
			</div>
			<div class="boardDetail">
				<div class="boardCommentMenu">
					<span class="glyphicon glyphicon-heart-empty bcdIcon"></span>
					<span class="glyphicon glyphicon-comment bcdIcon"></span>
					<span class="glyphicon glyphicon-send bcdIcon"></span>
				</div>
				<div class="boardlikeShow">
					<span>좋아요 123</span>
				</div>
				<div class="boardContent">
					<span class="wr">쓴 사람</span>
					<span>내용내용</span>
				</div>
				<div class="boardCommentMore">
					<span>댓글 더보기</span>
				</div>
				<div class="boardCommentList">
					<span>어쩌구 댓글 내용</span>
					<span class="glyphicon glyphicon-heart-empty cmLike"></span>
				</div>
				<div class="boardWriteday">
					<span>1일전</span>
				</div>
			</div>
			<div class="BoardCommentBox">
				<span class="glyphicon glyphicon-user"></span>
				<input type="text" placeholder="댓글 달기...">
				<button type="button">게시</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>