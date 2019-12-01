/**
 * firebase-user.js
 * 
 * User-related functions. This involves, on serverr-side, both authentication and firebase
 */

/**
 * Store user information into firestore as doctor
 * @param {string} email 
 * @param {string} firstName 
 * @param {string} lastName 
 * @param {string} uid 
 * @param {string} phoneNumber 
 */
function firestoreCreateDoctor(email, firstName, lastName, uid, phoneNumber) {
	var db = firebase.firestore();
	console.log("Create doctor");

	db.collection("doctors").doc(email).set({
		email: email,
		firstName: firstName,
		lastName: lastName,
		phoneNumber: phoneNumber,
		uid: uid
	})
	.then(function(docRef) {
		console.log("Document written with ID: ", docRef.id);
	})
	.catch(function(error) {
		console.error("Error adding document: ", error);
	});
}

/**
 * Store user information into firestore as patient
 * @param {string} email 
 * @param {string} firstName 
 * @param {string} lastName 
 * @param {string} uid 
 * @param {string} phoneNumber 
 */
function firestoreCreatePatient(email, firstName, lastName, uid, phoneNumber) {
	var db = firebase.firestore();
	console.log("Create patient");

	db.collection("patient").doc(email).set({
		email: email,
		firstName: firstName,
		lastName: lastName,
		phoneNumber: phoneNumber,
		uid: uid
	})
	.then(function(docRef) {
		console.log("Document written with ID: ", docRef.id);
	})
	.catch(function(error) {
		console.error("Error adding document: ", error);
	});
}

/**
 * Display patient data onto HTML ID tag
 * @param {array} patientData 
 */
function firestoreDisplaySinglePatientAttributes(patientData) {
	$('#profile-email').val(patientData.email);
	$('#profile-first-name').val(patientData.firstName);
	$('#profile-last-name').val(patientData.lastName);
	$('#profile-phone').val(patientData.phone);
}

/**
 * Display doctor data onto HTML ID tag
 * @param {array} doctorData 
 */
function firestoreDisplaySingleDoctorAttributes(doctorData) {
	$('#profile-email').val(doctorData.email);
	$('#profile-first-name').val(doctorData.firstName);
	$('#profile-last-name').val(doctorData.lastName);
	$('#profile-title').val(doctorData.title);
	$('#profile-phone').val(doctorData.phone);
}

/**
 * Display user information
 * @param {string} email 
 * @param {string} userType 
 */
function firestoreDisplayUser(email, userType="doctors") {
	var db = firebase.firestore();

	var docRef = db.collection(userType).doc(email);
	docRef.get().then(function(doc) {
		if (doc.exists) {
			console.log("Document data:", doc.data());

			switch(userType) {
				case "patients":
					firestoreDisplaySinglePatientAttributes(doc.data());
					break;
				default:
				case "doctors":
					firestoreDisplaySingleDoctorAttributes(doc.data());
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

/**
 * Update the user information
 * @param {array} docData 
 * @param {string} userType 
 */
function firestoreUpdateUser(docData, userType="doctors") {
  firebase.auth().onAuthStateChanged(function(user) {
	  var db = firebase.firestore();
	  
	  if (user) {
		// To-do: Change profile picture

		// To-do: Update email
		// var oldEmail = user.email;
		//  if (oldEmail != "" && docData['email'] != oldEmail) {
		//    var oldEmail = user.email;

		//    user.updateEmail(docData['email']).then(function() {
		//    }).catch(function(error) {
		//    });

		//    // Delete old document
		//  }

		// To-do: Reset password

		db.collection(userType).doc(docData.email).set(docData).then(function() {
			console.log("Document successfully written!");
		});
	}});
}
