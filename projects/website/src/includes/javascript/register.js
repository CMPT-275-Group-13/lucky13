// Only when document is ready
$(document).ready(function(){
	$("#register-status").text();
	$("#register-status").hide();

	$("#register-btn").click(function() {
		$("#register-status").text();
		$("#register-status").hide();

		var email = jQueryReadValfromHTML("input#email");
		var password = jQueryReadValfromHTML("input#password");
		var firstName = jQueryReadValfromHTML("input#first-name");
		var lastName = jQueryReadValfromHTML("input#last-name");
		var phoneNumber = jQueryReadValfromHTML("input#phoneNumber");
		var userType = jQueryReadValfromHTML("select#userType");

		// Check email is a valid email
		if (!validateEmail(email)) {
			jQueryWriteTextToHTML("#register-status", "Invalid email address format");
		}
		// Check password is a valid password
		else if (!validatePassword(password)) {
			jQueryWriteTextToHTML("#register-status", "Invalid password");
		}

		else {
			firebase.auth().createUserWithEmailAndPassword(email, password).then(function success(userData) {
				var uid = userData.user.uid;

				// Create a doctor user account
				if (userType == "doctor") {
					firestoreCreateDoctor(email, firstName, lastName, uid, phoneNumber);
				}

				// Create a patient user account
				else {
					firestoreCreatePatient(email, firstName, lastName, uid, phoneNumber);
				}
				
				// Handle Errors here.
				}).catch(function(error) {
					//Error Handling
					var errorCode = error.code;
					var errorMessage = error.message;

					console.log('Error Code: ' + errorCode);
					console.log('Error Message: ' + errorMessage);

					if (errorCode) {
						jQueryWriteTextToHTML("#register-status", errorMessage);
				}
			});
		}
		return false;
	});
});
