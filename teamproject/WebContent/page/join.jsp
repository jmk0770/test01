<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>

<!-- jQuery -->
<script src="jquery-1.11.3.min.js"></script>

<!-- getBootStrap CSS / JavaScript -->
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap-theme.min.css">
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>


<style>

	/* class */
	.joinForm{width:400px; height:600px; border:solid 1px grey; font-size:12px;}
	
	/* tag */
	input{width:270px; height:40px; margin-bottom:15px;}
	
	/* Button */
	.btEtc {text-shadow:none; color:white;}
	#joinButton{ margin-left:15%; width:150px; height:35px; margin-bottom:10px; background:#58a454;}
	#fbButton{margin-left:11%; margin-top:20px; background:#4864b4;}
	
	/* id */
	#title{width:auto; height:8%; line-height:50px; border-bottom:solid 1px grey}
	#inputForm{margin-left:10%; margin-top:30px; color:grey}
	#fbJoin{width:auto; height:80px; border-top:solid 1px grey;}
	#footer{margin-left:28%; margin-top:25px}
	
</style>

</head>
<body>

<form name="detailForm"  method="post" >
	<div class="joinForm"> 
		<div id="title">
		<b>&nbsp 회원가입</b>
		</div>
			<div id="inputForm">
			  <label for="email">이메일</label><br>
				  <input type="text" name="email"><br>
				<label for="nickname">닉네임</label><br>
				  <input type="text" name="nickname"><br>
				<label for="password">비밀번호</label><br>
				  <input type="password" name="password"><br>
		    <label for="passwdConfirm">비밀번호 확인</label><br>
	         <input type="password" name="passwdConfirm"><br><br>
	      <Button onclick="javascript:fncAddUser();" class="btn btn-default btEtc" id=joinButton>가입</Button>
			</div>
			<div id="fbJoin">
        <input id=fbButton class="btn btn-default btEtc" type="button" value="페이스북으로 가입하기">    
      </div>
      <div id="footer">
	       비밀번호 찾기 / 로그인 
      </div>
	</div>
</form>

<script>
function fncAddUser() {
document.detailForm.action='/app/user/addUser.do';
document.detailForm.submit();
}
</script>

</body>
</html>