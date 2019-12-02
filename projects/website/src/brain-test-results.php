<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="brainTestResults">B.R.A.I.N Test</title>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/navigation.php");?>
<div class="hero-image" style="background-color:#9ec7d2" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/brain-test-header.png">
  <scipt src="includes/javascript/helper.js" type="text/javascript"></script>

</div>

<div class="container" id="main-content">
	<div>
		<div class="container">
				<div class="card">
					<div class="card-body">
					<h2 class="card-title" id="titleBrainTestResults"></h2>
					<p class="card-text">
						 B.R.A.I.N Test or Bradykinesia Akinesia Incoordination test measures the patient's response by performing
						 a series of alternating taps on our companion app. Below are the three most recent results from the B.R.A.I.N Test.
					</p>
						
					</div>
				</div>
				
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


<!-- <script src="./config.js"></script> -->
<script src="includes/javascript/brain-tests-results.js"></script>
</body>
</html>
</div>


</body>
</html>