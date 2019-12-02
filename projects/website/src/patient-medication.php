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
<?php include("includes/navigation.php");?>
<div class="hero-image" style="background-color:#9ec7d2" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/medication-header.png">
</div>


<div class="container" id="main-content">
	<div>
		<div>
			<form class="form-create-new-medication" method="POST">
				<div class="form-label-group">
					<label for="medication-frequency">Medication Frequency</label>
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
			</form>
			<button class="btn btn-lg btn-primary btn-block text-uppercase" id="create-medication-btn" style="background-color:#66cccc">Create</button>
		</div>
		<p></p>
		<h2 class="text-center">LIST OF MEDICATION </h2>
		<div class="card-deck">
			 <p><span id="medication-list"></span></p>
			   
		</div>
	</div>
</div>

</body>
</html>
