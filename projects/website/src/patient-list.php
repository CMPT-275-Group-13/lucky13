<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titlePatientProfile">Patient List</title>
	<?php include("includes/head-tag-contents.php");?>
	<script type="application/javascript" src="includes/javascript/patient-list.js"></script>
</head>
<body>

<?php include("includes/navigation.php");?>
<div class="hero-image" style="background-color:#9ec7d2" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/patient-list-header.png">
</div>

<div class="container" id="main-content">
	<div>
		<ul class="list-group">
			<div id="patient-profiles"></div>
		</ul>

	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>
