var firestore = firebase.firestore();
const patientName = document.querySelector("#patients");
const profile = document.querySelector("#details");
const message = document.querySelector("#messageBody"); 
const patientRef = firestore.doc("/patient/csmith");
const messageRef = firestore.collection("/messages/csmith/John_Doe");


getRealtimeUpdates = function(){
    patientRef.onSnapshot(function(doc){
        if(doc && doc.exists) {
            const myData = doc.data();
            
            patientName.innerText = myData.firstName +  " " + myData.lastName;
            profile.innerText = "email address: " + myData.emailAddress + "\n" +
                                "phone number: " + myData.phoneNumber;

        }
    });

    messageRef.get().then(querySnapshot => {
        const queryDocumentSnapshot = querySnapshot.docs[0].data().Body;
        message.innerText = queryDocumentSnapshot;
    });
   

    // patientRef.onSnapshot(function(doc){
    //     if(doc && doc.exists){{
    //         const myData = doc.data();
    //         patient2.innerText = "Email: " + myData.emailAddress + "\n" + "Phone Number: " + myData.phoneNumber;
            
    //     }}
    // });
};

getRealtimeUpdates();
