<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>Insert title here</title>  

	<!-- Bootstrap Core CSS -->
    <link href="/pola_components/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link href="/pola_components/css/stylish-portfolio.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="/pola_components/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- froala editor css -->
    <link href="/pola_components/testwebedit/css/froala_editor.min.css" rel="stylesheet" type="text/css">
  	<link href="/pola_components/testwebedit/css/froala_style.min.css" rel="stylesheet" type="text/css">

    <!-- Mytab css -->
	  <link rel="stylesheet" href="/pola_components/css1/timeliner.css" type="text/css">
	  <link rel="stylesheet" href="/pola_components/css1/responsive.css" type="text/css">
	  <link rel="stylesheet" href="/pola_components/css1/colorbox.css" type="text/css">
	  
  
     <!-- flowPage css -->
     <link href="/pola_components/css1/1-col-portfolio.css" rel="stylesheet">
     
	<!-- 로그인 모달 -->
	<form name="loginForm"  method="post" action="/app/user/login" target="_parent">
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
	      	<form name="signupForm"  method="post" >
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
	        <a href="/#" class="btn btn-success btn-block">회원 가입</a>
	      </div><!-- modal-body tag end -->      
	    </div><!-- modal-content tag end -->
	  </div><!-- modal-dialog tag end -->
	</div>
	
	
	<!-- 글쓰기 모달 -->	
	
	<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">			
				<div class="modal-header">
				</div>
								
				<form name="reviewForm" method="post">
				<div class="modal-body">			
					<div class="row">
						<div class="col-lg-12 col-lg-offset-0">
							<div class="panel panel-default">
								<div class="panel-heading">글쓰기 페이지</div>
								<div class="panel-body">
									<div class="row">
										<div class="form-group">
											<label>제목</label> <input type="text" name="title" class="form-control">
										</div>
										<div class="form-group">
											<label>국가</label> <input type="text" name="nationName" class="form-control">
										</div>
										<div class="form-group">
											<label>여행 기간</label>
											<p>
											<input type="date" name="period1" list="days">
											<datalist id="startday"></datalist>
											<input type="date" name="period2" list="days">
											<datalist id="endday"></datalist>
										</div>
										<div class="form-group">
											<textarea id="edit" name="content">	</textarea>								
										</div>
									</div>
									<!-- /.row -->
								</div>
								<!--  /.panel-body -->
							</div>
							<!-- /.panel paneldefault  -->						
						</div>
						<!-- /.col-lg-12 -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.modal body -->
				</form>
				<!-- /.reviewForm -->
					
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-default" data-dismiss="modal"
						onclick="fncAddReview();">Submit Button</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /. modal -->
	
<style>
body{width:1024px; margin:0px auto; }
header{height: 200px; background-image: url("../img/myPage-img/8.jpg"); background-size:cover;}
footer{height:100px; margin:1px;}
#profile{height:110px; width:110px; margin-left:460px; margin-top:-40px; margin-bottom:10px; }
#name{text-align:center; height:50px; font-size:25px;}
#total{text-align:center; font-size:small; margin-bottom:15px;}
#introduce{text-align:center; font-size:15px; margin:0px auto; margin-bottom:20px;}
#myPage{float:left; width:33.31%;height:40px; font-size:16px;text-align:center; border-bottom:solid gray 1px; cursor:pointer;}
#followPage{float:left; width:33.31%; height:40px; font-size:16px;text-align:center; border-bottom:solid lightgray 1px; cursor:pointer;} 
#likePage{float:left; width:33.31%; height:40px; font-size:16px;text-align:center; border-bottom:solid lightgray 1px; cursor:pointer;}
.img-circle{border-radius:50%;}
#navigation{margin:50px; height:10px; color:#42000F}
#follow{height:25px; width:80px; border:solid lightgray 1.5px; margin:0px auto; text-align:center;font-size:small}
button{float:right; width:150px; height:35px;}


#write{height:35px}
#post{margin:40px;}
#dayTitle{height:35px;}
#day{font-size:x-large;}
#postTitle{}
#title{color:gray; font-size:15px;}

.ellipsis {
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 5; /* 라인수 */
  -webkit-box-orient: vertical;
  word-wrap:break-word; 
}
.overflow {
  -webkit-line-clam p:3;
  margin: 0 0 2em 0;
  white-space: normal;
  overflow: hidden;
 }

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
</head>


<body>

	<!-- Navigation -->    
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"  >
                    <i class="fa fa-play-circle"></i>  <span class="light">Start</span> Share My T-Story
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-main-collapse"
				style="width: 1300px;">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#top"></a></li>
					<li><a class="page-scroll" href="/#top">Home</a></li>
					<li><a class="page-scroll" href="/#about">About</a></li>
					<li><a class="page-scroll" href="/#services">Services</a></li>
					<li><a class="page-scroll" href="/#ourStory">Our Story</a></li>
					<li><a class="page-scroll" href="/#contact">Map</a></li>

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
						<li><a href="#">
						<i class="fa fa-user fa-fw"></i> User Profile</a></li>
						<li><a href="#">
						<i class="fa fa-gear fa-fw"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="/app/user/logout">
						<i	class="fa fa-sign-out fa-fw"></i> Logout</a></li>
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



<header>
</header>
  <div id=profile>
  <img src="../img/myPage-img/7.jpg" class=img-circle height=110px width=110px>
  </div>
  <div id=name>
  <b>박수진</b>
  </div>
  
  	<div class="froala-view">
		
	</div>
  
  <div id=total>
  게시글:<b>334</b>개  팔로워:<b>20</b>명 팔로우:<b>80</b>명
  </div>
  <div id=introduce>
  여행을 너무나도 좋아하는 사람이예요. 항상 떠나고 싶어요~~ *^.^*...
  </div>
  <div id=follow>
  + 팔로우
  </div>
  
  <div id="write">
  <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#writeModal">글쓰기</button>
  </div>
  
  <div id=navigation> 
  <div id=myPage onclick="myPage()">내 페이지</div>
  <div id=followPage onclick="followPage()">팔로우 페이지</div>
  <div id=likePage onclick="likePage()">좋아요</div>
  </div>
  
  
  
<!-- ////////////////////////////////////////////1번째 -->
  
 <section>
  <div id="myPage_content" style="display:block">
      <div class="container">

    <div id="timeline" class="timeline-container">

      <button class="timeline-toggle">펼치기</button>

      <br class="clear">

      <div class="timeline-wrapper">
        <h2 class="timeline-time"><span><b>후기</b></span></h2>
        <dl class="timeline-series">
          <dt id="1" class="timeline-event"><a>첫번째</a></dt>
          <dd class="timeline-event-content" id="1EX">
            <p>하핫</p>
            
              <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->

      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="2" class="timeline-event"><a>두번째</a></dt>
          <dd class="timeline-event-content" id="2EX">

            <div class="media">
              <img src="../img/portfolio-2.jpg">
              <img src="../img/portfolio-3.jpg">
            </div><!-- /.media -->
              <p>2015/08/15~2015/08/21</p>
            <p>Threeh.</p>

            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->

      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="3" class="timeline-event"><a>세번쨰</a></dt>
          <dd class="timeline-event-content" id="3EX">

            <div class="media">
              <img src="../img/portfolio-2.jpg">
            </div><!-- /.media -->

          <p>The firseef laws iing tf the bu</p>
            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->

      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="4" class="timeline-event"><a>네번째</a></dt>
          <dd class="timeline-event-content" id="4EX">
            <div class="media">
              <img src="../img/portfolio-2.jpg">
            </div><!-- /.media -->

            <p>네번째의 내용입니다.</p>

            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->


      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="5" class="timeline-event"><a>다섯번쨰</a></dt>
          <dd class="timeline-event-content" id="5EX">
            <p>
              t of 1964h  cuivil rights movement.</p>

              <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->


      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="6" class="timeline-event"><a>여섯번째</a></dt>
          <dd class="timeline-event-content" id="6EX">
            <p>
              t of 1964h  cuivil rights movement.</p>
            
            
            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->
      
      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="7" class="timeline-event"><a>일곱번째</a></dt>
          <dd class="timeline-event-content" id="7EX">
            <p>
              t of 1964h  cuivil rights movement.</p>
            
            
            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->
      
      <div class="timeline-wrapper">
        <dl class="timeline-series">
          <dt id="8" class="timeline-event"><a>여덟번째</a></dt>
          <dd class="timeline-event-content" id="8EX">
            <p>
              t of 1964h  cuivil rights movement.</p>
            
            
            <br class="clear">
          </dd><!-- /.timeline-event-content -->
        </dl><!-- /.timeline-series -->
      </div><!-- /.timeline-wrapper -->

      <br class="clear">
    </div><!-- /#timelineContainer -->

    <br>
    <br>
  </div>
  </div>
  </section>
  
  <!-- //////////////////////////////////////////////2번쨰///// -->
  
  <section>
  <div id="followPage_content" style="display:none">
   <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Page Heading
                    <small>Secondary Text</small>
                </h1>
            </div>
        </div>
       <!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>Project One</h3>
                <h4>Subheading</h4>
                <p class="overflow ellipsis">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Two -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>Project Two</h3>
                <h4>Subheading</h4>
                <p class="overflow ellipsis">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, odit velit cumque vero doloremque repellendus distinctio maiores rem expedita a nam vitae modi quidem similique ducimus! Velit, esse totam tempore.</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Three -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>Project Three</h3>
                <h4>Subheading</h4>
                <p class="overflow ellipsis">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, temporibus, dolores, at, praesentium ut unde repudiandae voluptatum sit ab debitis suscipit fugiat natus velit excepturi amet commodi deleniti alias possimus!</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Four -->
        <div class="row">

            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>Project Four</h3>
                <h4>Subheading</h4>
                <p class="overflow ellipsis">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, quidem, consectetur, officia rem officiis illum aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut eius fugit quam in suscipit?</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Project Five -->
        <div class="row">
            <div class="col-md-7">
                <a href="#">
                    <img class="img-responsive" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>Project Five</h3>
                <h4>Subheading</h4>
                <p class="overflow ellipsis">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, quo, minima, inventore voluptatum saepe quos nostrum provident ex quisquam hic odio repellendus atque porro distinctio quae id laboriosam facilis dolorum.</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

    </div>
   </div>
  </section>
  
  <!-- ////////////////////////////////////////////////////////3번째 -->
  
  <section>
  <div id="likePage_content" style="display:none">
    <div class="layout">
  <div class=layoutPosition id=photo>
   <img class=content-border src=../../img/myPage-img/2.jpg width=94% height=300px>
  </div>
  <div id=nation>
    <img class=img-circle src=../../img/myPage-img/hojoo.jpg width=30px height=30px>
  </div>
    <span id="title">호주에서 캥거루를 만나보세요<br></span>
    <span id="writer">by 여행쟁이</span>
</div>

<div class="layout">
  <div class=layoutPosition id=photo>
   <img class=content-border src=../../img/myPage-img/4.jpg width=94% height=300px>
  </div>
  <div id=nation>
    <img class=img-circle src=../../img/myPage-img/chinaa.JPG width=30px height=30px>
  </div>
    <span id="title">중국에서 가장 유명한 공원<br></span>
    <span id="writer">by 솜사탕</span>
</div>

<div class="layout">
  <div class=layoutPosition id=photo>
   <img class=content-border src=../../img/myPage-img/1.jpg width=94% height=300px>
  </div>
  <div id=nation>
    <img class=img-circle src=../../img/myPage-img/hojoo.jpg width=30px height=30px>
  </div>
    <span id="title">코알라를 직접 만질 수 있는 곳<br></span>
    <span id="writer">by 알라</span>
</div>
</div>
  </section>
  
<footer>
</footer>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function myPage(){
    $('#myPage').css('border-bottom','solid gray 1px');
    $('#followPage').css('border-bottom','solid lightgray 1px');
    $('#likePage').css('border-bottom','solid lightgray 1px');
    $('#myPage_content').attr('style','display:block');
    $('#followPage_content').attr('style','display:none');
    $('#likePage_content').attr('style','display:none');
    
  }

  function followPage(){ 
    $('#myPage').css('border-bottom','solid lightgray 1px');
    $('#followPage').css('border-bottom','solid gray 1px');
    $('#likePage').css('border-bottom','solid lightgray 1px');
    $('#myPage_content').attr('style','display:none');
    $('#followPage_content').attr('style','display:block');
    $('#likePage_content').attr('style','display:none');
  }

  function likePage(){
    $('#myPage').css('border-bottom','solid lightgray 1px');
    $('#followPage').css('border-bottom','solid lightgray 1px');
    $('#likePage').css('border-bottom','solid gray 1px');
    $('#myPage_content').attr('style','display:none');
    $('#followPage_content').attr('style','display:none');
    $('#likePage_content').attr('style','display:block');
  }

</script>

	<!-- jQuery -->
    <script src="/pola_components/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/pola_components/js/bootstrap.min.js"></script>
    
    <!--  froaro editor JavaScript -->
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/pola_components/testwebedit/js/froala_editor.min.js"></script>
	<!--[if lt IE 9]>
	  <script src="../js/froala_editor_ie8.min.js"></script>
	<![endif]-->
	<script src="/pola_components/testwebedit/js/plugins/tables.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/urls.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/lists.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/colors.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/font_family.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/font_size.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/block_styles.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/media_manager.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/video.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/char_counter.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/entities.min.js"></script>
	<script src="/pola_components/testwebedit/js/plugins/urls.min.js"></script>
	<script>
	function fncAddReview() {
	  document.reviewForm.action='../app/review/addReview.do';
	  document.reviewForm.submit();	  
	}
	
	$(function(){
       $('#edit').editable(
       		{
       			inlineMode: false,
       			imageUploadParam: 'file_name',
       			imageUploadURL: '/app/review/addImage'        			
       		})
    });

 	
  
  	// Custom Theme JavaScript 
 	// mouse click navi and event JavaScript
    $(document).on("click",function(e) {   
    	
    	if($(e.target).is("#menu-toggle") || $(e.target).is("#menu-toggle .fa") ){    		
    		e.preventDefault();     
    	    $("#sidebar-wrapper").toggleClass("active");
    	    sidebarflag = true;
    	}
    	else if($(e.target).is("#menu-close") || $(e.target).is("#menu-close .fa") ){
    		e.preventDefault();     
   	    	$("#sidebar-wrapper").toggleClass("active");
   	    	sidebarflag = false;
    	} 
    	
    });
 	
    $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
    
    </script>
      
    <!-- GLOBAL CORE SCRIPTS -->
    <script type="text/javascript" src="/pola_components/js1/colorbox.js"></script>
    <script type="text/javascript" src="/pola_components/js1/timeliner.js"></script>
    <script>
      $(document).ready(function() {
        $.timeliner({
          startOpen:['none'],
        });
        $.timeliner({
          timelineContainer: '#timeline-js',
          timelineSectionMarker: '.milestone',
          oneOpen: true,
          startState: 'flat',
          expandAllText: '+ Show All',
          collapseAllText: '- Hide All'
        });
        // Colorbox Modal
        $(".CBmodal").colorbox({inline:true, initialWidth:100, maxWidth:682, initialHeight:100, transition:"elastic",speed:750});
      });

    </script>
  
</body>
</html>