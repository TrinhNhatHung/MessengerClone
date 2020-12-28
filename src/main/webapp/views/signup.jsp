<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    
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
<!-- //Meta-Tags -->

<!-- Style -->
<link rel="stylesheet" href="views/css/style.css">

<!-- Fonts -->
<link
	href="//fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900"
	rel="stylesheet">
<!-- //Fonts -->
</head>
<body>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

	<h1>MESSENGER</h1>

	<!---728x90--->


	<div class="container w3layouts agileits">

		<div class="register w3layouts agileits">
			<h2>Sign Up</h2>
			<%
				String name = "";
				String password = "";
				String email = "";
				String gender = "";
				String phone = "";
				
				if (request.getAttribute("name") != null){
					name =(String)request.getAttribute("name");
				}
				
				if (request.getAttribute("password") != null){
					password =(String)request.getAttribute("password");
				}
				
				if (request.getAttribute("email") != null){
					email =(String)request.getAttribute("email");
				}
				
				if (request.getAttribute("gender") != null){
					gender =(String)request.getAttribute("gender");
				}
				
				if (request.getAttribute("phonenumber") != null){
					phone =(String)request.getAttribute("phonenumber");
				}
			%>
			<form action="<%= request.getContextPath()%>/signup" method="post">
				<input type="text" name="name" placeholder="Name" value="<%=name %>" required="">
				<input type="password" name="password" placeholder="Password" value="<%=password %>" required=""> 
				<input type="text" name="email" placeholder="Email" value="<%=email %>" required=""> 
				<input type="text" name="gender" placeholder="Gender" value="<%=gender %>" required=""> 
				<input type="text" name="phonenumber" placeholder="Phone Number" value="<%=phone %>" required="">
			<%
			if (request.getParameter("error") != null){
				out.print("<p style='color:red;font-size:13px'>Register failed</p><br>");
			}
			%>
			<div class="send-button w3layouts agileits">
					<input type="submit" value="Sign Up">
			</div>
			</form>
			<p>
				By creating an account, you agree to our <a
					class="underline w3layouts agileits" href="#">Terms</a>
			</p>
			<div class="clear"></div>
		</div>

		<div class="clear"></div>

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