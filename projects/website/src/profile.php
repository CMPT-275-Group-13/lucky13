<?php include("includes/helper.php");?>
<?php include("includes/config.php");?>
<!DOCTYPE html>
<html>
<head>
	<title id="titleProfilePage">Profile</title>
	<?php include("includes/head-tag-contents.php");?>
	<script src="includes/javascript/doctor-profile.js" text="application/javascript"></script>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div>
			<div id="profile-change-status"></div>
		</div>
		<form action="" method="POST">
<!-- 			<div><h1>Main Profile</h1></div> -->
			<div>
				<a href="upload-profile-picture.php" onclick="//firebaseResetUserPassword('jinn@sfu.ca')"/>
					<img src="images/users/user-template.png" alt="profile-picture" height="100" width="100"/>
				</a>
			</div>
			<div>
				<div>
					<label>Email Address: </label>
				</div>
				<div>
					<input id="profile-email" class="form-control" type="textbox" name="email" value="" required/>
				</div>
			</div>
			<div>
				<div>
					<label>Reset Password: </label>
				</div>
				<div>
					<input id="profile-reset-password" class="" type="checkbox" name="password"/>
				</div>
			</div>
			<div>
				<div>
					<label>Title: </label>
				</div>
				<div>
					<input id="profile-title" class="form-control" type="textbox" name="title" value=""/>
				</div>
			</div>
			<div>
				<div>
					<label>First Name: </label>
				</div>
				<div>
					<input id="profile-first-name" class="form-control" type="textbox" name="first-name" value="" required/>
				</div>
			</div>
			<div>
				<div>
					<label>Last Name: </label>
				</div>
				<div>
					<input id="profile-last-name" class="form-control" type="textbox" name="last-name" value="" required/>
				</div>
			</div>
			<div>
				<div>
					<label>Phone Number: </label>
				</div>
				<div>
					<input id="profile-phone" class="form-control" type="textbox" name="phone" value=""/>
				</div>
			</div>
<!-- 			<div>
				<div><h1>Settings</h1></div>
			</div> -->
<!-- 			<div>
				<div><h1>Patients</h1></div>
				<div>
					<ul>
						<li>Patient #1</li>
					</ul>
				</div>
			</div> -->

			<div class="form-group">
				<button id="profile-change-btn" class="btn btn-default" type="">Update</button>
			</div>
		</form>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>