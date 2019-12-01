/**
 * message.js
 */

 $(document).ready(function() {
 	firebase.auth().onAuthStateChanged(function(user) {
	  if (user) {
	  	firebaseDoctorRetrieveMessages(user.email, "csmith@gmail.com");
	  }
	});

	$("#message-btn").click(function() {
		var body = $("input#doctor-message").val();
		if (body && body.length > 0) {
			firebase.auth().onAuthStateChanged(function(user) {
		  if (user) {
		  	firebaseDoctorSendMessage(user.email, "csmith@gmail.com", body);
		  }
		});
		}
	});
 });

 /**
  * Send message from doctor to patient
  * @param {string} doctorID 
  * @param {string} patientID 
  * @param {string} body 
  */
function firebaseDoctorSendMessage(doctorID, patientID, body) {
	var db = firebase.firestore();
	var docRef = db.collection("messages").doc(doctorID).collection(patientID);
	// var timestamp = firebase.firestore.FieldValue.serverTimestamp(); 
	var date = new Date(); // To-do: Change to firebase server-side
	var timestamp = convertDateToTimestamp(date);

	var docData = {
		author: doctorID,
		body: body,
		// timestamp: timestamp
	};
	docRef.doc(timestamp).set(docData)
	.then(function(docRef) {
		console.log("Document written with ID: ", docRef.id);
	})
	.catch(function(error) {
		console.error("Error adding document: ", error);
	});
}

/**
  * Retrieve messages from doctor-patient interaction. Will write update to #messages
  * @param {string} doctorID 
  * @param {string} patientID 
  */
function firebaseDoctorRetrieveMessages(doctorID, patientID) {
	var db = firebase.firestore();

	db.collection("messages").doc(doctorID).collection(patientID)
	.limit(5)
	// .orderBy("data_sent", "desc")
	.get()
	.then(function(querySnapshot) {
		var showMessages = '<div>';
    querySnapshot.forEach(function(doc) {
    	var docData = doc.data();
    	if (typeof docData['date_sent'] != "undefined" &&
    		typeof docData['date_sent']['seconds'] != "undefined") {
    		var date = new Date(docData['date_sent']['seconds']*1000);
    	}
    	else {
    		var date = '<i>Unknown</i>';
    	}

  		showMessages += '<div>';
    	showMessages += date;
    	showMessages += '</div>';

    	showMessages += '<div>';
    	showMessages += docData['author'];
    	showMessages += '</div>';

    	showMessages += '<div>';
    	showMessages += docData['body'];
    	showMessages += '</div>';
    });
    showMessages += '</div>';
    $("#messages").html(showMessages);

	})
	.catch(function(error) {
	    console.log("Error getting documents: ", error);
	});
}
