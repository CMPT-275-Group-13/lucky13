<div class="container">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Index") {?>active<?php }?>" href="index.php" target="">Home</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Profile") {?>active<?php }?>" href="profile.php" target="">Profile</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Patient") {?>active<?php }?>" href="search.php" target="">Search</a>
	  </li>
	  <li class="nav-item">
	  	<?php $patientProfile = "patient-profile.php/";?>
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Patient Profile") {?>active<?php }?>" href="patient-profile.php" target="">Patient</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Patient Messaging") {?>active<?php }?>" href="message.php" target="">Message</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link <?php if ($CURRENT_PAGE == "Patient Tests") {?>active<?php }?>" href="tests.php" target="">Tests</a>
	  </li>
	  <li class="nav item">
	  	<a class="nav-link" onclick="firebaseAccountSignOut()" target="">Sign Out</a>
	  </li>

	  <li class="nav-item"><div id="sign-in-status"></div></li>
	  <li class="nav-item"><div id="sign-in"></div></li>
	  <li class="nav-item"><div id="account-details"></div></li>
	</ul>
</div>