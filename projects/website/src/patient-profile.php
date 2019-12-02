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
   				<div class="card-header z-depth-1 teal lighten-4" id="headingOne">
        			<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="collapsible">
						<h4 class="mb-0 text-center font-weight-bold">PROFILE</h4>
        				</button>
      				
    			</div>

   			 <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      			<div class="card-body">
			  		<span id="profile-first-name"></span> <span id="profile-last-name"></span> 
				<p id="profile-email"></p>
				<p id="profile-phone"></p>
				<button class="btn btn-default btn-primary" id="patient-assignment">Toggle
				</div>
     		 </div>
    	</div>
  	</div>
  	<div class="card">
    	<div class="card-header" id="headingTwo">
        		<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsible">
					<h4 class="mb-0 text-center font-weight-bold">TREMOR TEST</h4>

        		</button>
      	
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
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
				<h4 class="mb-0 text-center font-weight-bold">B.R.A.I.N Test</h4>
        	</button>
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
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" class="collapsible">
			<h4 class="mb-0 text-center font-weight-bold">PROFILE</h4>
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
        	<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
				<h4 class="mb-0 text-center font-weight-bold">MESSAGES</h4>
        	</button>
      	
    	</div>
    	<div id="collapseFive" class="collapse" aria-labelledby="collapseFive" data-parent="#accordionExample">
      		<div class="card-body">
			  View Patient's messages and send messages to your patient
			  <span id="profile-message" class="btnLinks">Message/span>
      		</div>
    	</div>
  	</div>
	</div>

</div>


</body>
</html>
