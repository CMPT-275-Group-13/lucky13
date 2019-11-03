<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<?php

$username = '';
$password = '';

if (isset($_POST) && $_SERVER["REQUEST_METHOD"] == "POST") {
	if (isset($_POST['username']) && isset($_POST['password'])) {
		$username = sanitiseUserInput($_POST['username']);
		$password = sanitiseUserInput($_POST['password']);
		$password = hashPassword($password);

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
			<form action="index.php" method="POST">
				<div>
					<div>
						<span>Username</span>
					</div>
					<div>
						<input type="textbox" name="username"/>
					</div>
				</div>
				<div>
					<span>Password</span>
				</div>
				<div>
					<input type="password" name="password"/>
				</div>
				<div>
					<input type="submit" name="submit" value="Submit"/>
				</div>
			</form>
		</div>
		<div>
			<div>
				<span><a href="register.php" target="">Register</a></span>
			</div>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>