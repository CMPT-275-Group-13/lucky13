<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleTremorTests"></title>
	<?php include("includes/head-tag-contents.php");?>
	<script src="includes/packages/node_modules/moment/moment.js" type="text/javascript"></script>
	<script src="includes/packages/node_modules/chart.js/dist/Chart.js" type="text/javascript"></script>

</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<canvas id="tremorChart">
	</canvas>
</div>

<?php include("includes/footer.php");?>
<script src="includes/javascript/tremor-test-results.js"></script>

</body>
</html>