<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleTestsPage">Browse Tests</title>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div class="card">
  		<div class="card-header">
    		<h3 id="name"></h3>
  		</div>
  		<div class="card-body">
    		<button type="submit" class="btn btn-primary" id="btnBrainTest">B.R.A.I.N Test</button>
			<button type="submit" class="btn btn-primary" id="btnTremorTest">Tremor Test</button>
  		</div>
	</div>
	<!-- <div>
		<a href="brain-test-results.php"><p>B.R.A.I.N Test Result</p></a>
	</div>
	<div>
		<a href=""><p>Tremor Test Result</p></a>
	</div> -->
</div>

<?php include("includes/footer.php");?>
<script src="includes/javascript/test.js"></script>

</body>
</html>