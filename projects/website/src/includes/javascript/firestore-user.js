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
