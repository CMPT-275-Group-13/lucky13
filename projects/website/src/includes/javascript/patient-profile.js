/**
 * patient-profile.js
 * 
 * Javascript file for patient profile
 */

var urlParams = getURLParameters();
var patientEmail = validateString(urlParams.get('email'));

// When the document is ready
$(document).ready(function() {
    var db = firebase.firestore();
    var patientAssignedToDoctor = false; // True if patient is assigned to current user
    
    // Populate Patient Info
    firestoreDisplayUser(patientEmail, "patient");
    checkAssignment();    

    // When assignment button is pressed,
    $("#patient-assignment").click(function() {
        firebase.auth().onAuthStateChanged(function(user) {
            var doctorEmail = firebaseGetUserEmail(user);
            if (user) {
                var doctorRef = db.collection("doctors").doc(doctorEmail);
                var patientRef = db.collection("patient").doc(patientEmail);

                patientRef.get().then(function(doc) {
                    // Check if patient is assigned
                    var docData = doc.data();
                    var doctorArr = docData.doctor;
                    var patientAssignedToDoctor = false;
                    if (doctorArr.length) {
                        patientAssignedToDoctor = doctorArr.find(function(doctor) {
                            return doctor == doctorEmail;
                        });
                    }

                    // Remove assignment
                    if (patientAssignedToDoctor) {
                        console.log("Remove assignment");
                        patientRef.update({
                            doctor: firebase.firestore.FieldValue.arrayRemove(doctorEmail)
                        });
                        doctorRef.update({
                            patient: firebase.firestore.FieldValue.arrayRemove(patientEmail)
                        });
                    }
                    // Add assignment
                    else {
                        console.log("Add assignment");
                        patientRef.update({
                            doctor: firebase.firestore.FieldValue.arrayUnion(doctorEmail)
                        });
                        doctorRef.update({
                            patient: firebase.firestore.FieldValue.arrayUnion(patientEmail)
                        });
                    }

                // Verify assignment
                checkAssignment();

                }).catch(function(error) {
                    console.log(error);
                });
            }
        });
    });
});

/**
 * Show patient information if the patient is assigned to the current user
 */
function checkAssignment() {
    firebase.auth().onAuthStateChanged(function(user) {
        if (user) {
            var db = firebase.firestore();
            var doctorEmail = firebaseGetUserEmail(user);
            var patientRef = db.collection("patient").doc(patientEmail);
            var patientAssignedToDoctor = false;

            patientRef.get().then(function(doc) {
                // Check if patient is assigned
                var docData = doc.data();
                var doctorArr = docData.doctor;
                if (doctorArr.length) {
                    patientAssignedToDoctor = doctorArr.find(function(doctor) {
                        return doctor == doctorEmail;
                    });
                }

                // Patient is assigned
                if (patientAssignedToDoctor) {
                    console.log("Patient is assigned");
                    showPatientInformation();
                 }
                // Not assigned
                else {
                    console.log("Patient is not assigned");
                    jQueryWriteTextToHTML("#patient-assignment", "Assign");
                    removePatientInformation();
                }
            }).catch(function(error) {
                console.log(error);
            });
        }
    });
}

/**
 * Removes additional patient information from the page.
 */
function removePatientInformation() {
    jQueryWriteTextToHTML("#patient-assignment", "Assign");
    jQueryWriteTextToHTML("#profile-brain-test-result", "");
    jQueryWriteTextToHTML("#profile-tremor-test-result", "");
    jQueryWriteTextToHTML("#profile-message", "");
    jQueryWriteTextToHTML("#profile-medication", "");
}

/**
 * Shows patient additional information on the page.
 */
function showPatientInformation() {
    jQueryWriteTextToHTML("#patient-assignment", "Unassign");
    jQueryGenerateURL("#profile-brain-test-result", 'brain-test-results.php', patientEmail, "Brain Test");
    jQueryGenerateURL("#profile-tremor-test-result", 'tremor-test-results.php', patientEmail, "Tremor Test");
    jQueryGenerateURL("#profile-message", 'message.php', patientEmail, "Messages");
    jQueryGenerateURL("#profile-medication", 'patient-medication.php', patientEmail, "Medication");
}
