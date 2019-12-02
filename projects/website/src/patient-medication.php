<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titlePatientProfile">Patient Medication Schedule</title>
	<?php include("includes/head-tag-contents.php");?>
	<script type="application/javascript" src="includes/javascript/patient-medication.js"></script>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		<div id="medication-list">
			
		</div>
		<div>
			<form class="form-create-new-medication" action="" method="POST">
				<div class="form-label-group">
					<select name="medication-frequency" id="medication-frequency">
						<option name="daily">Daily</option>
					</select>
				</div>
				<div class="form-label-group">
					<label for="medication-name">Medication Name</label>
					<input type="medication-name" id="medication-name" class="form-control" placeholder="Medication Name" required autofocus>
				</div>
				<div class="form-label-group">
					<label for="medication-amount">Amount</label>
					<input type="medication-amount" id="medication-amount" class="form-control" placeholder="Medication Amount" required>
				</div>
				<div class="form-label-group">
					<label for="medication-time">Time</label>
					<input type="medication-time" id="medication-time" class="form-control" placeholder="Medication Time" required>
				</div>
				<button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="create-medication-btn">Create</button>
			</form>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>
