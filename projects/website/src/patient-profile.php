<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

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
		<h3 id="patients"></h3>
		<span id = "details"></span>
			<p>
				<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#messageBody" aria-expanded="false" aria-controls="collapseExample">
					<span id="message"></span>  
					View Latest Note
				</button>
		  	</p>
		  		<div class="collapse" id="messageBody">
					<div class="card card-body">
						
					</div>
		  		</div>
			</div>
		</div>
	</div>
	<div>
		<!-- Chat with patient -->
	</div>
	<div>
		<!-- View Patient's Tests -->
	</div>
</div>

<?php include("includes/footer.php");?>

<script src="includes/javascript/patient-profile.js"></script>

</body>
</html>