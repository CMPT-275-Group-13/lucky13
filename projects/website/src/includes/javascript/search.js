var db = firebase.firestore();
var btnSearch = document.querySelector("#searchButton");
var txtSearch = document.querySelector("#inputSearch");
var results = document.querySelector("#results");

var collectionRef = db.collection('patient');

btnSearch.addEventListener("click", function(){
    var searchInput = txtSearch.value;
    var docRef = collectionRef.doc(searchInput);
    docRef.get().then(function(doc){
        if(doc && doc.exists){
            const myData = doc.data();
            results.innerText = myData.firstName + " " + myData.lastName + "\n" +
                                "email: " + myData.emailAddress + "\n" +
                                "phone number: " + myData.phoneNumber + "\n"
                                + "Doctor: " + myData.doctor;
        }
        else{
            results.innerText = "User does not exist";
        }
    });
    
});