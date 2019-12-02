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
	var patientArray = []; // deliberately empty

	db.collection("doctors").doc(email).set({
		email: email,
		firstName: firstName,
		lastName: lastName,
		phoneNumber: phoneNumber,
		uid: uid,
		patient: patientArray,
		keyword: firestoreGenerateKeywords(email, firstName, lastName)
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
	var doctorArray = []; // deliberately empty

	db.collection("patient").doc(email).set({
		email: email,
		firstName: firstName,
		lastName: lastName,
		phoneNumber: phoneNumber,
		uid: uid,
		doctor: doctorArray,
		keyword: firestoreGenerateKeywords(email, firstName, lastName)
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
	jQueryWriteTextToHTML('#profile-email', patientData.email);
	jQueryWriteTextToHTML('#profile-first-name', patientData.firstName);
	jQueryWriteTextToHTML('#profile-last-name', patientData.lastName);
	jQueryWriteTextToHTML('#profile-phone', patientData.phoneNumber);
}

/**
 * Display doctor data onto HTML ID tag
 * @param {array} doctorData 
 */
function firestoreDisplaySingleDoctorAttributes(doctorData) {
	jQueryWriteValToHTML('#profile-email', doctorData.email);
	jQueryWriteValToHTML('#profile-first-name', doctorData.firstName);
	jQueryWriteValToHTML('#profile-last-name', doctorData.lastName);
	jQueryWriteValToHTML('#profile-phone', doctorData.phoneNumber);
	jQueryWriteValToHTML('#profile-title', doctorData.title);
}

/**
 * Display user information
 * @param {string} email 
 * @param {string} userType 
 */
function firestoreDisplayUser(email, userType="doctors") {
	var validatedEmail = validateString(email);
	var validatedUserType = validateString(userType);

	var db = firebase.firestore();

	var docRef = db.collection(validatedUserType).doc(validatedEmail);
	docRef.get().then(function(doc) {
		if (doc.exists) {

			// Display attributes based on user account type
			switch(validatedUserType) {
				case "patient":
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
		if (user) {
			var db = firebase.firestore();
		  
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

/**
 * Generate keywords to assist searching
 * @param {string} email 
 * @param {string} firstName 
 * @param {string} lastName 
 */
function firestoreGenerateKeywords(email, firstName, lastName) {
	var keywords = [firstName, lastName, firstName + " " + lastName, email];
	return keywords;
}

/**
 * Insert medication into firebase
 * @param {string} email 
 * @param {string} amount 
 * @param {string} medName 
 * @param {number} medTime 
 */
function firestoreInsertMedication(email, amount, medName, medTime) {
	firebase.auth().onAuthStateChanged(function(user) {
		var db = firebase.firestore();
		
		if (user) {
			var email = firebaseGetUserEmail(user);

			var db = firebase.firestore();
			var docRef = db.collection("doctors").doc(email);
			var medRef = db.collection("medication").doc(email).collection("dailyMedications");
			
			docRef.get().then(function(doc) {
				docData = doc.data();
				firstName = docData.firstName;
				lastName = docData.lastName;

				medRef.set({
					amount: amount,
					docFirstName: firstName,
					docLastName: lastName,
					name: medName,
					time: medTime
				});
			});
	  }});
}
