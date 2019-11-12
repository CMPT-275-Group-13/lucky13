var provider = new firebase.auth.GoogleAuthProvider();

function googleSignin() {
	firebase.auth().signInWithPopup(provider).then(function(result) {
	  var token = result.credential.accessToken;
	  var user = result.user;

	  console.log(token)
	  console.log(user)
	}).catch(function(error) {
	  var errorCode = error.code;
	  var errorMessage = error.message;

	  console.log(error.code)
	  console.log(error.message)
	});
}

function googleSignout() {
	firebase.auth().signOut().then(function() {
	  console.log('Signout Succesfull')
	}, function(error) {
	  console.log('Signout Failed')  
	});
}

// Only when document is ready
$(document).ready(function(){
	$("#login-btn").click(function() {
		var loginSuccess = false;

		var email = $("input#email").val();
		var password = $("input#password").val();

		if (validateEmail(email) && validatePassword(password)) {
			
			firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
				// Handle Errors here.
				var errorCode = error.code;
				var errorMessage = error.message;
				console.log('Error Code: ' + error.code);
				console.log('Error Message: ' + error.message);
				loginSuccess = true;
			});
		}

		else {
			console.log('failure');
		}

		var dataString = 'email=' + email + '&password=' + password;
		console.log(dataString);
		return false;
	});
});
