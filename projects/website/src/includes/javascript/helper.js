/**
 * helper.js
 *
 * Collection of helper functions
 */

 /**
 * Returns true if it is a valid email. Return false otherwise
 * @param {string} email
 */
function validateEmail(email) {
   atpos = email.indexOf("@");
   dotpos = email.lastIndexOf(".");

   // Check that it is a valid email
   if (atpos < 1 || ( dotpos - atpos < 2 )) {
      return false;
   }

   return true;
}

/**
 * Returns true if it is a valid password. Return false otherwise
 * @param {string} password 
 */
function validatePassword(password) {
   // Needs work
   return true;
}

/**
 *  Returns a valid string of the input. Otherwise, returns ''.
 * @param {variable} input 
 */
function validateString(input) {
	var result = '';

	if (!input) {
		return result;
	}

	if (typeof(input) == 'string') {
		result = input;
	}

	if (typeof(input) == 'number') {
		result = input.toString();
	}

	return result;
}

/**
 * Redirect page based on path using the method
 * @param {*} path - Defaults at 'index.php'
 * @param {*} method - Default method is 'replace'
 */
function redirectPath(path="index.php", method="replace") {
	console.log("Path: " + path);
	switch(method) {
		case "href":
		case "assign":		
			window.location.assign(path);
			break;
		default:
			console.log("Default redirection");
		case "replace":
			window.location.replace(path);
			break;
	}

	return false; // should not be called
}

/**
 * Convert date object to a valid timestamp
 * @param {date.date} date 
 */
function convertDateToTimestamp(date) {
	var year = String(date.getFullYear());
	var month = String(date.getMonth());
	var day = String(date.getDate());
	var hours = String(date.getHours());
	var minutes = String("0" + date.getMinutes());
	var seconds = String("0" + date.getSeconds());
	// var milliseconds = String(date.getMilliseconds());

	var result = year + month + day + hours + minutes + seconds;
	return result;
}

// function getURLParameters(){
// 	var urlParams = new URLSearchParams(window.location.search);
// 	return urlParams.get('index');
// }