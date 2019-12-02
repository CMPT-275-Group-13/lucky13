<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleRegisterPage">Register</title>
	<?php include("includes/head-tag-contents.php");?>
	<script type="text/javascript" src="includes/javascript/register.js"></script>
</head>
<div class="containter" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/website-logo.png">
</div>
<body style="background-color:#a7cfda">

<!--register page modified using this template: https://startbootstrap.com/snippets/login/"-->

<div class="container">
	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
		<div class="card card-signin my-5" >
			<div class="card-body">
			<h5 class="card-title text-center">Sign Up</h5>
			<form class="form-signup">
				<div class="form-row">
					<div class="col form-group">
						<label>First Name</label>
						<input type="text" id="first-name" class="form-control" placeholder="First Name" required>
							
					</div>
					<div class="col form-group">
						<label>Last Name</label>
						<input type="text" id="last-name" class="form-control" placeholder="Last Name" required>
									
					</div>
				</div>
				<div class="form-label-group">
					<label for="email">Email address</label>
					<input type="email" id="email" class="form-control" placeholder="Email address" required autofocus>
				</div>
				<div class="form-label-group">
					<label for="password">Password</label>
					<input type="password" id="password" class="form-control" placeholder="Password" required>
				</div>

				<div class="form-label-group">
					<label for="phoneNumber">Phone Number</label>
					<input type="text" id="phoneNumber" class="form-control" placeholder="Phone Number" required>
				</div>

				<div class="form-label-group">
					<label for="userType">Account Type</label>
					<div>
						<select id="userType" name="userType">
							<option value="doctor" selected>Doctor</option>
							<option value="patient">Patient</option>
						</select>
					</div>
				</div>

				<p></p>
				<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="register-btn" style="background-color:#66cccc">Register</button>
				<div class="modal-footer">
					<div class="options text-center text-md-right mt-1">
						Have an account? <a href="login.php" class="blue-text">Sign In</a>
					</div>
				</div>
			</form>
			</div>
		</div>
		</div>
	</div>
</div>

</body>
</html>