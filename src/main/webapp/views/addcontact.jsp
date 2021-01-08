<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add contact</title>
<link rel="stylesheet" href="views/css/addcontact.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/react@17/umd/react.production.min.js"
	crossorigin></script>
<script
	src="https://unpkg.com/react-dom@17/umd/react-dom.production.min.js"
	crossorigin></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<script src="views/js/ListOtherUsers.jsx" type="text/babel"></script>
</head>
<body>
	<div class="container">
		<div class="row search-box">
			<div class="col-md-8">
				<div class="input-group flex-fill">
					<input type="search" name="search" id="search" value=""
						placeholder="Search..." class="form-control"
						aria-label="Search this site">
					<div class="input-group-append">
						<input type="button" name="commit" value="Search"
							class="btn btn-primary" data-disable-with="Search">
					</div>
				</div>
			</div>
		</div>
		<div class="row users">
			<div class="col-md-8">
				<div id="root"></div>
			</div>
		</div>
	</div>

	<script>
	    const listUsersJson = '${allUserJson}';
		const listUsers = JSON.parse(listUsersJson);
	</script>

	<script type="text/babel">
        $('.search-box #search').on('input', function(event) { let textSearch = $(event.target).val(); textSearch = textSearch.trim() ; let listUsersSearch = listUsers.filter(function(user) { let username = user.username; if (username.includes(textSearch)) {
        return true; } }); ReactDOM.render(
        <ListOtherUser users={ listUsersSearch}/>, document.getElementById("root")); }); ReactDOM.render(
        <ListOtherUser users={ listUsers}/>, document.getElementById("root"));
    </script>
</body>
</html>