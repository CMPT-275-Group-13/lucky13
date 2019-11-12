<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>

<?php
$email = '';
$password = '';

if (isset($_POST) && $_SERVER["REQUEST_METHOD"] == "POST") {
	if (isset($_POST['email']) && isset($_POST['password'])) {
		$email = sanitiseUserInput($_POST['email']);
		$password = sanitiseUserInput($_POST['password']);
		// $password = hashPassword($password);

		// TO-DO: Check User authentication
		// If valid, redirect to landing page
		// if (true) {
		// 	redirect('landing.php'); // Do we want index.php to be the landing page?
		// }
	}
}

?>

<script type="text/javascript" src="includes/javascript/account-login.js"></script>
<body>

<script type="text/javascript">
	checkUserAuthentication();
</script>

<?php include("includes/design-top.php");?>
<?php //include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div class="" id="">
			<div class="" id="login-status">
			</div>

			<form id="login-form" class="form-inline" action="" method="POST">
				<div class="form-group">
					<div>
						<label><b>Username</b></label>
					</div>
					<div>
						<input class="form-control" type="textbox" name="email" id="email" required/>
					</div>
				</div>
				<div class="form-group">
					<div>
						<label><b>Password</b></label>
					</div>
					<div>
						<input class="form-control" type="password" name="password" id="password" required/>
					</div>
				</div>
				<div class="form-group">
					<button id="login-btn" class="btn btn-default">Submit</button>
				</div>
				<div class="form-group">
					<a href="register.php">Register</a>
				</div>
			</form>
		</div>
		<div>
			<div>
				<button onclick = "googleSignin()">Google Signin</button>
				<button onclick = "googleSignout()">Google Signout</button>
			</div>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>
</body>
</html>