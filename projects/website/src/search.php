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
			<div class="container">
				<div>
					<input type="textbox" name="first-name" <?php print 'value="' . $firstNameFilter . '"'; ?> />
				</div>
			</div>
			<div class="container">
				<div>
					<input type="textbox" name="last-name" <?php print 'value="' . $lastNameFilter . '"'; ?> />
				</div>
			</div>
			<div class="container">
				<div>
					<div>
						<span>Paired?</span>
					</div>
					<input type="checkbox" name="paired-to-patient" <?php if (isset($pairedDoctorToPatientFilter) && $pairedDoctorToPatientFilter) {print("checked");} ?> />
				</div>
			</div>
			<div class="container">
				<div>
					<input type="submit" name="search-filter-submit" value="Filter"/>
				</div>
			</div>
			<div class="container">
				<div>
					<input type="reset" name="reset-filter" value="Reset"/>
				</div>
			</div>
		</form>
	</div>
	<div class="container" id="search-results">
		<div>
			<?php foreach ($searchResults as $searchResultIndex => $searchResult): ?>
				<div>
					<span><?php print $searchResultIndex; ?></span>
				</div>
				<div>
					<?php // Needs work ?>
				</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>