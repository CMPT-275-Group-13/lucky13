<title><?php print $PAGE_TITLE;?></title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />

<?php if ($CURRENT_PAGE == "Index") { ?>
	<meta name="description" content="" />
	<meta name="keywords" content="" /> 
<?php } ?>

<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/ui/4.2.0/firebase-ui-auth.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gstatic.com/firebasejs/ui/4.2.0/firebase-ui-auth.css" />

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/7.3.0/firebase-firestore.js"></script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="includes/main.css"/>

<!-- Other Js libraries -->
<script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script type="application/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>
<script type="application/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- Website-Specific Js -->
<script type="application/javascript" src="includes/javascript/helper.js"></script>
<script type="application/javascript" src="includes/javascript/jquery-helper.js"></script>
<script type="application/javascript" src="includes/javascript/firebase-functions.js"></script>
<script type="application/javascript" src="includes/javascript/firebase-user.js"></script>
<script type="application/javascript" src="includes/javascript/firebase-config.js"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/validate.js/0.13.1/validate.min.js"></script> --> <!-- Needs work -->
<script type="application/javascript" src="includes/javascript/main.js"></script>

<!--assets-->
<link rel="icon" type="image/png" href ="images/assets/icon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

