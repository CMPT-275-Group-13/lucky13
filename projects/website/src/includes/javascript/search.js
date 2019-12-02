/**
 * search.js
 */

var db = firebase.firestore();
var btnSearch = document.querySelector("#searchButton");
var txtSearch = document.querySelector("#inputSearch");
var results = document.querySelector(".searchResults");

var patientRef = db.collection('patient');
var docArray = [];

btnSearch.addEventListener("click", function() {
        var txtSearchInput = txtSearch.value.toLowerCase();
        patientRef.get().then(querySnapshot => {
        var docs = querySnapshot.docs;
        
        for (var doc in docs) {
            var keywords = $.map(docs[doc].data().keyword, function(n, i){return n.toLowerCase();});
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

 /**
  * Displays the search results
  *   */ 

displayPatient = function (){

    //displays the values of the object parameters
    var newHTML = [];
    $.each(docArray, function (index, value){
        var profileURL = 'patient-profile.php?email=' + value.email;
        newHTML.push('<div class="card-body">');
        newHTML.push('<a href="' + profileURL + '">')
        newHTML.push(value.firstName + ' '
                            + value.lastName + '<br>' + value.email
                            + '<br>' + value.phoneNumber + '</a></div>');
    });
    $(".searchResults").html(newHTML.join("<p>"));
}
