<?php include("includes/helper.php");?>
<?php include("includes/config.php");?>
<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
	<script src="includes/javascript/doctor-profile.js" text="text/javascript"></script>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<form action="">
			<div><h1>Main Profile</h1></div>
			<div>
				<a href="upload-profile-picture.php" onclick="//firebaseResetUserPassword('jinn@sfu.ca')"/>
					<img src="images/users/user-template.png" alt="profile-picture" height="100" width="100"/>
				</a>
			</div>
			<div>
				<label>Email Address: </label>
				<input id="profile-email" value=""/>
			</div>
			<div>
				<label>Title: </label>
				<input id="profile-title" value=""/>
			</div>
			<div>
				<label>First Name: </label>
				<input id="profile-first-name" value=""/>
			</div>
			<div>
				<label>Last Name: </label>
				<input id="profile-last-name" value=""/>
			</div>
			<div>
				<label>Phone Number: </label>
				<input id="profile-phone" value=""/>
			</div>

			<div>
				<div><h1>Settings</h1></div>
			</div>

			<div>
				<div><h1>Patients</h1></div>
				<div>
					<ul>
						<li>Patient #1</li>
					</ul>
				</div>
			</div>

			<div>
				<div><h1>Password</h1></div>
				<div>
					<label>Reset Password: </label>
					<input id="profile-reset-password" type="checkbox"/>
				</div>
			</div>

			<div>
				<button onclick="" type="">Update</button>
			</div>
		</form>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>