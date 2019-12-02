/**
 * patient-profile.js
 */

$(document).ready(function() {
    var urlParams =  getURLParameters();
    var patientEmail = validateString(urlParams.get('email'));

    // Populate Patient Info and Relevant links
    firestoreDisplayUser(patientEmail, "patient");
    jQueryGenerateURL("#profile-brain-test-result", 'brain-test-results.php', patientEmail, "Brain Test Results");
    jQueryGenerateURL("#profile-tremor-test-result", 'tremor-test-results.php', patientEmail, "Tremor Test Results");
    jQueryGenerateURL("#profile-message", 'message.php', patientEmail, "Message Patient");
    jQueryGenerateURL("#profile-medication", 'patient-medication.php', patientEmail, "Medication Schedule");

    // To-do: Assign and unassign patient to doctor logic

});
