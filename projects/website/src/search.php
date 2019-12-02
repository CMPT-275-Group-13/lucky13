<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<title id="titleSearchPage">Search Patients</title>
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
					
					<div>
						<div>
							<label><h1>Username</h1></label>
						</div>
						<input class="form-control" type="textbox" name="username" id="inputSearch"/>
					</div>
            	</div>
			</div>
			<div class="container">
				<div>
					<button class="btn btn-primary" type="button" data-toggle="collapse" aria-expanded="false" aria-controls="collapseExample" id="searchButton"> 
						Search
					</button>
				</div>
			</div>

			<div class="containter" id="results-content">

						<div class="panel-group">
								<div class="searchResults"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script src="includes/javascript/search.js"></script>
<?php include("includes/footer.php");?>

</body>
</html>