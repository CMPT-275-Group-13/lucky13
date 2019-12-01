/**
 *  index.js
 */

$(document).ready(function() {
    firebaseCheckAuthState();
    var userEmail = firebaseGetUserEmail();

    if (userEmail) {
        var db = firebase.firestore();
        var welcomeMessage = document.querySelector("#welcomeMessage");
        var docRef = db.collection('doctors');

        docRef.doc(userEmail).get(function(querySnapshot) {
            var welcomeMessageStr = '';
    
            if (!querySnapshot.empty) {
                var docs = querySnapshot.docs[0].data();
               
                var title = '';
                var firstName = '';
                var lastName = '';
    
                if (docs.title) {
                    title = docs.title;
                }
                if (docs.firstName) {
                    firstName = docs.firstName;
                    console.log("Doctor's first name: " + firstName);
                }
                if (docs.lastName) {
                    lastName = docs.lastName;
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
});
