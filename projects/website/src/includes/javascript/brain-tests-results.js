var db = firebase.firestore();
var results = document.querySelector(".results");
var docArray = []

//decode uri query
var urlParams = new URLSearchParams(window.location.search);
var patient = urlParams.get('index');
patient = decodeURIComponent(patient);

var brainTestRef = db.collection("tests").doc(patient).collection("brain-test");
var patientRef = db.collection("patient").doc(patient);
var TEST_LIMIT = 3;

var brainTestTitle = document.querySelector("#titleBrainTestResults");

formatDateAndTime = function(unixTime) {
    var date = new Date(unixTime * 1000); //convert to datetime from unix
    
    //format date
    var d = date.getDate().toLocaleString();
    var m = (date.getMonth() + 1).toLocaleString();
    var yyyy  = date.getFullYear().toLocaleString();

    //format time
    var hh = date.getHours().toLocaleString();
    var mm = date.getMinutes().toLocaleString();
    var ss = date.getSeconds().toLocaleString();

    yyyy = yyyy.replace(/,/g, "");
    return yyyy + "-" + m + "-" + d + " " + hh + ":" + mm + ":" + ss;
}

displayTests = function(){
       $.each(docArray, function(index, value){
            var unixTimeStamp = value.timeStamp;
            var fullDate = formatDateAndTime(unixTimeStamp);

            var dateID = '#date'.concat(index + 1);
            var akinesiaID = '#akinesia-score-'.concat(index + 1);
            var dysmetriaID = '#dysmetria-score-'.concat(index + 1);
            var kinesiaID = '#kinesia-score-'.concat(index + 1);
            var handTestID = '#hand-test-'.concat(index +1);
            var incordinationID = '#incordination-score-'.concat(index + 1);

            $(dateID).html(fullDate);
            $(akinesiaID).html(value.AkinesiaScore.toFixed(4));
            $(dysmetriaID).html(value.DysmetriaScore.toFixed(4));
            $(kinesiaID).html(value.KinesiaScore);
            $(handTestID).html(value.chosenHand);
            $(incordinationID).html(value.IncorrdinationScore.toFixed(4));

       });   
}

//gets the latest 3 tests, maybe give the doctor the option to view more
getMostRecentTests = function (){

    //getting patient information
    patientRef.get().then( function(doc) {
        var myData = doc.data();
        brainTestTitle.innerText = "B.R.A.I.N Test Results for " + myData.firstName + " " + myData.lastName; 
    });

    //getting brain test information
    brainTestRef.orderBy("timeStamp", "desc").limit(TEST_LIMIT)
        .get().then(querySnapshot =>
            {
                if(!querySnapshot.empty){
                    var docs = querySnapshot.docs;
                              
                    for(var i in docs){
                        docArray.push(docs[i].data());

                    }
                    displayTests();

                }
            });
        
        docArray = [];
}


getMostRecentTests();
