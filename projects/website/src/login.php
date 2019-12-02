<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
  <title id="titleLoginPage">Welcome!</title>
  <link rel="stylesheet" type="text/css" href="includes/styling/login.css">
  <link rel="stylesheet" type="text/css" href="includes/packages/bootstrap/bootstrap-social.css">
	<?php include("includes/head-tag-contents.php");?>
</head>
<body style="background-color:#a7ced9">

<div class="containter" id="logo-content">
  <img class="img-fluid mx-auto d-block" src="images/assets/website-logo.png">
</div>
<!--login page modified using this template: https://startbootstrap.com/snippets/login/"-->
<div class="container">
  <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card card-signin my-5" id="signInCard">
        <div class="card-body">
          <h5 class="card-title text-center">Sign In</h5>
          <form class="form-signin">
            <div class="mb-3 form-label-group">
              <label for="email">Email address</label>
              <input type="email" id="email" class="form-control" placeholder="Email address" required autofocus>
              <small><span class="text-danger" id="email-status"></span></small> 
            </div>

            <div class="mb-3 form-label-group">
              <label for="password">Password</label>
              <input type="password" id="password" class="form-control" placeholder="Password" required>
              <small><span class="text-danger" id="password-status"></span></small> 
            </div>
            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="login-btn">Sign in</button>
            <hr class="my-4">
            <button onclick="firebaseGoogleSignin()" class="btn btn-block btn-social btn-google" type="submit">
              <i class="fa fa-google"></i> Sign in with Google</button>
            <div class="modal-footer">
              <div class="options text-center text-md-right mt-1">
                  Don't have an account? <a href="register.php" class="blue-text">Register</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
        

<?php include("includes/footer.php");?>

<script src="includes/javascript/account-login.js"></script>
</body>
</html>