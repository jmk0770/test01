<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보수정 페이지</title>

<!-- jQuery -->
<script src="/page/jquery-1.11.3.min.js"></script>

<!-- getBootStrap CSS / JavaScript -->
<link rel="stylesheet" href="/page/bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/page/bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
<script src="/page/bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>


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

</style>
</head>
<body>

<table>
  <tr>
    <td>이메일</td>
    <td>${user.email}</td>
  </tr>
  <tr>
    <td>닉네임</td>
    <td><input id="nickname" type="text" value="${user.nickname}"></td>
  </tr>
  <tr>
    <td>현재 비밀번호</td>
    <td><input id="passwd" type="password"></td>
  </tr>
  <tr>
    <td>새로운 비밀번호</td>
    <td><input id="newpasswd" type="password"></td>
  </tr>
  <tr>
    <td>새로운 비밀번호 확인</td>
    <td><input id="passwdConfirm" type="password"></td>
  </tr>
  <tr>
    <td><span id="intorduce">자기소개</span></td>
    <td><textarea name="intorduce" cols=51 rows=5></textarea></td>
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
      <div id= profile><img id=userPhoto src="/page/160_profile.png" width="160px" height="160px"></div>
      </c:if>
      <c:if test="${!empty user.profile }">
      <div id= profile><img id=userPhoto src="${user.profile}" width="160px" height="160px"></div>
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

 <button class="btn btn-default" id=save>저장</button>
</body>
<script>



<!-- 파일 미리보기 소스 -->

	$(function(){
	  $('#upload').on('change', function(){
	   readURL(this);
	  }) 
	})
	 
	 function readURL(input){
	  //선택된 파일 있다면
	  if(input.files && input.files[0]){
	   //선택된 파일 이름 가져오기
	   var fileName=input.files[0].name;
	   //파일 이름에서 뒤의 3글자 가져오기
	   var ext=fileName.substr(fileName.length-3, fileName.length);
	   //alert(ext);
	   //alert(fileName.lastIndexof('.'));
	   
	   //파일 이름에서 확장자 가져오기
	   //var ext=fileName.substr(fileName.lastIndexof('.')+1, fileName.length);
	   
	    //확장자를 확인해서 jpg, gif, png가 아니면//함수를 빠져나감
	   var isCheck=false; 
	
	   if(ext.toLowerCase()=='jpg' || ext.toLowerCase()=='gif' || ext.toLowerCase()=='png'){
	    isCheck=true;              
	   }
	   if(isCheck==false){
	    alert("이미지 파일 아님");
	    return;
	   }
	  
	  // 파일의 내용을 읽어 올 수 있는 파일 객체
	  var reader = new FileReader();
	  //읽을 파일을 설정
	  reader.readAsDataURL(input.files[0]);          
	  //파일의 내용이 메모리에 전부 로드되면
	  //img 태그에 출력
	  reader.onload=function(e){
	   $('#userPhoto').attr('src', e.target.result);
	  }          
	 }
	}

</script>

</html>