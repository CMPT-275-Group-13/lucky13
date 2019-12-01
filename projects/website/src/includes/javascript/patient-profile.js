/**
 * patient-profile.js
 */
console.log("Ready");
$(document).ready(function() {
    console.log("Ready");
    firebase.auth().onAuthStateChanged(function(user) {
        console.log("Hello World");
        if (user) {
            console.log("Hello World");
            var db = firebase.firestore();
            var userEmail = firebaseGetUserEmail(user);
            var docRef = db.collection("doctors").doc(userEmail);

            // Grab all assigned patients
            docRef.get().then(function(doc) {
                docData = doc.data();
                patients = docData.patient;
                console.log(patients);

                displayPatients(patients);
            }).catch(function(error) {
                console.log(error);
            });
        }
    });
});

/**
 * Display patients as HTML text
 * @param {array} patients - Array of patients
 */
function displayPatients(patients) {
    var patientMsg = '';

    patients.forEach(function(patient) {
        var firstName = patient.firstName;
        var lastName = patient.lastName
        var phone = str(patient.phone);

        patientMsg += '<div>';
        patientMsg += '<div>' + firstName + '</div>';
        patientMsg += '<div>' + lastName + '</div>';
        patientMsg += '<div>' + phone + '</div>';
        patientMsg += '</div>';

        $("#patient-profiles").text(patientMsg);
    });
}
