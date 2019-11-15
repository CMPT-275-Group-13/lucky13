// Only when document is ready
$(document).ready(function(){
	$("#register-status").text();
	$("#register-status").hide();

	$("#register-btn").click(function() {
		$("#register-status").text();
		$("#register-status").hide();

		var email = $("input#email").val();
		var password = $("input#password").val();

		if (!validateEmail(email)) {
			$("#register-status").show();
			$("#register-status").text("Invalid email address format");
		}

		else if (!validatePassword(password)) {
			$("#register-status").show();
			$("#register-status").text("Invalid password");
		}

		else {
			firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
				// Handle Errors here.
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
