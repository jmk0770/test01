<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- <meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content=""> -->



<!-- Bootstrap Core CSS -->
<!-- <link href="/css/bootstrap.min.css" rel="stylesheet">
 -->
<!-- Custom CSS -->
<!-- <link href="/css/stylish-portfolio.css" rel="stylesheet">
 -->
<!-- Custom Fonts -->
<!-- <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css"> -->


<style type="text/css">
.navbar .navbar-nav {
	display: inline-block;
	float: none;
	vertical-align: top;
}

.navbar .navbar-collapse {
	text-align: center;
}

.dropdown-menu {
	right: 50px;
	float: none;
	left: initial;
	min-width: 100px;
}
</style>

	<!-- Login Modal -->
  <form name="loginForm"  method="post" action="/app/user/login" target="_self">
   <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
      <div class="modal-content ">
      
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="exampleModalLabel">회원 정보를 기입해주세요.</h4>
        </div>
        
        <div class="modal-body">
          <div class="form-group">
          <input class="form-control" placeholder="(아이디)E-mail" name="email" type="email" autofocus>
        </div>
        <div class="form-group">
          <input class="form-control" placeholder="Password" name="password" type="password" value="">
        </div>  
        <div class="form-group">    
          <button class="btn btn-success btn-block">로그인</button>
        </div>  
        </div><!-- modal-body tag end --> 
	      
	       <div class="modal-footer">          
          <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" data-auto-logout-link="true" style="width:300px;">
      </fb:login-button>
        </div> 
        
        <div class="modal-footer">          
         <button class="btn btn-sign-up btn-block">회원가입</button>
        </div>       
	      
	      
	      </div><!-- modal-content tag end -->
	  </div><!-- modal-dialog tag end -->
	</div>
	</form>
	
	<!-- 회원가입 모달 -->
	<div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="exampleModalLabel">회원정보를 기입해주세요.</h4>
	      </div>
	      
	      <div class="modal-body">
          <form name="detailForm"  method="post" >
        <div class="joinForm"> 
          <div id="title">
          <b>&nbsp 회원가입</b>
          </div>
            <div id="inputForm">
              <label for="email"></label><br>
              <input type="text" name="email"><br>
              <label for="nickname">닉네임</label><br>
              <input type="text" name="nickname"><br>
              <label for="password">비밀번호</label><br>
              <input type="password" name="password"><br>
              <label for="passwdConfirm">비밀번호 확인</label><br>
                  <input type="password" name="passwdConfirm"><br><br>
                  <a href="javascript:fncAddUser();">가입</a>
              <!-- <input id=joinButton type="submit" value="가입하기">  -->
						</div>
						<div id="faceJoin">
			        <input id=faceButton type="button" value="페이스북으로 가입하기">    
			      </div>      
				</div>
			</form>	
	      </div>
	      <div class="modal-footer">	        
	      <a href="index.html" class="btn btn-success btn-block">회원 가입</a>
	      </div><!-- modal-body tag end -->      
	    </div><!-- modal-content tag end -->
	  </div><!-- modal-dialog tag end -->
	</div>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


	<!-- Navigation -->    
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"  >
                    <i class="fa fa-play-circle"></i>  <span class="light"></span>POLAROID
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-main-collapse"
				style="width: 1300px;">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					 
					<li class="hidden"><a href="#top"></a></li>
					<li><a class="page-scroll" href="#top">Home</a></li>
					<li><a class="page-scroll" href="#about">New Latter</a></li>
					<li><a class="page-scroll" href="#services">Services</a></li>
					<!-- <li><a class="page-scroll" href="#ourStory">Our Story</a></li> -->
					<!-- <li><a class="page-scroll" href="#contact">Map</a></li> -->

					<!-- Navigation -->
					<a id="menu-toggle" href="#" class="btn btn-light btn-lg toggle"><i
						class="fa fa-bars"></i></a>
					<nav id="sidebar-wrapper" style="width: 150px">
						<ul class="sidebar-nav" style="width: 150px">
							<a id="menu-close" href="#"
								class="btn btn-light btn-sm pull-right toggle"><i
								class="fa fa-times"></i></a>
							<li class="sidebar-brand"></li>							
							<li><a href="page/reviewBoard.html">후기 게시판</a></li>
							<li><a href="page/freeBoard.html">자유 게시판</a></li>
						</ul>
					</nav>
				</ul>

				<!-- /.dropdown -->

				<a class="dropdown-toggle btn-light btn-lg btn " data-toggle="dropdown" href="#" 
				style="z-index: 1;  position: fixed; top: 0;right:50px; margin-top:3px; ">
					<i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a> 
				<c:if test="${! empty user }">
					<ul class="dropdown-menu">				
						  <li>
						    <a href="page/myPageMain.jsp">
						    <i class="fa fa-user fa-fw"></i> User Profile</a>
						  </li>
					    <li>
					     <a href="/app/user/getUser1.do?userNo=${user.userNo}">
					     <i class="fa fa-gear fa-fw"></i>Settings</a>
					    </li>
						    <li class="divider"></li>
						    <li><a href="/app/user/logout">
						  <i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul>
					</c:if>							
					<c:if test="${ empty user }">
					<ul class="dropdown-menu">
						<li class="divider"></li>
						<li>	
							<a href="#" data-toggle="modal" data-target="#loginModal">				
								<i class="fa fa-sign-in fa-fw"></i>
								Login
							</a>							
						</li>					
					</ul> 					
					</c:if>				
				<!-- /.dropdown -->
			</div>
			<!-- /.navbar-collapse -->
		</div>
        <!-- /.container -->
    </nav>


	<!-- jQuery -->
	<!-- <script src="/js/jquery.js"></script> -->

	<!-- Bootstrap Core JavaScript -->
	<!-- <script src="/js/bootstrap.min.js"></script> -->

	<!-- 회원가입 modal 종료 시 바디 padding 초기화 -->
	

