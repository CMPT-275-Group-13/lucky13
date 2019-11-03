<?php include("includes/helper.php");?>
<?php include("includes/config.php");?>
<?php $searchResults = []; ?>
<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
<?php include("includes/navigation.php");?>

<div class="container" id="main-content">
	<div class="container" id="search-filter-form">
		<form action="" method="_GET">
			<div class="container">
				<div>
					<input type="textbox" name="first-name"/>
				</div>
			</div>
			<div class="container">
				<div>
					<input type="textbox" name="last-name"/>
				</div>
			</div>
			<div class="container">
				<div>
					<input type="textbox" name="first-name"/>
				</div>
			</div>
			<div class="container">
				<div>
					<input type="submit" name="search-filter-submit" value="filter"/>
				</div>
			</div>
		</form>
	</div>
	<div class="container" id="search-results">
		<div>
			<?php foreach ($searchResults as $searchResultIndex => $searchResult): ?>
				<div>
					<span><?php print $searchResultIndex; ?></span>
				</div>
				<div>
					<?php // Needs work ?>
				</div>
			<?php endforeach; ?>
		</div>
	</div>
</div>

<?php include("includes/footer.php");?>

</body>
</html>