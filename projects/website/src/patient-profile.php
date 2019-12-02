<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titlePatientProfile">Patient List</title>
	<?php include("includes/head-tag-contents.php");?>
	<script type="application/javascript" src="includes/javascript/patient-profile.js"></script>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div class="" id="profile">
			<div>
				<h2>Patient Profile</h1>
			</div>
			<div id="profile-email"></div>
			<div id="profile-name">
				<span id="profile-first-name"></span> <span id="profile-last-name"></span> 
			</div>
			<div id="profile-phone"></div>
		</div>
	</div>

	<div>
		<div>
			<h2>Test Results</h2>
			<div id="profile-test-results">
				<div id="profile-brain-test-result"></div>
				<div id="profile-tremor-test-result"></div>
			</div>
		</div>
	</div>

	<div>
		<div>
			<h2>Message Patient</h2>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>
