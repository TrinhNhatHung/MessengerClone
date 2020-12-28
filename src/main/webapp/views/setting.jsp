<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="views/css/jquery-ui.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="canonical"
	href="https://codepen.io/emilcarlsson/pen/ZOQZaV?limit=all&page=74&q=contact+" />
<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700,300'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" type="image/x-icon"
	href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type=""
	href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
	color="#111" />

<link rel="stylesheet" href="views/css/setting.css">

<script src="https://unpkg.com/react@17/umd/react.production.min.js"
	crossorigin></script>
<script
	src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js"
	crossorigin></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
</head>
<body>
	<div class="frame">
		<div class="side-panel">
			<div class="profile">
				<div class="avatar">
					<%
						User currentUser = (User) request.getAttribute("currentUser");
						String currentUserProfile = currentUser.getProfile();
						if (currentUserProfile == null) {
							currentUserProfile = "views/images/avatar-default.png";
						}
					%>
					<img src="<%=currentUserProfile%>" alt="">
					<div class="box">
						<input type="file" name="file-5[]" id="file-5"
							class="inputfile inputfile-4"
							data-multiple-caption="{count} files selected" multiple /> <label
							for="file-5">
							<figure>
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="17"
									viewBox="0 0 20 17">
									<path
										d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z" /></svg>
							</figure>
						</label>
					</div>
				</div>
				<p>${currentUser.username}</p>
				<a href="<%=request.getContextPath()%>/signout"> <i
					class="fa fa-sign-out" aria-hidden="true"></i>
				</a>
			</div>
		</div>

		<div class="main-panel">
			<div class="person-detail edit-component">
				<h1 class="head-of-component">Personal Detail</h1>
				<span class="edit-info person-detail-edit"> <label for="edit"><i
						class="fa fa-edit" aria-hidden="true"></i></label> <a name="edit">Edit</a>
				</span>
				<div class="person-info info">
					<table>
						<colgroup>
							<col width='17%'>
							<col width='83%'>
						</colgroup>
						<tr>
							<td class="label"><label for="">Name</label></td>
							<td>
								<p>${currentUser.username}</p>
							</td>
						</tr>
						<tr>
							<td class="label"><label for="">Gender</label></td>
							<td>
								<p>${currentUser.gender}</p>
							</td>
						</tr>
						<tr>
							<td class="label"><label for="">Date of birth</label></td>
							<td>
								<p>${currentUser.dateOfBirth}</p>
							</td>
						</tr>
						<tr>
							<td class="label"><label for="">Address</label></td>
							<td>
								<p>${currentUser.address}</p> <br> <span>${currentUser.city}
									, ${currentUser.country}</span>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="contact edit-component">
				<h1 class="head-of-component">Contact</h1>
				<span class="edit-info contact-edit"> <label for="edit"><i
						class="fa fa-edit" aria-hidden="true"></i></label> <a name="edit">Edit</a>
				</span>
				<div class="contact-info info">
					<table>
						<colgroup>
							<col width='17%'>
							<col width='83%'>
						</colgroup>
						<tr>
							<td class="label"><label for="">Phone</label></td>
							<td>
								<p>${currentUser.phone}</p>
							</td>
						</tr>
						<tr>
							<td class="label"><label for="">Email</label></td>
							<td>
								<p>${currentUser.email}</p>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="setting edit-component">
				<form action="<%=request.getContextPath()%>/setting" method="post">
					<h1 class="head-of-component">Change password</h1>
					<span class="edit-info setting-edit"> <label for="edit"><i
							class="fa fa-edit" aria-hidden="true"></i></label>
						<button type="submit">Edit</button>
					</span>
					<div class="change-pass-form info">
						<table>
							<colgroup>
								<col width='17%'>
								<col width='83%'>
							</colgroup>
							<tr class="old-pass-row">
								<td class="label"><label for="">Password</label></td>
								<td><input type="password" class="old-pass"><span class="error"></span></td>
							</tr>
							<tr class="new-pass-row">
								<td class="label"><label for="">New password</label></td>
								<td><input type="password" name="password" class="new-pass"><span class="error"></span></td>
							</tr>
							<tr class="retype-new-pass-row">
								<td class="label"><label for="">Retype password</label></td>
								<td><input type="password" class="retype-new-pass"><span class="error"></span></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="form-person-detail popup">
		<div class="form-person-detail-container popup-container">
			<h1>Person detail</h1>
			<i class="fa fa-close close-popup" aria-hidden="true"></i>
			<div class="form">
				<form action="<%=request.getContextPath()%>/setting" method="post">
					<div class="row">
						<div class="col-6">
							<p>Name</p>
							<input name="username" type="text"
								value="${currentUser.username}" required>
						</div>
						<div class="col-6">
							<p>Gender</p>
							<%
								String selectedMale = "";
								String selectedFemale = "";
								if ("male".equals(currentUser.getGender().toLowerCase())) {
									selectedMale = "selected";
								} else {
									selectedFemale = "selected";
								}
							%>
							<select name="gender" id="">
								<option value="male" <%=selectedMale%>>Male</option>
								<option value="female" <%=selectedFemale%>>Female</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<p>Date of birth</p>
							<div class="input-date">
								<input name="date_of_birth" type="text" class="date-picker"
									value="${currentUser.dateOfBirth}"> <i
									class="fa fa-calendar" aria-hidden="true"></i>
							</div>
							<p class="address">Address</p>
							<input name="address" type="text" value="${currentUser.address}">
						</div>
					</div>

					<div class="row">
						<div class="col-6">
							<p>Country</p>
							<input name="country" type="text" value="${currentUser.country}">
						</div>
						<div class="col-6">
							<p>City</p>
							<input name="city" type="text" value="${currentUser.city}">
						</div>
					</div>
					<button type="submit">Save changes</button>
				</form>
			</div>
		</div>
	</div>

	<div class="form-contact popup">
		<div class="form-contact-container popup-container">
			<h1>Contact</h1>
			<i class="fa fa-close close-popup" aria-hidden="true"></i>
			<div class="form">
				<form action="<%=request.getContextPath()%>/setting" method="post">
					<div class="row">
						<div class="col-12">
							<p>Phone</p>
							<input name="phone" type="text" pattern="[0-9]{10}"
								value="${currentUser.phone}">
							<p>Email</p>
							<input name="email" type="text" value="${currentUser.email}">
						</div>
					</div>
					<button type="submit">Save changes</button>
				</form>
			</div>
		</div>
	</div>
	<script>
		if ('false' == '<%=request.getParameter("updateInfo")%>') {
			alert("Update failed");
		}		
		 $('.setting form').submit(function() {
	            let oldPass = $('.change-pass-form .old-pass').val();
	            let newPass = $('.change-pass-form .new-pass').val();
	            let retypePass = $('.change-pass-form .retype-new-pass').val();
	            if (oldPass != '<%=currentUser.getPassword()%>'){
	            	$('.change-pass-form .old-pass-row .error').html('* Not correct');
	            	$('.change-pass-form .retype-new-pass-row .error').html('');
	            	return false;
	            }
	            
	            if (newPass != retypePass) {
	            	$('.change-pass-form .old-pass-row .error').html('');
	            	$('.change-pass-form .retype-new-pass-row .error').html('* Not correct');
	            	return false;
	            }
	            return true;
	       });
	</script>
	<script src="views/js/setting.js"></script>
</body>
</html>