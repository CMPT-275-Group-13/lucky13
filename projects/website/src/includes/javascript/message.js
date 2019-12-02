/**
 * message.js
 * Messaging javascript stuff
 */

var urlParams = getURLParameters();
var patientEmail = validateString(urlParams.get('email'));

 $(document).ready(function() {
 	firebase.auth().onAuthStateChanged(function(user) {
	  if (user) {
		  firebaseDoctorRetrieveMessages(user.email, patientEmail);
	  }
	});

	$("#message-btn").click(function() {
		var body = $("input#doctor-message").val();
		
		// If there is a message, send it
		body = validateString(body);
		if (body && body.length > 0) {
			firebase.auth().onAuthStateChanged(function(user) {
				if (user) {
					firebaseDoctorSendMessage(user.email, patientEmail, body);
				}
		});
		}
	});
 });

 /**
  * Send message from doctor to patient
  * @param {string} doctorEmail 
  * @param {string} patientEmail 
  * @param {string} body 
  */
function firebaseDoctorSendMessage(doctorEmail, patientEmail, body) {
	var db = firebase.firestore();
	var doctorName = '';

	// Get doctor's name
	var doctorDocumentRef = db.collection('doctors').doc(doctorEmail).get()
	.then(function(doc) {
		if (doc.exists && doc.data()) {
			var docData = doc.data();
			doctorName = validateString(docData.firstName) + ' ' + validateString(docData.lastName);

			// Write message to database
			var messageDocumentRef = db.collection("messages").doc(doctorEmail).collection(patientEmail);
			var messageData = {
				author: validateString(doctorEmail),
				authorName: doctorName,
				body: validateString(body),
				sentDate: firebase.firestore.Timestamp.now(),
			};

			// Document ID is timestamp
			var date = new Date();
			var timestamp = convertDateToTimestamp(date);

			messageDocumentRef.doc(timestamp).set(messageData)
			.then(function(docRef) {
				console.log("Document written with ID: ", docRef.id);
			})
			.catch(function(error) {
				console.error("Error adding document: ", error);
			});
		}
		else {
			console.error("Error finding document while looking for doctor!");
		}
	}).catch(function(error) {
		console.error("Error adding document: ", error);
	});
}

/**
  * Retrieve messages from doctor-patient interaction. Will write update to #messages
  * @param {string} doctorEmail 
  * @param {string} patientEmail 
  */
function firebaseDoctorRetrieveMessages(doctorEmail, patientEmail) {
	var db = firebase.firestore();

	db.collection("messages").doc(doctorEmail).collection(patientEmail)
	.limit(20)
	.orderBy("sentDate", "desc")
	.get()
	.then(function(querySnapshot) {
		var showMessages = '<div>';
		querySnapshot.forEach(function(doc) {
			var docData = doc.data();
			if (typeof docData.sentDate != "undefined" &&
				typeof docData.sentDate.seconds != "undefined") {
				var date = new Date(docData.sentDate.seconds*1000);
			}
			else {
				var date = '<i>Unknown</i>';
			}

			showMessages += '<div>';
			showMessages += date;
			showMessages += '</div>';

			showMessages += '<div>';
			showMessages += validateString(docData.authorName);
			showMessages += '</div>';

			showMessages += '<div>';
			showMessages += validateString(docData.body);
			showMessages += '</div>';
		});
		showMessages += '</div>';
		$("#messages").html(showMessages);

	})
	.catch(function(error) {
	    console.log("Error getting documents: ", error);
	});
}
