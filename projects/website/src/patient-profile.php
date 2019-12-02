<?php include("includes/config.php");?>
<?php require_once("includes/helper.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titlePatientProfile">Patient Profile</title>
	<?php include("includes/head-tag-contents.php");?>
	<script type="application/javascript" src="includes/javascript/patient-profile.js"></script>
	<link rel="stylesheet" type="text/css" href="includes/styling/patient-profile.css">
</head>
<body>
<?php include("includes/navigation.php");?>
<div class="hero-image" style="background-color:#9ec7d2" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/patient-profile-header.png">
</div>


<div class="container" id="main-content">
	<div>
		<div class="accordion" id="accordionExample">
  			<div class="card">
   				<div class="card-header" id="headingOne">
     	 			<h2 class="mb-0">
        				<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="collapsible">
							PROFILE
        				</button>
      				</h2>
    			</div>

   			 <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      			<div class="card-body">
			  		<span id="profile-first-name"></span> <span id="profile-last-name"></span> 
				<p id="profile-email"></p>
				<p id="profile-phone"></p>
				<p><button class="btn btn-default btn-primary" id="patient-assignment-toggle">Toggle</p>
				</div>
     		 </div>
    	</div>
  	</div>
  	<div class="card">
    	<div class="card-header" id="headingTwo">
      		<h2 class="mb-0">
        		<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsible">
					TREMOR TEST
        		</button>
      		</h2>
    	</div>
    		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      		<div class="card-body">
			  	View Patient's Tremor Test results
			<p> <span id="profile-tremor-test-result" class="btnLinks">Tremor Test</button></p>
      		</div>
    	</div>
  	</div>
  	<div class="card">
    	<div class="card-header" id="headingThree">
      		<h2 class="mb-0">
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				B.R.A.I.N TEST
        	</button>
      	</h2>
    	</div>
    	<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      		<div class="card-body">
			  View Patient's Bradykinesia Akinesia Incoordination Test results
			<span id="profile-brain-test-result" class="btnLinks">B.R.A.I.N Test</span>
      		</div>
    	</div>
  	</div>

	  <div class="card">
    	<div class="card-header" id="headingFour">
      		<h2 class="mb-0">
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="collapsible">
				MEDICATION
        	</button>
      	</h2>
    	</div>
    	<div id="collapseFour" class="collapse" aria-labelledby="collapseFour" data-parent="#accordionExample">
      		<div class="card-body">
			  Schedule Your Patient's medication
			  <span id="profile-medication" class="btnLinks">Medication Schedule</span>
      		</div>
		</div>
		
		<div class="card">
    	<div class="card-header" id="headingFive">
      		<h2 class="mb-0">
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				MESSAGES
        	</button>
      	</h2>
    	</div>
    	<div id="collapseFive" class="collapse" aria-labelledby="collapseFive" data-parent="#accordionExample">
      		<div class="card-body">
			  View Patient's messages and send messages to your patient
			  <span id="profile-message" class="btnLinks">Message/span>
      		</div>
    	</div>
  	</div>
	</div>
		<!-- <div class="" id="profile">
			<div>
				<h2>Profile</h1>
			</div>
			<div id="profile-email"></div>
			<div id="profile-name">
				<span id="profile-first-name"></span> <span id="profile-last-name"></span> 
			</div>
			<div id="profile-phone"></div>
		</div>
	</div>

	<div>
		<div id="profile-test-results">
			<div id="profile-test-results-header">
				 <h2>Test Results</h2> -->
			<!-- </div>
			
			<div id="profile-test-results">
				<div id="profile-brain-test-result"></div>
				<div id="profile-tremor-test-result"></div>
			</div>
		</div>
	</div>

	<div>
		<div id="profile-medication">
		</div>
	</div> -->

	<!-- <div>
		<div id="profile-message"></div>
	</div>  -->

	<div>
		<button id="patient-assignment"></button>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>
