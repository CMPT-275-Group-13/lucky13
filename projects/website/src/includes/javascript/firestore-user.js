/**
 * firebase-user.js
 */

function firestoreCreateUser(email, firstName, lastName) {
	var db = firebase.firestore();

	db.collection("doctors").doc(email).add({
		email: email,
		firstName: firstName,
		lastName: lastName
	})
	.then(function(docRef) {
		console.log("Document written with ID: ", docRef.id);
	})
	.catch(function(error) {
		console.error("Error adding document: ", error);
	});
}

function firestoreDisplaySingleDoctorAttributes(doctorData) {
	$('#profile-email').val(doctorData["emailAddress"]);
	$('#profile-first-name').val(doctorData["firstName"]);
	$('#profile-last-name').val(doctorData["lastName"]);
	$('#profile-title').val(doctorData["title"]);
	$('#profile-phone').val(doctorData["phone"]);
}

function firestoreDisplaySinglePatientAttributes(patientData) {
	$('#profile-email').val(patientData["emailAddress"]);
	$('#profile-first-name').val(patientData["firstName"]);
	$('#profile-last-name').val(patientData["lastName"]);
	$('#profile-phone').val(patientData["phone"]);
}

function firestoreDisplayUser(email, userType="doctors") {
	var db = firebase.firestore();

	var docRef = db.collection(userType).doc(email);
	docRef.get().then(function(doc) {
		if (doc.exists) {
			console.log("Document data:", doc.data());

			switch(userType) {
				case "patients":
					firestoreDisplaySingleDoctorAttributes(doc.data());
					break;
				default:
				case "doctors":
					firestoreDisplaySinglePatientAttributes(doc.data());
					break;
			}
		}

		else {
        // doc.data() will be undefined in this case
        console.log("No such document!");
    }
	}).catch(function(error) {
    console.log("Error getting document:", error);
  });
}
