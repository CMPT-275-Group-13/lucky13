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

function firestoreDisplaySinglePatientAttributes(patientData) {
	$('#profile-email').val(patientData["email"]);
	$('#profile-first-name').val(patientData["firstName"]);
	$('#profile-last-name').val(patientData["lastName"]);
	$('#profile-phone').val(patientData["phone"]);
}

function firestoreDisplaySingleDoctorAttributes(doctorData) {
	$('#profile-email').val(doctorData["email"]);
	$('#profile-first-name').val(doctorData["firstName"]);
	$('#profile-last-name').val(doctorData["lastName"]);
	$('#profile-title').val(doctorData["title"]);
	$('#profile-phone').val(doctorData["phone"]);
}

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

function firestoreUpdateUser(docData, userType="doctors") {
  firebase.auth().onAuthStateChanged(function(user) {
  var db = firebase.firestore();

  if (user) {
  	var oldEmail = user.email;
    if (oldEmail != "" && docData['email'] != oldEmail) {
      var oldEmail = user.email;

      user.updateEmail(docData['email']).then(function() {
      }).catch(function(error) {
      });

      // Delete old document
    }

    db.collection(userType).doc(docData['email']).set(docData).then(function() {
      console.log("Document successfully written!");
    });
  }
	});
}
