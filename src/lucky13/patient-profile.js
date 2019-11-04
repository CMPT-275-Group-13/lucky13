var firestore = firebase.firestore();
const patientName = document.querySelector("#patients");
const profile = document.querySelector("#details");
const message = document.querySelector("#message"); 
const patientRef = firestore.doc("/patient/csmith");
const messageRef = firestore.doc("/messages/csmith");


getRealtimeUpdates = function(){
    patientRef.onSnapshot(function(doc){
        if(doc && doc.exists) {
            const myData = doc.data();
            
            patientName.innerText = myData.firstName +  " " + myData.lastName;
            profile.innerText = "email address: " + myData.emailAddress + "\n" +
                                "phone number: " + myData.phoneNumber;

        }
    });

    messageRef.onSnapshot(function(doc){
        if(doc && doc.exists){
            const myData = doc.data();

            myData.collection()
        }
    });

    // patientRef.onSnapshot(function(doc){
    //     if(doc && doc.exists){{
    //         const myData = doc.data();
    //         patient2.innerText = "Email: " + myData.emailAddress + "\n" + "Phone Number: " + myData.phoneNumber;
            
    //     }}
    // });
}

getRealtimeUpdates();
