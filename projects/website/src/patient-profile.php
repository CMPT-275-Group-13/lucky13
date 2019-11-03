<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

<?php

if (isset($_GET) && isset($_GET['patient-id'])) {
	$patientID = sanitiseUserInput($_GET['patient-id']);

	// TO-DO: From $patientID, get the patient information from database


	if (false) {
		// Unable to find requested patient-id.
		// Redirect back to search page
	}
}



<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<?php 

<?php var_dump($_GET); ?>

<div class="container" id="main-content">
	<div>
		<!-- Patient's Personal Info -->
	</div>
	<div>
		<!-- Chat with patient -->
	</div>
	<div>
		<!-- View Patient's Tests -->
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>