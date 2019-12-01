// Only when document is ready
$(document).ready(function(){
	$("#register-status").text();
	$("#register-status").hide();

	$("#register-btn").click(function() {
		$("#register-status").text();
		$("#register-status").hide();

		var email = $("input#email").val();
		var password = $("input#password").val();
		var firstName = $("input#first-name").val();
		var lastName = $("input#last-name").val();
		var phoneNumber = $("input#phoneNumber").val();
		var userType = $("select#userType").val();

		// Check email is a valid email
		if (!validateEmail(email)) {
			$("#register-status").show();
			$("#register-status").text("Invalid email address format");
		}
		// Check password is a valid password
		else if (!validatePassword(password)) {
			$("#register-status").show();
			$("#register-status").text("Invalid password");
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
						$("#register-status").show();
						$("#register-status").text(errorMessage);
				}
			});
		}
		return false;
	});
});
