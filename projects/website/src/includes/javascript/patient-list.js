/**
 * patient-list.js
 */
$(document).ready(function() {
    firebase.auth().onAuthStateChanged(function(user) {
        if (user) {
            var db = firebase.firestore();
            var userEmail = firebaseGetUserEmail(user);

            // Grab patients assigned to doctor
            var patientsRef = db.collection("patient").where("doctor", 'array-contains', userEmail)
            .get()
            .then(function(querySnapshot) {
                querySnapshot.forEach(function(doc) {
                    patientData = doc.data();
                    displayPatient(patientData);
                });
            })
            .catch(function(error) {
                console.log("Error getting documents: ", error);
            });
        }
    });
});

/**
 * Display patient as HTML text
 * @param {array} patient - Array of the patient's information
 */
function displayPatient(patient) {
    var patientMsg = $("#patient-profiles").html();

    var firstName = validateString(patient.firstName);
    var lastName = validateString(patient.lastName);
    var phone = validateString(patient.phone);
    var email = validateString(patient.email);
    var profileURL = 'patient-profile.php?email=' + email;

    patientMsg += '<li class="list-group-item">';
    patientMsg += '<a href="' + profileURL + '">';
    patientMsg += firstName + ' ' + lastName + '</li>';
 

    $("#patient-profiles").html(patientMsg);
}
