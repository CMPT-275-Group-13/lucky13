/**
 * firebase-functions.js
 *
 * Main collection of firebase functions
 */

// Checks the auth state and initialises it. Will redirect page if needed
function firebaseCheckAuthState() {
	firebase.auth().onAuthStateChanged(function(user) {
		var currentPathName = location.pathname;

		// User is signed in
		if (user) {
			console.log("User is signed in");
			if (currentPathName.includes("register.php")) {
				console.log(user.uid);
				redirectPath("index.php?index=" + user.uid);
			}
			else if (currentPathName.includes("login.php")) {
				console.log("Redirect to index.php");
				redirectPath("index.php?index=" + user.uid);    
			}
		}

		// User is signed out.
		else {
			console.log("User is signed out");
			if (!currentPathName.includes("login.php") && 
				!currentPathName.includes("register.php")) {
				console.log("Redirect to login.php");  
				redirectPath("login.php");
			}
		}
		}, function(error) {
		console.log(error);
	});
}

function firebaseAccountSignOut() {
  firebase.auth().signOut().then(function() {
    console.log('Signout Succesfull');
  }, function(error) {
    console.log('Signout Failed');
  });
  redirectPath("login.php");
}

function firebaseResetUserPassword(emailAddress) {
	firebase.auth.sendPasswordResetEmail(emailAddress).then(function() {
	  // Email sent.
	}).catch(function(error) {
	  // An error happened.
	});
}

function firebaseGoogleSignin() {
	$("#login-status").text();
	$("#login-status").hide();

	firebase.auth().signInWithPopup(provider).then(function(result) {
	  var token = result.credential.accessToken;
	  var user = result.user;

	  console.log(token);
	  console.log(user);
	}).catch(function(error) {
		// Handle Errors here.
		var errorCode = error.code;
		var errorMessage = error.message;
		console.log('Error Code: ' + errorCode);
		console.log('Error Message: ' + errorMessage);

		if (errorCode) {
			$("#login-status").show();
			$("#login-status").text(errorMessage);
		}
	});
}

function firebaseGetUID(user) {
	if (user != null) {
		return user.uid;
	}
	console.log("ERROR! Unable to find user!");
	return null;	
}

function firebaseGetUserEmail(user) {
	if (user != null) {
		return user.email;
	}
	console.log("ERROR! Unable to find user!");	
	return null;
}

function firebaseGetUserType(user) {
	// To-do: Get user type
}
