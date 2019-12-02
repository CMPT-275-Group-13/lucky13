<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
	<title id="titleHomePage">Welcome Doctor!</title>
	<script type="application/javascript" src="includes/javascript/helper.js"></script>
	<script type="application/javascript" src="includes/javascript/index.js"></script>
</head>
<body>
<div class ="jumbotron jumbotron-fluid" style="background-color:#99cccc;">
	<div class="hero-image" style="background-color:#99cccc; font-family:Roboto; height:50%;">
		<div class="hero-text" style="text-align:center;">
			<h1 id="welcomeMessage" style="color:white"><h1>
			<button type="submit" onclick="window.location.href='profile.php'" class="btn btn-primary">EDIT PROFILE</button>
			<button onclick="firebaseAccountSignOut()" class="btn btn-primary">SIGN OUT</button>
		</div>
		
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
			<h5 class="card-title">Search Patient Directory</h5>
			<p class="card-text">See all the patients using PAPER PLANE</p>
		</div>
		<div class="card-footer">
			<button  type="submit" onclick="window.location.href='search.php'" class="btn btn-primary" id="btnSearch">Search</button>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">View Patient List</h5>
			<p class="card-text">See patients' information</p>
		</div>
		<div class="card-footer">
			<button type="submit" onclick="window.location.href='patient-list.php'" class="btn btn-primary" id="btnPatients">Patients</button>
		</div>
	</div>

	</div>
</div>

</body>
</html>
