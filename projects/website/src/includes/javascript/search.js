var db = firebase.firestore();
var btnSearch = document.querySelector("#searchButton");
var txtSearch = document.querySelector("#inputSearch");
var results = document.querySelector("#results");

var patientRef = db.collection('patient');
var docArray = [];


btnSearch.addEventListener("click", function() {
    var txtSearchInput = txtSearch.value.toLowerCase();
    patientRef.get().then(querySnapshot =>{
        let docs = querySnapshot.docs;
        
        for (var doc in docs) {
            let keywords = docs[doc].data().keywords;

            //verify if the patient's name exists
            if(jQuery.inArray(txtSearchInput, keywords) >= 0){
                docArray.push(docs[doc].data());
                displayPatient();
            }
            
        }

        if(docArray.length == 0){
            results.innerText = "User doesn't exist";
        }

        //clear array
        docArray = [];

    });
});

displayPatient = function (){

    //displays the values of the object parameters
    var newHTML = [];
    $.each(docArray, function (index, value){
        newHTML.push('<div>' + value.firstName + ' '
                            + value.lastName + '<br>' + value.emailAddress 
                            + '<br>' + value.phoneNumber + '</div>');
    });
    $("#results").html(newHTML.join("<p>"));
}
