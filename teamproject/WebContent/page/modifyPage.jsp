<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>◎ 정보수정 페이지</title>

<!-- jQuery -->
<script src="/pola_components/js/jquery-1.11.3.min.js"></script>

<!-- getBootStrap CSS / JavaScript -->
<link rel="stylesheet" href="/pola_components/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/pola_components/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
<script src="/pola_components/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="/pola_components/js/jquery.validate.js"></script>
<script src="/pola_components/js/additional-methods.js"></script>

<style>

body{margin:20px; color:grey; font-size:12px}

/* table*/
table{width:750px; height:800px;}
td{vertical-align:top;} 
td:nth-child(1){border-top:solid #A6A6A6 1px; width:150px;}
td:nth-child(2n){padding-left:15px;}

/* tag */
input{width:330px; height:35px; background:#F6F6F6}

/* Button */
.btEtc{background:#f4f4f4; border:solid 1px #d5d5d8}
#fbConnect{margin-left:10px; width:100px; height:30px;}
#upload{margin-left:20px;}
#save{background:#33cb98; color:#f4f4f4; border:none; height:40px; width:150px; margin-left:163px}

/* ID */
#profile{width:173px;height:173px; border:solid #A6A6A6 1px; float:left;}
#userPhoto{margin:5px;}
#fileUpload{margin-left:180px; position:absolute;}

/* 에러 메시지 */
label.error {display: block; color: Red;}
label{color:grey; font-weight:normal}
</style>
</head>
<body>


<form id="modiForm" method="post" action="/app/user/updateUser" enctype="multipart/form-data">

<table>
  <tr>
    <td>이메일</td>
    <td>${user.email}</td>
  </tr>
  <tr>
    <td><label for="nicname">* 닉네임</label></td>
    <td><input name="nickname" id="nickname" type="text" class="required" value="${user.nickname}"></td>
  </tr>
  <tr>
    <td><label for="currentPassword">* 현재 비밀번호</label></td>
    <td><input name="currentPassword" id="currentPassword" class="required" type="password"></td>
  </tr>
  <tr>
    <td><label for="password">새로운 비밀번호</label></td>
    <td><input name="password" id="password" type="password"></td>
  </tr>
  <tr>
    <td><label for="passwdConfirm">새로운 비밀번호 확인</label></td>
    <td><input name="passwdConfirm" id="passwdConfirm" type="password"></td>
  </tr>
  <tr>
    <td><span id="intorduce">한줄소개</span></td>
    <td><textarea name="state_message" cols=51 rows=5>${user.state_message}</textarea></td>
  </tr>
  <tr>
    <td>이메일 알림</td>
    <td> 알림받기</td>
  </tr>
  <tr>
    <td>Facebook 연동</td>
    <td>연결됨<button class="btn btn-default btEtc" id="fbConnect">연결끊기</button></td>
  </tr>
  <tr>
    <td>프로필 이미지</td>
    <td>
      <c:if test= "${empty user.profile}" >
      <div id= profile><img id=userPhoto src="/img/160_profile.png" width="160px" height="160px"></div>
      </c:if>
      <c:if test="${!empty user.profile }">
      <div id= profile><img id=userPhoto src="/upload/${user.profile}" width="160px" height="160px"></div>
      </c:if>
      <div id= fileUpload>
        <input type='file' class="btn btn-default btEtc" name="photo" id="upload" value='이미지 업로드'> 
        <br><br>
         <ul>
           <li>이미지의 용량은 1MB(1,024KB)를 넘을 수 없습니다.</li>
           <li>최적화된 이미지를 등록하시려면 크기를 160x160으로 맞춰주세요.</li>
           <li>허용되는 이미지 파일포맷은 GIF, JPEG, PNG입니다</li>
         </ul>
      </div>
    </td>
  </tr>
</table>
 <input type="hidden" name="userNo" value="${user.userNo}">
 <button class="btn btn-default" onclick="javascript:passwdCheck();"id=save >저장</button>
</form>

</body>
<script>

	$(function(){
	  $('#upload').on('change', function(){
	   readURL(this);
	  }) 
	})
	 
	 function readURL(input){

	  if(input.files && input.files[0]){

	   var fileName=input.files[0].name;
	   var ext=fileName.substr(fileName.length-3, fileName.length);
	   var isCheck=false; 
	
	   if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
	    isCheck=true;              
	   }
	   if(isCheck==false){
	    alert("이미지 파일만 업로드 해주세요." + "<br> ex) *.jpg, *.gif, *.png");
	    return;
	   }
	  

	  var reader = new FileReader();

	  reader.readAsDataURL(input.files[0]);          

	  reader.onload=function(e){
	   $('#userPhoto').attr('src', e.target.result);
	  }          
	 }
	}
	
	function passwdCheck(){
	  
	  alert("함수진입성공");
	  var pwd = ${user.password};
	  alert(pwd);
	  var checkPwd = document.modiForm.currentPassword.value;
	  alert(checkPwd);
	  
	  if ( checkPwd != pwd ){
	    
	    alert("현재 비밀번호를 잘못 입력하셨습니다. 다시 입력 부탁드립니다.");
	    document.modiForm.currentPassword.focus();
	    return;
	  } 
	  
	}
	
	
	

	$(function(){

	  $("#modiForm").validate({
	    rules:{
	      nickname: "required",
	      currentPassword:"required",
	      passwdConfirm: {equalTo: "#password" }   
	    },
	    messages:{
	      nickname: "닉네임을 입력해주세요",
	      currentPassword: "비밀번호를 입력해주세요",
	      passwdConfirm: {
	        equalTo: "새로운 비밀번호와 일치하지 않습니다."}
	    }
	  });
	});
	
</script>

</html>