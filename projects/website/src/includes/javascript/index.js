

var db = firebase.firestore();
var welcomeMessage = document.querySelector("#welcomeMessage");
var docRef = db.collection('doctors');


displayWelcome = function(){
   var urlParams =  new URLSearchParams(window.location.search);
   console.log("URL " + urlParams);
   var user = urlParams.get('index');
   console.log(user);
   docRef.where("uid", "==", user)
    .get().then(function(querySnapshot) {
        if(!querySnapshot.empty){
            var docs = querySnapshot.docs[0].data();
            console.log("first name " + docs.firstName);
            welcomeMessage.innerText = "Welcome " + docs.title + " " + docs.firstName + " " + docs.lastName;
        }
        else{
            console.error("User does not exist");
        }
    });
}

displayWelcome();