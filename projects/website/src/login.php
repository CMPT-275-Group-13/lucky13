<?php require_once("includes/helper.php");?>
<?php include("includes/config.php");?>

<!DOCTYPE html>
<html>
<head>
	<?php include("includes/head-tag-contents.php");?>
</head>
<body>

<?php include("includes/design-top.php");?>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
                  <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form class="form-signin">
                      <div class="form-label-group">
                        <input type="email" id="email" class="form-control" placeholder="Email address" required autofocus>
                        <label for="inputEmail">Email address</label>
                      </div>
        
                      <div class="form-label-group">
                        <input type="password" id="password" class="form-control" placeholder="Password" required>
                        <label for="inputPassword">Password</label>
                      </div>
        
                      <div class="custom-control custom-checkbox mb-3">
                        <input type="checkbox" class="custom-control-input" id="customCheck1">
                        <label class="custom-control-label" for="customCheck1">Remember password</label>
                      </div>
                      <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" id="login-btn">Sign in</button>
                      <hr class="my-4">
                      <button onclick="googleSignin()" class="btn btn-block btn-social btn-google" type="submit">
                        <i class="fab fa-google"></i> Sign in with Google</button>
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