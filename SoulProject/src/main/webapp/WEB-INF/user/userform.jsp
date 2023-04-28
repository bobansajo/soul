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
#logingo{

width: 50%;
margin: 0 auto;
padding-top: 3%;
"text-decoration: none;
}
#showimg{
			border: 1px solid gray;
			width: 130px;
			height: 160px;

</style>


<style type="text/css">
		#showimg{
			border: 1px solid gray;
			width: 130px;
			height: 160px;
		}
</style>
<script type="text/javascript">
  $(function(){
	  
	  
	  //버튼클릭시 사진불러오는 이벤트 추가
	  $("#btnphoto").click(function(){
		  
		  $("#myphoto").trigger("click");
	  });
	  
	  //사진불러오면 이미지 미리보기하기
	   
	//사진 불러오면 미리보기하기
		$("#myphoto").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showimg").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
	  
	  
	  //아이디 입력시 idsuccess값 지움
	  $("#loginid").keydown(function(){
		  $("span.idsuccess").text("");
	  })
	  
	  
	  //중복체크 버튼 클릭시 아이디체크_ajax
	  $("#btnidcheck").click(function(){
		  
		  
		  //var id=$("#loginid").val();
		  //alert(id);
		  
		  $.ajax({
			  
			  type:"get",
			  dataType:"json",
			  url:"useridcheck",
			  data:{"id":$("#loginid").val()},
			  success:function(res){
				  
				  if(res.count==0){
					  $("span.idsuccess").text("ok");
				  }else{
					  $("span.idsuccess").text("fail");
				  }
			  }
		  });
		  
		  
	  });
	  
	  
	  //2번째 비밀번호 입력시 체크
	  $("#pass2").keyup(function(){
		  
		  var p1=$("#pass").val();
		  var p2=$(this).val();
		  
		  if(p1==p2){
			  $("span.passsuccess").text("ok");
		  }else{
			  $("span.passsuccess").text("fail");
		  }
	  });
	  
	  
  });
  
  //submit전테 호출
  function check(){
	  
	  //사진
	  if($("#myphoto").val()==''){
		  alert("사진을 넣어주세요");
		  return false;
	  }
	  
	  //중복체크
	  if($("span.idsuccess").text()!='ok'){
		  alert("아이디 중복체크를 해주세요");
		  return false;
	  }
	  
	  
	  //비밀번호
	  if($("span.passsuccess").text()!='ok'){
		  alert("비밀번호가 서로 다릅니다");
		  return false;
	  }
  }
  
  
</script>

</head>
<body>
 	<button type="button" class="btn btn-info" 
onclick="location.href='userlist'">전체 회원 목록</button>

<form action="userinsert" method="post" enctype="multipart/form-data" onsubmit="return check()">
   <table class="table table-bordered" style="width: 600px; margin: 0 auto; padding-top: 3%">
   		<tr>
   		<td align="center" colspan="5">
       <img alt="gaiplogo" src="/image/soullogo.png" style="width:120px;">
       <br>
       <b>친구들의 사진과 동영상을 보려면 <br>가입하세요.</b>
       </td>
       </tr>
         <tr>
           <td style="width: 200px;" rowspan="5" align="center">
             <input type="file" id="myphoto" name="myphoto" style="display: none;">
               <button type="button" id="btnphoto" class="btn btn-success">프로필 사진 선택하기 </button>
					<img id="showimg" style=" border-radius: 100%; border: 1px solid; black" >
           </td>
           
           <td>
             <div class="form-inline">
               <input type="text" placeholder="아이디입력" id="loginid" name="id"
               class="form-control" style="width: 200px;" required="required">
               
               <button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>
               &nbsp;<span class="idsuccess" style="width: 60px; color: green;"></span>
             </div>
           </td>
         </tr>
         
         
         
         
         <tr>
           <td>
             <div class="form-inline" >
               <input type="password" style="width: 200px; margin-bottom: 5px;" class="form-control"
               name="pass" id="pass" placeholder="비밀번호" required="required">
               
            <br>
               <input type="password" style="width: 200px;" class="form-control"
                id="pass2" placeholder="비밀번호 확인" required="required">
              <br>
              <span class="passsuccess" style="width: 60px; "></span>
             </div>
           </td>
         </tr>
         
         
          <tr>
          <td  >
           
             <input type="text" name="hp" class="form-control" style="width: 200px;"
             placeholder="(-)없이 hp숫자만입력" required="required">
             
            
           </td>
         </tr>
         
          <tr>
           <td>
             <input type="email" name="email" class="form-control" style="width: 200px;"
             placeholder="이메일" required="required">
           </td>
         
         
         
         <tr>
           <td>
             <input type="text" name="name" class="form-control" style="width: 200px;"
             placeholder="성명" required="required">
           </td>
         
       
           
           
         
         
        
         
         
        
         
         <tr>
           <td colspan="2" align="center">
             <button type="submit" class="btn btn-info">가입</button>
           </td>
         </tr>
         
         
         
   </table>
</form>

<div id="logingo" style="width: 400px; height: 65px;" align="center">
<b style="color: black">계정이 있으신가요?</b> 
&nbsp;
<a href="#" style="text-decoration: none;"><b style="color: blue;" >로그인 하기 </b></a>
</div>
</body>
</html>