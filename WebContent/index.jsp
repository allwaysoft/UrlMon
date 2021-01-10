<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Monitoring Application URL</title>

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	%>
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">User Login</h4>
			</div>
			<div class="modal-body">
				<form action="login" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="username"
							placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<button type="submit"
							class="btn btn-primary btn-lg btn-block login-btn">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>