<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleTremorTests"></title>
	<?php include("includes/head-tag-contents.php");?>
	<script src="includes/packages/node_modules/moment/moment.js" type="text/javascript"></script>
	<script src="includes/packages/node_modules/chart.js/dist/Chart.js" type="text/javascript"></script>
	<script src="includes/packages/node_modules/chart.js/dist/Chart.min.js" type="text/javascript"></script>
	<scipt src="includes/javascript/helper.js" type="text/javascript"></script>


</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<h3 id="tremorTitle"></h3>
	<p><h6> The plot shows the standard deviations of the x-y-x coordinates taken from
		the last five tests on an iPhone gyroscope. </h6> 
	</p>
	<div class="jumbotron" id="tremor-results">
		<canvas id="tremorChart"></canvas>
	<div>
</div>

<?php include("includes/footer.php");?>
<script src="includes/javascript/tremor-test-results.js"></script>

</body>
</html>