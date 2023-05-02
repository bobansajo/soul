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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
		/* border: 1px solid black; */
		width: 55px;
		height: 55px;
		margin-bottom: 5px;
		border-radius: 100px;
		background: none;
	}
	
	.storyCircle img{
		width: 55px;
		height: 55px;
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
	
	#storyAddBtn{
		background-color: skyblue;
		border: 2px solid white;
		border-radius: 100px;
		width: 25px;
		height: 25px;
		line-height: 20px;
		text-align: center;
		z-index: 1;
		position: relative;
		top: -20px;
		left: 35px;
		cursor: pointer;
	}
	
	.showDetailStory{
		cursor: pointer;
	}
</style>

<script type="text/javascript">
	$(function(){
		i=0;
		$("div.storyNextBtn").click(function(){
			i=i-420;
			$(".storySlider").css({'transform':'translateX('+i+'px)'});
		})
		
		$("div.storyPreBtn").click(function(){
			i=i+420;
			$(".storySlider").css({'transform':'translateX('+i+'px)'});
		})
		
		//스토리 업로드
		$("#storyUploadBtn").click(function(){
			var form=new FormData();
			form.append("upload",$("#storyUploadPhoto")[0].files[0]); //선택한 1개만 추가
			//선택한 사진 전달(unum은 로그인한 유저 정보 사용)
			$.ajax({
				type:"post",
				dataType:"text",
				url:"storyinsert",
				processData:false, //formData를 보낼 때 false로 지정해준다(기본이 true)
				contentType:false,
				data:form,
				success:function(){
					location.reload();
				}
			})
		})
		
		//스토리 디테일 페이지 열기
		$(".showDetailStory").click(function(){
			//alert($(this).attr("unum"));
			location.href='../story/list?unum='+$(this).attr("unum");
		})
	})
</script>

</head>
<body>
<div class="storyCotainer">
	<div class="storyWrapper">
		<div class="storyBox">
			<div class="storySlider">
			
			<!-- 스토리 추가버튼 -->
				<div class="storyObject">
					<div class="storyCircle">
						<c:if test="${sessionScope.loginphoto=='no' }">
							<img alt="사용자 이미지" src="/image/nouser.jpg">
						</c:if>
						<c:if test="${sessionScope.loginphoto!='no' }">
							<img alt="사용자 이미지" src="/photo/${sessionScope.loginphoto }">
						</c:if>
						<div id="storyAddBtn" data-toggle="modal" data-target="#storyModal">
							<span class="glyphicon glyphicon-plus"></span>
						</div>
					</div>
					<span class="storyWriter">내 스토리</span>
				</div>
				
				<!-- 스토리 나열 -->
				<c:forEach items="${storyList }" var="userInfo">
					<div class="storyObject">
						<div class="storyCircle showDetailStory" unum=${userInfo.unum }>
							<c:if test="${userInfo.userphoto=='no' }">
								<img alt="사용자 이미지" src="/image/nouser.jpg">
							</c:if>
							<c:if test="${userInfo.userphoto!='no' }">
								<img alt="사용자 이미지" src="/photo/${userInfo.userphoto }">
							</c:if>
						</div>
						<span class="storyWriter showDetailStory" unum=${userInfo.unum }>${userInfo.id }</span>
					</div>
				</c:forEach>
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

<!-- Modal -->
  <div class="modal fade" id="storyModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">스토리</h4>
        </div>
        <div class="modal-body">
          <h4>스토리 사진 선택</h4>
          <input type="file" required="required" id="storyUploadPhoto">
        </div>
        <div class="modal-footer">
        	<button type="button" class="btn btn-default" id="storyUploadBtn">업로드</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
</body>
</html>