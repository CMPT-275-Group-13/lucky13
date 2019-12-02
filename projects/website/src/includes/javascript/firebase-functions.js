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
		return validateString(user.email);
	}
	console.log("ERROR! Unable to find user!");	
	return null;
}

/**
 * Creates a new record of medication
 * @param {str} patientEmail - Patient's email
 * @param {str} medicationFrequency - For now, daily
 * @param {str} medicationName - Medication Name
 * @param {str} medicationAmount - Medication Amount
 * @param {number} medicationTime - 24-hour format
 */
function firestoreCreateMedication(patientEmail, medicationFrequency, medicationName, medicationAmount, medicationTime) {
	var medicationType = '';
	var doctorFirstName = '';
	var doctorLastName = '';
	var db = firebase.firestore();

	switch(validateString(medicationFrequency)) {
		case 'daily':
		default:
			medicationType = 'dailyMedications';
			break;
	}

	firebase.auth().onAuthStateChanged(function(user) {	  
		if (user) {
			// Grab current user (doctor)
			var doctorEmail = firebaseGetUserEmail(user);
			var doctorRef = db.collection("doctors").doc(doctorEmail);
			doctorRef.get().then(function(doc) {
				if (doc.exists) {
					// Grab first name and last name
					var docData = doc.data();
					doctorFirstName = validateString(docData.firstName);
					doctorLastName = validateString(docData.lastName);
					
					// Create a new medication
					var medicationRef = db.collection("medication").doc(patientEmail).collection(medicationType).doc();
					medicationRef.set({
						amount: medicationAmount,
						name: medicationName,
						time: medicationTime,
						docFirstName: doctorFirstName,
						docLastName: doctorLastName,
						docEmail: doctorEmail,
						patientEmail: patientEmail
					})
					.then(function(docRef) {
						console.log("Document written with ID: ", docRef.id);
					})
					.catch(function(error) {
						console.error("Error adding document: ", error);
					});
				}
				else {
					// doc.data() will be undefined in this case
					console.log("No such document!");
				}
			}).catch(function(error) {
				console.log("Error getting document:", error);
			});
		}

		else {
			console.log("Error unable to find user!");
		}
	});
}
