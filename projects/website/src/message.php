<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleMessagePage">Messages</title>
	<?php include("includes/head-tag-contents.php");?>
	<link rel="stylesheet" type="text/css" href="includes/styling/message.css">
</head>
<body style="background-color:#a7ced9;">
<?php include("includes/design-top.php");?>

<?php include("includes/navigation.php");?>




<div class="container" id="main-content">
	<div>
		<div></div>
	</div>
	<div>
		<div>
			<form action="" method="POST">
				<div>
					<div class="card" id="messageCard">
						<h1 class="card-header" id="messageTitle"></h1>
						<div class="card-body">
							<div id="messages"></div>
						</div>
						<div class="card-footer">
							<div>
								<input id="doctor-message" type="textarea" name="message"/>
								<button id="message-btn" class="btn btn-default btn-primary">Send</button>
							</div>
								
						</div>
					</div>
				</div>
				
				
			</form>
		</div>
	</div>
</div>


<script src="includes/javascript/message.js" text="text/javascript"></script>

</body>
</html>