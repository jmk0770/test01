<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
    
<title>Polaroid Project</title>

<!-- Bootstrap Core CSS -->
    <link href="/pola_components/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
    <link href="/pola_components/css/stylish-portfolio.css" rel="stylesheet">
<!-- Custom Fonts -->
    <link href="/pola_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    
<jsp:include page="topnav.jsp">
<jsp:param name="abc" value="abc"/>
</jsp:include>

<style>
  * {margin: 0px; padding: 0px;}
  ul {list-style: none;}
  img {width:1600px; height: 798px;}
  .main_img {top: 40px;}
  
  /* <!-- NaviBar CSS -->  */
  
  .navbar .navbar-nav { display: inline-block; float: none; vertical-align: top;}
  .navbar .navbar-collapse { text-align: center;} 
  .dropdown-menu { right:50px; float:none; left:initial; min-width:100px;}
  
</style>

</head>

<body>

<header id="top" class="header">
    
        <ul id="inner-fade">
            <li><img alt="" src="/img/mainPage-img/a.jpg" class="main_img"></li>
            <li><img alt="" src="/img/mainPage-img/b.jpg"></li>
            <li><img alt="" src="/img/mainPage-img/c.jpg"></li>
            <li><img alt="" src="/img/mainPage-img/d.jpg"></li>
        </ul>
        
</header>
    
     <!-- About -->
<section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                 <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <hr>
                      <!-- /.row (nested) -->
                    <a href="#" class="btn btn-dark animated">나라별 후기 보러가기~!</a>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive animated" src="img/mainPage-img/e.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive animated" src="img/mainPage-img/b.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive animated" src="img/mainPage-img/c.jpg">
                                </a>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="portfolio-item">
                                <a href="#">
                                    <img class="img-portfolio img-responsive animated" src="img/mainPage-img/d.jpg">
                                </a>
                            </div>
                        </div>
                    </div>
                  
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>    
    
    
 <!-- 영상 -->
<section id="services" class="video">
  <iframe  width="854" height="480" src="https://www.youtube.com/embed/aJD4P39SJWg" frameborder="0" allowfullscreen></iframe> 
</section>    
    
<footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>Start Polaroid</strong>
                    </h4>
                    <p>3481 Melrose Place<br>Beverly Hills, CA 90210</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-phone fa-fw"></i> (123) 456-7890</li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:name@example.com">BIT@example.com</a>
                        </li>
                    </ul>
                    <br>
                    <ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>
                    <hr class="small">
                    <p class="text-muted">Copyright &copy; Your Website 2015</p>
                </div>
            </div>
        </div>
    </footer>      
    
    
<!-- <script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
<script src="/pola_components/js/jquery.js"></script>
<script src="/pola_components/js/jquery.innerfade.js"></script>
<script src="/pola_components/js/bootstrap.min.js"></script>
<script src="/pola_components/js/topNAV.js"></script>
<script type="text/javascript">

$('#inner-fade').innerfade({
	    animation: 'fade',
	    type: 'random',
	    containerheight: '350px'
});
	
</script>
</body>
</html>