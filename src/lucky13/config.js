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
var firestore = firebase.firestore();

const docRef = firestore.doc("/doctors/soz17cW7ZfzeEgyny3h3");
const patientRef = firestore.doc("/patient/rgUuJGiHo6PWnktwd9PW");
const patient = document.querySelector("#patient1");
const patient2 = document.querySelector("#patient2");
const saveButton = document.querySelector("#saveButton");

// saveButton.addEventListener("click", function(){
//     const textToSave = inputTextField.value;
//     console.log("I am going to save " + textToSave + " to FireStore");
//     //set the collection so we don't have to worry about it
//     docRef.set({
//         hotDogStatus: textToSave  
//     }).then(function(){
//         console.log("Status saved!");
//     }).catch(function(error){
//         console.log("Got an error: ", error);
//     });
// })

// loadButton.addEventListener("click", function(){
//     docRef.get().then(function(doc){
//         if(doc && doc.exists){
//             const myData = doc.data();
//             outputHeader.innerText = "Hotdog status: " + myData.hotDogStatus;
//         }
//     }).catch(function(error) {
//         console.log("Got an error: ", error);
//     });
// });

getRealtimeUpdates = function(){
    docRef.onSnapshot(function(doc){
        if(doc && doc.exists) {
            const myData = doc.data();
            //const myPatient = firestore.doc("/patient/tuUosuerNtfNzOCksRj7");
            //console.log("Patient Name: " + myData.patient[0]);
            patient.innerText = "Name: " + myData.patient[0];
        }
    });

    patientRef.onSnapshot(function(doc){
        if(doc && doc.exists){{
            const myData = doc.data();
            patient2.innerText = "Email: " + myData.emailAddress + "\n" + "Phone Number: " + myData.phoneNumber;
            
        }}
    });
}
getRealtimeUpdates();
