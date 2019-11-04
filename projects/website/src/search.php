<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>
<?php

$firstNameFilter = '';
$lastNameFilter = '';

if (isset($_GET)) {
	if (isset($_GET['first-name'])) {
		$firstNameFilter = sanitiseUserInput($_GET['first-name']);
	}

	if (isset($_GET['last-name'])) {
		$lastNameFilter = sanitiseUserInput($_GET['last-name']);
	}

	if (isset($_GET['paired-to-patient'])) {
		$pairedDoctorToPatientFilter = True;
	}
}

// Grab stuff and place it into $searchResults
// Currently, we just have a placeholder
$searchResults = [
	// 0 => [
	// 	id => '276',
	// 	name => 'Herb',
	// ],
];

?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div class="container" id="search-filter-form">
		<form action="" method="_GET">
<!-- 			<div class="container">
				<div>
					<input type="textbox" name="first-name" <?php //print 'value="' . $firstNameFilter . '"'; ?> />
				</div>
			</div>
			<div class="container">
				<div>
					<input type="textbox" name="last-name" <?php //print 'value="' . $lastNameFilter . '"'; ?> />
				</div>
			</div> -->
			<div class="container">
<!-- 				<div>
					<div>
						<span>Paired?</span>
					</div>
					<input type="checkbox" name="paired-to-patient" <?php //if (isset($pairedDoctorToPatientFilter) && $pairedDoctorToPatientFilter) {print("checked");} ?> />
				</div> -->

				<div>
					<span id = "details"></span><p></p>
					<?php //$patientUrl = 'patient-profile.php?patient-id=' . urlencode("csmith"); ?>
					<?php $patientUrl = 'patient-profile.php'; // Placeholder for now ?>
					<div style="cursor: pointer;" onclick="window.location='<?php print $patientUrl; ?>'">
						<div id = "results"></div>
					</div>
					<div>
						<div>
							<label>Username</label>
						</div>
						<input class="form-control" type="textbox" name="username" id="inputSearch"/>
					</div>
            	</div>
			</div>
			<div class="container">
				<div>
					<button class="btn btn-primary" type="button" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" id="searchButton"> 
						Search
					</button>
				</div>
			</div>
		</form>
	</div>
<!-- 	<div class="container" id="search-results">
		<div>
			<?php //foreach ($searchResults as $searchResultIndex => $searchResult): ?>
				<div>
					<span><?php //print $searchResultIndex; ?></span>
				</div>
				<div>
					
					<div style="cursor: pointer;" onclick="window.location='<?php //print $patientUrl; ?>'">
						<div>
							<?php // show patient's image ?>
						</div>
						<div>
							<?php //print($searchResult['name']); ?>
						</div>
					</div>
				</div>
			<?php //endforeach; ?>
		</div>
	</div> -->
</div>

<script src="includes/javascript/search.js"></script>
<?php include("includes/footer.php");?>

</body>
</html>