<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    
<!-- Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">
<!-- //Fonts -->

<!-- Style -->
<link rel="stylesheet" href="views/css/style.css">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="application/x-javascript">
	
	
	
        addEventListener("load", function() {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    


</script>
<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- //Meta-Tags -->
</head>
<body>
	<h1>MESSENGER</h1>

	<!---728x90--->


	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>Sign In</h2>
			<%	
				String username = "";
			    String password = "";
				if (request.getAttribute("username") != null){
					username =(String)request.getAttribute("username");
				}
			
			    if (request.getAttribute("password") != null){
				    password =(String)request.getAttribute("password");
			    }			   			   
			%>
			<form name="login" action="<%= request.getContextPath()%>/signin" method="post">
				<input type="text" name="username" placeholder="Username" value="<%=username%>" required="">
				<input type="password" name="password" placeholder="Password" value="<%=password%>" required="">
			
			<% 
				if (request.getParameter("invalid") != null){
					out.print("<p style='color:red;font-size:13px'>Invalid</p><br>");
				}
			%>
			<ul class="tick w3layouts agileits">
				<li><input type="checkbox" id="brand1" value=""> <label
					for="brand1"><span></span>Remember me</label></li>
			</ul>
			<div class="send-button w3layouts agileits">
					<input type="submit" value="Sign In">				
			</div>
			</form>
			<a href="#">Forgot Password?</a>
			<div class="social-icons w3layouts agileits">
				<p>- Or Sign In With -</p>
				<ul>
					<li><a href="#"><span class="icons w3layouts agileits"></span><span
							class="text w3layouts agileits">Facebook</span></a></li>
					<li class="twt w3ls"><a href="#"><span
							class="icons w3layouts"></span><span
							class="text w3layouts agileits">Twitter</span></a></li>
					<li class="ggp aits"><a href="#"><span
							class="icons agileits"></span><span
							class="text w3layouts agileits">Google+</span></a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>
	
	 <div class="create_acc">
        <p>Don't have an account ?</p>
        <a href="<%= request.getContextPath()%>/signup">Create one</a>
    </div>
	

	<!---728x90--->


	<div class="footer w3layouts agileits">
		<p>
			© 2016 Library Member Login Form. All Rights Reserved | Design by <a
				href="http://w3layouts.com" target="_blank">W3layouts</a>
		</p>
	</div>

	<!---728x90--->



	<!-- //Body -->

</body>
</html>