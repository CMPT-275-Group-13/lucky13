<title><?php print $PAGE_TITLE;?></title>

<?php if ($CURRENT_PAGE == "Index") { ?>
	<meta name="description" content="" />
	<meta name="keywords" content="" /> 
<?php } ?>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/7.2.3/firebase-analytics.js"></script>

<script>
  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyBNCdpINk9W4oS5S4ehXxB8PiCKJZbed28",
    authDomain: "lucky13-aa2b6.firebaseapp.com",
    databaseURL: "https://lucky13-aa2b6.firebaseio.com",
    projectId: "lucky13-aa2b6",
    storageBucket: "lucky13-aa2b6.appspot.com",
    messagingSenderId: "966137780544",
    appId: "1:966137780544:web:e47f06392c5ff59ab042a5",
    measurementId: "G-LB5N6B52DP"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
</script>



<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
	#main-content {
		margin-top:20px;
	}
	.footer {
		font-size: 14px;
		text-align: center;
	}
</style>