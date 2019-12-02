/**
 * firebase-functions.js
 *
 * Main collection of firebase functions
 */

/**
 * Checks the auth state and initialises it. Will redirect page if needed
 */
function firebaseCheckAuthState() {
	firebase.auth().onAuthStateChanged(function(user) {
		var currentPathName = location.pathname;

		// User is signed in
		if (user) {
			var userEmail = firebaseGetUserEmail(user);
			var userType = '';

			// Check what user account type
			if (userEmail != null) {
				var db = firebase.firestore();
				var docRef = db.collection("doctors").doc(userEmail);

				// Check if registration
				docRef.get().then(function(doc) {
					docData = doc.data();
					// Doctor
					if (docData) {
						if (currentPathName.includes("register.php") || currentPathName.includes("patient-user.php")) {
							console.log("Doctor is signed in!");
							console.log(user.uid);
							redirectPath("index.php?index=" + user.uid);
						}
						else if (currentPathName.includes("login.php")) {
							console.log("Redirect to index.php");
							redirectPath("index.php?index=" + user.uid);    
						}
					}
					// Patient
					else {
						console.log("Patient is signed in!");

						// Redirect to patient user page if current page isn't
						if (!currentPathName.includes("patient-user.php")) {
							console.log("Patient is signed in!");
							console.log("Redirect to patient-user.php");
							redirectPath("patient-user.php"); 
						}
					}
				}).catch(function(error) {
					console.log(error);
				});
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

/**
 * Sign out the current user. Redirect to login page upon success
 */
function firebaseAccountSignOut() {
  firebase.auth().signOut().then(function() {
    console.log('Signout Succesfull');
  }, function(error) {
    console.log('Signout Failed');
  });
  redirectPath("login.php");
}

/**
 * Reset the user's email address
 * @param {string} emailAddress 
 */
function firebaseResetUserPassword(emailAddress) {
	firebase.auth.sendPasswordResetEmail(emailAddress).then(function() {
	  // Email sent.
	}).catch(function(error) {
	  // An error happened.
	});
}

/**
 * Login using your Google Account
 */
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
			jQueryWriteTextToHTML("#login-status", errorMessage);
		}
	});
}

/**
 * Returns the user's ID, based on firebase's user object
 * @param {firebase.user} user 
 */
function firebaseGetUID(user) {
	if (user != null) {
		return user.uid;
	}
	console.log("ERROR! Unable to find user!");
	return null;	
}

/**
 * Returns the user's email, based on firebase's user object
 * @param {firebase.user} user
 */
function firebaseGetUserEmail(user) {
	if (user != null) {
		return user.email;
	}
	console.log("ERROR! Unable to find user!");	
	return null;
}
