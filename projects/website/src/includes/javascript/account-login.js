var provider = new firebase.auth.GoogleAuthProvider();

function googleSignin() {
	$("#login-status").text();
	$("#login-status").hide();

	firebase.auth().signInWithPopup(provider).then(function(result) {
	  var token = result.credential.accessToken;
	  var user = result.user;

	  console.log(token)
	  console.log(user)
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

// Only when document is ready
$(document).ready(function() {
	$("#login-status").text();
	$("#login-status").hide();

	$("#login-btn").click(function() {
		$("#login-status").text();
		$("#login-status").hide();

		var email = $("input#email").val();
		var password = $("input#password").val();

		if (!validateEmail(email)) {
			$("#login-status").show();
			$("#login-status").text("Invalid email address format");
		}

		else if (!validatePassword(password)) {
			$("#login-status").show();
			$("#login-status").text("Invalid password");
		}

		else {
			firebase.auth().setPersistence(firebase.auth.Auth.Persistence.SESSION).then(function() {
				// Existing and future Auth states are now persisted in the current
				// session only. Closing the window would clear any existing state even
				// if a user forgets to sign out.
				// ...
				// New sign-in will be persisted with session persistence.
				return firebase.auth().signInWithEmailAndPassword(email, password);
			})
			.catch(function(error) {
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
		var dataString = 'email=' + email + '&password=' + password;
		console.log(dataString);
		redirectToIndexPage();

		return false;
	});
});
