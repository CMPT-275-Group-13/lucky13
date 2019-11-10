// Your web app's Firebase configuration
var firebaseConfig = {
	apiKey: "AIzaSyBNCdpINk9W4oS5S4ehXxB8PiCKJZbed28",
	authDomain: "lucky13-aa2b6.firebaseapp.com",
	databaseURL: "https://lucky13-aa2b6.firebaseio.com",
	projectId: "lucky13-aa2b6",
	storageBucket: "lucky13-aa2b6.appspot.com",
	messagingSenderId: "966137780544",
	appId: "1:966137780544:web:e47f06392c5ff59ab042a5",
	measurementId: "G-LB5N6B52DP"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
// firebase.analytics();


// buttonSignIn.addEventListener("click", function() {
//     // console.log(username.value);
//     // const docRef = firestore.doc("/doctors/jdoe");

    
//     // docRef.get().then(function(doc){
//     //     if(doc && doc.exists){
//     //         const myData = doc.data();
//     //         Console.log(doc.firstName);
//     //     }
//     // });

//     if(username.value === "jdoe" && password.value === "t3st0rder"){
//         console.log("Good Job");
//         location.href = "profile.html";
//     }
// });


// FirebaseUI config.
  var uiConfig = {
    signInSuccessUrl: 'landing.php',
    signInOptions: [
      // Leave the lines as is for the providers you want to offer your users.
      firebase.auth.GoogleAuthProvider.PROVIDER_ID,
      firebase.auth.FacebookAuthProvider.PROVIDER_ID,
      firebase.auth.TwitterAuthProvider.PROVIDER_ID,
      firebase.auth.GithubAuthProvider.PROVIDER_ID,
      firebase.auth.EmailAuthProvider.PROVIDER_ID,
      firebase.auth.PhoneAuthProvider.PROVIDER_ID,
      firebaseui.auth.AnonymousAuthProvider.PROVIDER_ID
    ],
    // tosUrl and privacyPolicyUrl accept either url string or a callback
    // function.
    // Terms of service url/callback.
    tosUrl: '<your-tos-url>',
    // Privacy policy url/callback.
    privacyPolicyUrl: function() {
      window.location.assign('<your-privacy-policy-url>');
    }
  };

  // Initialize the FirebaseUI Widget using Firebase.
  var ui = new firebaseui.auth.AuthUI(firebase.auth());
  // The start method will wait until the DOM is loaded.
  ui.start('#firebaseui-auth-container', uiConfig);


// Check Authentication State
initApp = function() {
  firebase.auth().onAuthStateChanged(function(user) {
    if (user) {
      // User is signed in.
      var displayName = user.displayName;
      var email = user.email;
      var emailVerified = user.emailVerified;
      var photoURL = user.photoURL;
      var uid = user.uid;
      var phoneNumber = user.phoneNumber;
      var providerData = user.providerData;
      user.getIdToken().then(function(accessToken) {
        document.getElementById('sign-in-status').textContent = 'Signed in';
        document.getElementById('sign-in').textContent = 'Sign out';
        document.getElementById('account-details').textContent = JSON.stringify({
          displayName: displayName,
          email: email,
          emailVerified: emailVerified,
          phoneNumber: phoneNumber,
          photoURL: photoURL,
          uid: uid,
          accessToken: accessToken,
          providerData: providerData
        }, null, '  ');
      });
    } else {
      // User is signed out.
      document.getElementById('sign-in-status').textContent = 'Signed out';
      document.getElementById('sign-in').textContent = 'Sign in';
      document.getElementById('account-details').textContent = 'null';
    }
  }, function(error) {
    console.log(error);
  });
};

window.addEventListener('load', function() {
  initApp();
});
