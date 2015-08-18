/**
 * 
 */
/*<!-- 회원가입 modal 종료 시 바디 padding 초기화 -->*/

$('#signUpModal').on('hidden.bs.modal', function () {
  document.body.style.paddingRight = '0px';
})
$('#loginModal').on('shown.bs.modal', function (e) {
  document.body.style.paddingRight = '0px';
})


/*<!-- 회원가입 관련 JS -->*/
 
  function fncAddUser() {
  document.signupForm.action='/app/user/addUser.do';
  document.signupForm.submit();
  }
  
   
/*<!-- Custom Theme JavaScript -->*/
 
  /*// mouse click navi and event JavaScript*/    
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
      else if($(e.target).parents("#sidebar-wrapper").size() == 0) {
        if(sidebarflag){
          e.preventDefault();
          $("#sidebar-wrapper").toggleClass("active");
          sidebarflag = false;
        }
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
    


    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
    
      if (response.status === 'connected') {
        testAPI();
      } else if (response.status === 'not_authorized') {
        
          document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
          
      } else {
 
          document.getElementById('status').innerHTML = 'Please log ' +
          'into Facebook.';
      }
    }

  
    function checkLoginState() {
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
    }

    window.fbAsyncInit = function() {
    FB.init({
      appId      : '512655425566743',
      cookie     : true, 
                          
      xfbml      : true,  
      version    : 'v2.4' 
    });


    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

    };


    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    
    function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('/me', function(response) {
        console.log('Successful login for: ' + response.name);
        document.getElementById('status').innerHTML =
          'Thanks for logging in, ' + response.name + '!';
      });
    }
    
  
    function fncLogin() {
      var id=document.loginForm.userId.value;
      var pw=document.loginForm.password.value;
      if(id == null || id.length <1) {
        alert('ID 를 입력하지 않으셨습니다.');
        document.loginForm.userId.focus();
        return;
      }
      
      if(pw == null || pw.length <1) {
        alert('패스워드를 입력하지 않으셨습니다.');
        document.loginForm.password.focus();
        return;
      }
        document.loginForm.submit();
    }
  
    