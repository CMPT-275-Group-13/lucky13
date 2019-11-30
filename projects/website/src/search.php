<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleSearchPage">Search Patients</title>
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
					<span id = "details"></span><p></p>
					<?php //$patientUrl = 'patient-profile.php?patient-id=' . urlencode("csmith"); ?>
					<?php $patientUrl = 'patient-profile.php'; // Placeholder for now ?>
					<div style="cursor: pointer;" onclick="window.location='<?php print $patientUrl; ?>'">
						<div id = "results"></div>
					</div>
					<div>
						<div>
							<label><h1>Username</h1></label>
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
</div>

<script src="includes/javascript/search.js"></script>
<?php include("includes/footer.php");?>

</body>
</html>