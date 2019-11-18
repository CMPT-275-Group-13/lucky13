var db = firebase.firestore();
var results = document.querySelector(".results");
var docArray = []

//TO DO: need to query from url string
var brainTestRef = db.collection("tests/csmith@gmail.com/brain-test");
var TEST_LIMIT = 3;

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
    brainTestRef.orderBy("timeStamp", "desc").limit(TEST_LIMIT)
        .get().then(querySnapshot =>
            {
                if(!querySnapshot.empty){
                    var docs = querySnapshot.docs;
                              
                    for(i in docs){
                        docArray.push(docs[i].data())

                    }
                    displayTests();

                }
            });
        
        docArray = [];
}


getMostRecentTests();
