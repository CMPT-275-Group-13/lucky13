var db = firebase.firstore();
var results = document.querySelector("#results");

//TO DO: need to somehow encase patient data to pass along 
var brainTestRef = db.collection("tests/csmith@gmail.com/brain-test");
var TEST_LIMIT = 5;
var docArray = [];
//gets the latest 5 tests, maybe give the doctor the option to view more
getMostRecentTests = function (){
    const brainTests = brainTestRef.orderBy("timeStamp", "desc").limit(TEST_LIMIT);
    for (i in brainTests){
        docArray.push(brainTest[i].data());
    }
}

getMostRecentTests();

displayTests = function(){
    var newHTML = [];
    $.each(docArray, function (value){
        newHTML.push('<div>' + value.accuracy + '<br>'
                            + value.buttonInterval + '<br>' + value.tapCounter 
                            + '<br>' + value.timeHeld + '</div>');
    });
    $("#results").html(newHTML.join("<p>"));
}
