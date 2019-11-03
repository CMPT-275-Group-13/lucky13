<?php include("includes/config.php");?>
<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div class="" id="">
			<form action="" method="POST">
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
					<input type="textbox" name="Password"/>
				</div>
				<div>
					<input type="submit" name="submit" value="Register"/>
				</div>
			</form>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>