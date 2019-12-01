/**
 *  index.js
 */

 /**
  * Display welcome message for the current user
  */ 
 function displayWelcomeMessage(user) {
    var userEmail = firebaseGetUserEmail(user);
    console.log(userEmail);

    if (userEmail) {
        var db = firebase.firestore();
        var welcomeMessage = document.querySelector("#welcomeMessage");
        var docRef = db.collection("doctors").doc(userEmail);

        docRef.get().then(function(doc) {
            var welcomeMessageStr = '';
            if (doc.exists) {
                docData = doc.data();
                var firstName = '';
                var lastName = '';
                var title = '';
    
                if (docData['title']) {
                    title = docData['title'];
                }
                if (docData['firstName']) {
                    firstName = docData['firstName'];
                    console.log("Doctor's first name: " + firstName);
                }
                if (docData['lastName']) {
                    lastName = docData['lastName'];
                }
    
                welcomeMessageStr = "Welcome " + title + " " + firstName + " " + lastName;
                welcomeMessageStr.trim();
                welcomeMessageStr += "!";
            }
            else {
                console.error("User does not exist");
                welcomeMessageStr = "Welcome Doctor!";
            }
    
            welcomeMessage.innerText = welcomeMessageStr;
        });
    }
    else {
        console.log("No value for user email!");
    }
 }

$(document).ready(function() {
    // Get the current user when it finishes initialisation
    firebase.auth().onAuthStateChanged(function(user) {
		// User is signed in
		if (user) {
            displayWelcomeMessage(user);
		}
	});
});
