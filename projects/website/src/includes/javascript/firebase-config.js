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
firebase.analytics();

// Check Authentication State
function checkUserAuthentication() {
  firebase.auth().onAuthStateChanged(function(user) {
    // User is sign in
    if (user) {
      console.log("Signed in");
      return true;
    }

    // User is signed out.
    else {
      console.log("Signed out");
      return false;
    }
  }, function(error) {
    console.log(error);
  });
};

function redirectToSignIn() {
  var currentPathName = window.location.pathname;
  console.log("Checking if redirect to SignIn page is valid");
  console.log("Current Location: " + currentPathName);

  // User is not signed in or creating an account
  if (!checkUserAuthentication() && 
    !currentPathName.includes("login.php") && 
    !currentPathName.includes("register.php")) {
    console.log("Redirect to login.php");       
    window.location.replace("login.php");
  }
}

function redirectToIndexPage() {
  var currentPathName = window.location.pathname;
  console.log("Checking if redirect to Index page is valid");
  console.log("Current Location: " + currentPathName);

  if (checkUserAuthentication() && 
    !currentPathName.includes("index.php")) {
    console.log("Redirect to index.php");       
    window.location.replace("index.php");
  }
}

function accountSignOut() {
  firebase.auth().signOut().then(function() {
    console.log('Signout Succesfull')
  }, function(error) {
    console.log('Signout Failed')  
  });
}
