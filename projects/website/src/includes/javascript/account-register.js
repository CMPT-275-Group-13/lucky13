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
		var title = $("input#title").val();

		if (!validateEmail(email)) {
			$("#register-status").show();
			$("#register-status").text("Invalid email address format");
		}

		else if (!validatePassword(password)) {
			$("#register-status").show();
			$("#register-status").text("Invalid password");
		}

		else {

			if (email == "qa.test2@gmail.com"){
				//this is a test email, don't add to DB
				console.log("test email");
				return true;
			}
		
			firebase.auth().createUserWithEmailAndPassword(email, password).then(function success(userData) {
				var uid = userData.user.uid;
				firestoreCreateUser(email, firstName, lastName, uid, phoneNumber, title);
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
