<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleTremorTests">Tremor Test</title>
	<?php include("includes/head-tag-contents.php");?>
	<script src="includes/packages/node_modules/moment/moment.js" type="text/javascript"></script>
	<script src="includes/packages/node_modules/chart.js/dist/Chart.js" type="text/javascript"></script>
	<script src="includes/packages/node_modules/chart.js/dist/Chart.min.js" type="text/javascript"></script>
	<scipt src="includes/javascript/helper.js" type="text/javascript"></script>


</head>
<body>

<?php include("includes/navigation.php");?>
<div class="hero-image" style="background-color:#9ec7d2" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/tremor-test-header.png">
</div>

<div class="container" id="main-content">
	<div class="card">
		<div class="card-body">
		<h3 class="card-title" id="tremorTitle"></h3>
			<p class="card-text">The Tremor test measures the resting tremors of a PD patient. This is conducted through our companion iOS app, using the 
				iPhone's built-in gyroscope feature. From the test, the standard deviation of the x,y,z coordinates are calculated. The plot below
				shows the five most recent tests.
			</p>
		</div>
	</div>
	
	<div class="card" id="tremor-results">
		<canvas id="tremorChart"></canvas>
	<div>
</div>
<script src="includes/javascript/tremor-test-results.js" text=application/javascript></script>


</body>
</html>