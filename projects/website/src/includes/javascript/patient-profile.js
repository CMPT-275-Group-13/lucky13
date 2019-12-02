/**
 * patient-profile.js
 */

$(document).ready(function() {
    var urlParams =  getURLParameters();
    var patientEmail = validateString(urlParams.get('email'));

    // Populate Patient Info and Relevant links
    firestoreDisplayUser(patientEmail, "patient");
    jQueryGenerateURL("#profile-brain-test-result", 'brain-test-results.php', patientEmail, "Brain Test");
    jQueryGenerateURL("#profile-tremor-test-result", 'tremor-test-results.php', patientEmail, "Tremor Test");
    jQueryGenerateURL("#profile-message", 'message.php', patientEmail, "Message");
    jQueryGenerateURL("#profile-medication", 'patient-medication.php', patientEmail, "Medication");

    // To-do: Assign and unassign patient to doctor logic

});
