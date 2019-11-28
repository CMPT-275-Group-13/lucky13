<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
	<title id="titleHomePage">Welcome Doctor!</title>
</head>
<body>
<div class ="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Welcome Doctor!<h1>
		<button type="submit" onclick="window.location.href='profile.php'" class="btn btn-primary">EDIT PROFILE</button>
		<button onclick="firebaseAccountSignOut()" class="btn btn-primary">SIGN OUT</button>
	</div>
</div>
<!-- <?php //include("includes/design-top.php");?>
<?php //include("includes/navigation.php");?> -->
<div class="container">

</div>

<div class="container" id="nav-card-content">
	<div class="card-group">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">See your patients' messages</h5>
			<p class="card-text">Check the latest notes from your patients.</p>
		</div>
		<div class="card-footer">
			<button type="submit" onclick="window.location.href='message.php'" class="btn btn-primary">Messages</button>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Check your patients' test results</h5>
			<p class="card-text">View the latest BRAIN Test and Tremor test results from your patients.</p>
		</div>
		<div class="card-footer">
			<button  type="submit" onclick="window.location.href='tests.php'" class="btn btn-primary">Tests</button>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Search Patient Directory</h5>
			<p class="card-text">See all the patients using PAPER PLANE</p>
		</div>
		<div class="card-footer">
			<button  type="submit" onclick="window.location.href='search.php'" class="btn btn-primary">Search</button>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">View Patient Profile</h5>
			<p class="card-text">See patients information</p>
		</div>
		<div class="card-footer">
			<button type="submit" onclick="window.location.href='patient-profile.php'" class="btn btn-primary">Profiles</button>
		</div>
	</div>

	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>