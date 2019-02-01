<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
session.setAttribute("dest", request.getHeader("Referer"));
%> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta charset="UTF-8">
    <title>AdminLTE 2 | Log in</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
  
<title>Insert title here</title>
</head>

 <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="/resources/index2.html"><b>Soo's</b> Project</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
        
	<form action="/user/loginPost" method="post">
		<div class="form-group has-feedback">
			<input type="text" name="uid" class="form-control" placeholder="USER ID" />
			<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="text" name="upw" class="form-control" placeholder="PASSWORD" />
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<div class="row">
    	<div class="col-xs-8">    
		      <div class="checkbox icheck">
		        <label>
		          <input type="checkbox" name="useCookie"> Remember Me
		        </label>
		      </div>                        
		    </div><!-- /.col -->
		    <div class="col-xs-4">
		      <button type="submit" class="btn btn-primary btn-block btn-flat btn-login">Sign In</button>
		    </div><!-- /.col -->
		  </div>
	</form>


  <!-- jQuery 2.1.4 -->
    <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
<!-- 순서에 유의 -->
<script type="text/javascript" src="/resources/js/rsa.js"></script>
<script type="text/javascript" src="/resources/js/jsbn.js"></script>
<script type="text/javascript" src="/resources/js/prng4.js"></script>
<script type="text/javascript" src="/resources/js/rng.js"></script>
 <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
</body>
</html>