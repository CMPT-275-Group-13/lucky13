/**
 * patient-medication.js
 * 
 * Medication for patient
 */


// When the document is ready
$(document).ready(function() {
    var urlParams = getURLParameters();
    var patientEmail = validateString(urlParams.get('email'));
    var db = firebase.firestore();

    var dailyMedicationRef = db.collection("medication").doc(patientEmail).collection('dailyMedications')
    // .orderBy("name", "asce")
    .get()
    .then(function(querySnapshot) {
		querySnapshot.forEach(function(doc) {
            console.log('Display medication');
            var medicationData = doc.data();
            displayMedication(medicationData);
        })
    })
	.catch(function(error) {
	    console.log("Error getting documents: ", error);
	});


    $("#create-medication-btn").click(function() {
        // Grab form values
        var medicationFrequency = jQueryReadValfromHTML("input#medication-frequency");
        var medicationName = jQueryReadValfromHTML("input#medication-name");
        var medicationAmount = jQueryReadValfromHTML("input#medication-amount");
        var medicationTime = jQueryReadValfromHTML("input#medication-time");
        medicationTime = parseInt(medicationTime);

        firestoreCreateMedication(patientEmail, medicationFrequency, medicationName, medicationAmount, medicationTime);
        return false;
    });
});

/**
 * Display medication as HTML text
 * @param {array} patient -  Array of the medication's information
 */
function displayMedication(medication) {
    var medicationMsg = $("#medication-list").html();

    var amount = validateString(medication.amount);
    var name = validateString(medication.name);
    var medicationTime = validateString(medication.time);

    medicationMsg += '<div class="card">';
    medicationMsg +=  '<div class="card-header">' + name + '</div>';
    medicationMsg +=  '<div class="card-body">Amount: ' + amount + '<br>';
    medicationMsg += 'Time: ' + medicationTime + '</div>';
    medicationMsg += '</div>';

    $("#medication-list").html(medicationMsg);
}
