<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<?php

$username = '';
$password = '';

if (isset($_POST) && $_SERVER["REQUEST_METHOD"] == "POST") {
	if (isset($_POST['username']) && isset($_POST['password'])) {
		$username = sanitiseUserInput($_POST['username']);
		$password = sanitiseUserInput($_POST['password']);
		// $password = hashPassword($password);

		

		// TO-DO: Check User authentication
		// If valid, redirect to landing page
		if (true) {
			redirect('landing.php'); // Do we want index.php to be the landing page?
		}
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php //include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div class="" id="">
			<form class="form-inline" action="index.php" method="POST">
				<div class="form-group">
					<div>
						<label><b>Username</b></label>
					</div>
					<div>
						<input class="form-control" type="textbox" name="username" id="username"/>
					</div>
				</div>
				<div class="form-group">
					<div>
						<label><b>Password</b></label>
					</div>
					<div>
						<input class="form-control" type="password" name="password" id="password"/>
					</div>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
				<div class="form-group">
					<a href="register.php">Register</a>
				</div>
			</form>
		</div>
		<div>
			<div>
				
			</div>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>