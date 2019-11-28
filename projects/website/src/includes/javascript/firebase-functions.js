/**
 * firebase-functions.js
 *
 * Main collection of firebase functions
 */
function firebaseCheckAuthState() {
	firebase.auth().onAuthStateChanged(function(user) {
		var currentPathName = location.pathname;

	  // User is signed in
	  if (user) {
		var user = firebase.auth().currentUser;
		//var uri = encodeURIComponent(user.uid);
		console.log("User is signed in");
		if (currentPathName.includes("register.php")){
			console.log(user.uid);
			redirectPath("index.php")
		  }
		  else if(currentPathName.includes("login.php")) {
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
  redirectPath("index.php");
}

function googleSignin() {
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

function firebaseResetUserPassword(emailAddress) {
	firebase.auth.sendPasswordResetEmail(emailAddress).then(function() {
	  // Email sent.
	}).catch(function(error) {
	  // An error happened.
	});
}

function firebaseGetUID(){
	var user = firebase.auth().currentUser;
	return user.uid;
}

