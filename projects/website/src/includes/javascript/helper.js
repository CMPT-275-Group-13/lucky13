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
 * @param {string} path - Defaults at 'index.php'
 * @param {string} method - Default method is 'replace'
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

/**
 * Format unixtime into a date format
 * @param {number} unixTime - Time since 1970 in seconds
 */
function formatDateAndTime(unixTime) {
    var date = new Date(unixTime * 1000); //convert to datetime from unix
    
    //format date
    var d = date.getDate().toLocaleString();
    var m = (date.getMonth() + 1).toLocaleString();
    var yyyy  = date.getFullYear().toLocaleString();

    //format time
    var hh = date.getHours().toLocaleString();
    var mm = date.getMinutes().toLocaleString();
    var ss = date.getSeconds().toLocaleString();

    yyyy = yyyy.replace(/,/g, "");
    return yyyy + "-" + m + "-" + d + " " + hh + ":" + mm + ":" + ss;
}

/**
 * Grab the parameters from the URL.
 */
function getURLParameters() {
	var urlParams = new URLSearchParams(window.location.search);
	return urlParams;
}
