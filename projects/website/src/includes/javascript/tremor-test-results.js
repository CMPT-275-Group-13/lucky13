console.log(moment());

var db = firebase.firestore();

//get patient info from url
var urlParams = new URLSearchParams(window.location.search);
var patient = urlParams.get('index');
patient = decodeURIComponent(patient);

var tremorTestRef = db.collection('tests').doc(patient).collection('tremor-test');


generateChart = function(xaccel, yaccel, zaccel) {
    var ctx = document.getElementById("tremorChart");
    var chart = new Chart(ctx, {
        type: 'line',
        data: xaccel,
        options: {
            scales: {
                xAxes: [{
                    type: 'time',
                    time: {
                        unit: 'second'
                    },
                    distribution: 'series'
                }]
            }
        }
    });
}

getMostRecentTests = function() {
     tremorTestRef.get().then( querySnapshot => {
        var tremorData = querySnapshot.docs[0].data();
        console.log("data: " + tremorData.xAccel);

        generateChart(tremorData.xAccel, tremorData.yAccel, tremorData.zAccel);

    }); 
}

getMostRecentTests();