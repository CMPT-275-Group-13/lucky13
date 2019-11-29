var db = firebase.firestore();
var docRef = db.collection('doctors');
var patientRef = db.collection('patient');
const name = document.querySelector('#name');

var urlParams = new URLSearchParams(window.location.search);
var doctor = urlParams.get('index');
var patientURI = " ";

$(document).ready(function(){
    $("#btnBrainTest").click(function() {
        console.log("patient enconde " + patientURI);
        window.location.assign("brain-test-results.php?index=" + patientURI);
    });
    $("#btnTremorTest").click(function() {
        window.location.assign("tremor-test-results.php?index=" + patientURI);
    });
});

getPatientEmail = function(patient){
    patientRef.where(firebase.firestore.FieldPath.documentId(), '==', patient)
    .get().then(function(snapshot){
        var patientDocs = snapshot.docs[0].data();
        console.log(patientDocs.firstName);
        name.innerText = patientDocs.firstName + " " + patientDocs.lastName;
    });
}

getPatientInfo = function(){
    docRef.where("uid", "==", doctor)
    .get().then(function(querySnapshot){
        var patientArray = querySnapshot.docs[0].data().patient;
        for(i in patientArray){
            getPatientEmail(patientArray[i]);
            patientURI = encodeURIComponent(patientArray[i]);
            
        }

    });
    
}

getPatientInfo();