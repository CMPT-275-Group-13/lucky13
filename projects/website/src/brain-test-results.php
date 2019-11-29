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
	<div>
		<div class="container">
				<h2 id="titleBrainTestResults"></h2>
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

<!-- <script src="./config.js"></script> -->
<script src="includes/javascript/brain-tests-results.js"></script>
</body>
</html>
</div>

<?php include("includes/footer.php");?>

</body>
</html>