var db = firebase.firestore();
var welcomeMessage = document.querySelector("#welcomeMessage");
var docRef = db.collection('doctors');

displayWelcome = function() {
   var urlParams =  new URLSearchParams(window.location.search);
   console.log("URL " + urlParams);
   var user = urlParams.get('index');
   console.log(user);
   docRef.where("uid", "==", user)
    .get().then(function(querySnapshot) {
        var welcomeMessageStr = '';

        if (!querySnapshot.empty) {
            var docs = querySnapshot.docs[0].data();
           
            var title = ''
            var firstName = ''
            var lastName = ''

            if (docs.title) {
                title = docs.title
            }
            if (docs.firstName) {
                firstName = docs.firstName
                console.log("Doctor's first name: " + firstName);
            }
            if (docs.lastName) {
                lastName = docs.lastName
            }

            welcomeMessageStr = "Welcome " + title + " " + firstName + " " + lastName;
            welcomeMessageStr.trim();
            welcomeMessageStr += "!"
        }
        else{
            console.error("User does not exist");
            welcomeMessageStr = "Welcome Doctor!"
        }

        welcomeMessage.innerText = welcomeMessageStr
    });
}

displayWelcome();
