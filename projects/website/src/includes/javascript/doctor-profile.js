var firestore = firebase.firestore();
const doctorTitle = document.querySelector("#titleDoctor");
const profile = document.querySelector("#profile");
const docRef = firestore.doc("/doctors/jdoe");

getRealtimeUpdates = function() {
    docRef.onSnapshot(function(doc){
        if(doc && doc.exists) {
            const myData = doc.data();
            //const myPatient = firestore.doc("/patient/tuUosuerNtfNzOCksRj7");
            //console.log("Patient Name: " + myData.patient[0]);
            doctorTitle.innerText = "Welcome! " + myData.title + " " + myData.firstName + " " + myData.lastName;
            profile.innerText = "Phone Number: " + myData.phoneNumber + "\n"
                                + "Email: " + myData.emailAddress + "\n";
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
