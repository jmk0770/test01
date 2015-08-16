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
    

   /* // This is called with the results from from FB.getLoginStatus().*/ 
    function statusChangeCallback(response) {
      console.log('statusChangeCallback');
      console.log(response);
      /*// The response object is returned with a status field that lets the
      // app know the current login status of the person.
      // Full docs on the response object can be found in the documentation
      // for FB.getLoginStatus().
*/      if (response.status === 'connected') {
       /* // Logged into your app and Facebook.
*/        testAPI();
      } else if (response.status === 'not_authorized') {
       /* // The person is logged into Facebook, but not your app.
*/        document.getElementById('status').innerHTML = 'Please log ' +
          'into this app.';
      } else {
  /*      // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
*/        document.getElementById('status').innerHTML = 'Please log ' +
          'into Facebook.';
      }
    }

  /*  // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
*/    function checkLoginState() {
      FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
      });
    }

    window.fbAsyncInit = function() {
    FB.init({
      appId      : '901762359871919',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.2' // use version 2.2
    });

  /*  // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.
*/
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

    };

  /*  // Load the SDK asynchronously
*/    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    /*// Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
*/    function testAPI() {
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
  
    