<?php include("includes/config.php");?>
<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php //include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div>
		Welcome <?php echo $_POST["username"]; ?><br>
Your email address is: <?php echo $_POST["password"]; ?>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>