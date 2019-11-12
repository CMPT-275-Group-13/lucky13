<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
	<script type="text/javascript" src="includes/javascript/account-register.js"></script>
	<script type="text/javascript">
		checkUserAuthentication();
	</script>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php //include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div class="" id="">
			<div class="" id="register-status">
			</div>
			<form id="register-form" class="form-inline" action="" method="POST">
				<div class="form-group">
					<div>
						<label><b>Email</b></label>
					</div>
					<div>
						<input class="form-control" type="textbox" name="email" id="email" required/>
					</div>
				</div>
				<div>
					<label><b>Password</b></label>
				</div>
				<div>
					<input class="form-control" type="password" name="password" id="password" required/>
				</div>
				<div class="form-group">
					<button id="register-btn" class="btn btn-default">Register</button>
				</div>
			</form>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>