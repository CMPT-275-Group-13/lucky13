<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
<!DOCTYPE html>
<html>
<head>
	<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-firestore.js"></script>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
	<link rel="stylesheet" type="text/css" href="includes/main.css"/>	

	<!--Bootstrap stuff-->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</head>
<body>

<div class="jumbotron">
	<div></div>
</div>
<div class="container">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a class="">Home</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link">About Us</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link">Profile</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link">Search</a>
	  </li>
	</ul>
</div>

<div class="container" id="main-content">
	<div>
		<div class="container">
				<h2>B.R.A.I.N Test Results</h2>
				<div class="panel-group" id="accordion">
				  <div class="panel panel-default">
					<div class="panel-heading">
					  <h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" id="date1"></a>
					  </h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in" aria-expanded="true">
					  <div class="panel-body">
						<ul class="list-group">
							<li class="list-group-item" style="list-style-type:none">
								<b>Akinesia Score:</b>
								<span id="akinesia-score-1"></span>
							</li>
							<li class="list-group-item">
								<b>Dysmetria Score:</b>
								<span id="dysmetria-score-1"></span>
							</li>
							<li class="list-group-item">
								<b>Incordination Score:</b>
								<span id="incordination-score-1"></span>
							</li>
							<li class="list-group-item">
								<b>Kinesia Score:</b>
								<span id="kinesia-score-1"></span>
							</li>
							<li class="list-group-item">
								<b>Hand Tested:</b>
								<span id="hand-test-1"></span>
							</li>
						</ul>
					</div>
					</div>
				  </div>
				  <div class="panel panel-default">
					<div class="panel-heading">
					  <h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2" id="date2"></a>
					  </h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
					  <div class="panel-body">
						  <ul class="list-group" style="list-style-type:none">
							<li class="list-group-item">
								<b>Akinesia Score:</b>
								<span id="akinesia-score-2"></span>
							</li>
							<li class="list-group-item">
									<b>Dysmetria Score:</b>
									<span id="dysmetria-score-2"></span>
								</li>
								<li class="list-group-item">
									<b>Incordination Score:</b>
									<span id="incordination-score-2"></span>
								</li>
								<li class="list-group-item">
									<b>Kinesia Score:</b>
									<span id="kinesia-score-2"></span>
								</li>
								<li class="list-group-item">
									<b>Hand Tested:</b>
									<span id="hand-test-2"></span>
								</li>
						</ul>
						</div>
				  	</div>
				  <div class="panel panel-default">
					<div class="panel-heading">
					  <h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse3" id="date3"></a>
					  </h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
					  <div class="panel-body"><ul class="list-group">
							<li class="list-group-item">
								<b>Akinesia Score:</b>
								<span id="akinesia-score-3"></span>
							</li>
							<li class="list-group-item">
									<b>Dysmetria Score:</b>
									<span id="dysmetria-score-3"></span>
								</li>
								<li class="list-group-item">
									<b>Incordination Score:</b>
									<span id="incordination-score-3"></span>
								</li>
								<li class="list-group-item">
									<b>Kinesia Score:</b>
									<span id="kinesia-score-3"></span>
								</li>
								<li class="list-group-item">
									<b>Hand Tested:</b>
									<span id="hand-test-3"></span>
								</li>
						</ul>
					</div>
					</div>
				  </div>
				</div> 
			<!-- Content here -->

		  </div>
	</div>
</div>

<div class="footer" id="footer">
	<div class="" id="footer-line">
		<span id="site-map"><a href="">Site Map</a></span>
		<span id="copyright">&copy;2019 CMPT 275 Lucky13</span>
	</div>
</div>

<script src="./config.js"></script>
<script src="./brain-test-results.js"></script>
</body>
</html>
</div>

<?php include("includes/footer.php");?>

</body>
</html>