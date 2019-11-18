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
		<div></div>
	</div>
	<div>
		<div>
			<form action="" method="POST">
				<div>
					<h1>Messages from CSMTIH</h1>
					<div id="messages">
						
					</div>
				</div>
				<div>
					<input id="doctor-message" type="textarea" name="message"/>
				</div>
				<div>
					<button id="message-btn" class="btn btn-default">Send</button>
				</div>
			</form>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

<script src="includes/javascript/message.js" text="text/javascript"></script>

</body>
</html>