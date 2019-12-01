/**
 * patient-profile.js
 */
$(document).ready(function() {
    firebase.auth().onAuthStateChanged(function(user) {
        if (user) {
            var db = firebase.firestore();
            var userEmail = firebaseGetUserEmail(user);
            var docRef = db.collection("doctors").doc(userEmail);

            // Grab all assigned patients
            docRef.get().then(function(doc) {
                var docData = doc.data();
                var patientEmails = docData.patient;
                var patientArr = [];

                for (patientEmail in patientEmails) {
                    patientRef = ddb.collection("patient").doc(patientEmail);
                    patient.get().then(function(doc) {

                    }).catch(function(error) {
                        console.log(error);
                    });
                }

                


                displayPatients(patientArr);
            }).catch(function(error) {
                console.log(error);
            });
        }
    });
});

/**
 * Display patients as HTML text
 * @param {array} patientEmails - Array of Patients
 */
function displayPatients(patients) {
    var patientMsg = '';

    patientEmails.forEach(function(patients) {
        console.log(patient);


        var firstName = patient.firstName;
        var lastName = patient.lastName
        var phone = String(patient.phone);
        var emailAddress = patient.emailAddress;

        patientMsg += '<div>';
        patientMsg += '<div>' + firstName + '</div>';
        patientMsg += '<div>' + lastName + '</div>';
        patientMsg += '<div>' + phone + '</div>';
        patientMsg += '<div>' + emailAddress + '</div>';
        patientMsg += '</div>';

        $("#patient-profiles").text(patientMsg);
    });
}
