function validateEmail(email) {
   atpos = email.indexOf("@");
   dotpos = email.lastIndexOf(".");

   // Check that it is a valid email
   if (atpos < 1 || ( dotpos - atpos < 2 )) {
      return false;
   }

   return true;
}

function validatePassword(password) {
   // Needs work
   return true;
}

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