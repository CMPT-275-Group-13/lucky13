/* 
    tremor-test-results.js
    Gets the tremor test result from firestore database and loads it in a chart
*/
var db = firebase.firestore();

//get patient info from url
var urlParams = new URLSearchParams(window.location.search);
var patient = urlParams.get('index');
patient = decodeURIComponent(patient);

var tremorTestRef = db.collection('tests').doc(patient).collection('tremor-test');
var patientRef = db.collection('patient').doc(patient);

var tremorTestTitle = document.querySelector("#tremorTitle");

//generates chart for the tremor test
generateChart = function(xaccel,yaccel, zaccel, tStamp) {
    var ctx = document.getElementById('tremorChart');
    console.log(yaccel);

    var myChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: tStamp,
            datasets: [{
                label: 'x',
                data: xaccel,
                fill: false,
                borderColor: "#3e95cd",
                fill: false,
                borderWidth: 2
            },
            {
                label: 'y',
                data: yaccel,
                borderColor: "#8e5ea2",
                fill: false,
                borderWidth: 2
            },

            {
                label: 'z',
                data: zaccel,
                borderColor: "#3cba9f",
                fill: false,
                borderWidth: 2
            }
        
        ]
        },
        options:  {
            scales: {
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: 'Date and Time the Test was taken'
                    }
                    
                }],
                yAxes: [{
                    scaleLabel:{
                        display: true,
                        labelString: 'Standard Deviation'
                    },
                    ticks: {
                        
                        beginAtZero: true
                    }
                }]
            }
        }
    });

}

//show the 5 most recent tests for remor tests
getMostRecentTests = function() {
    var xAccelArray = [];
    var yAccelArray = [];
    var timeStampArray = [];
    var zAccelArray = [];

    //loads patient information into the main page
    patientRef.onSnapshot(function (doc) {
        var myData = doc.data();
        tremorTestTitle.innerText = "Tremor Test results for " + myData.firstName + " " + myData.lastName;
    });       

    tremorTestRef.orderBy("timeStamp", "desc").limit(5).
     onSnapshot( querySnapshot => {
        var myData = querySnapshot.docs;
        for(var i = 0; i < 5; i++){
            var myDocData = myData[i].data();

            xAccelArray.push(myDocData.xAccel);
            yAccelArray.push(myDocData.yAccel);
            zAccelArray.push(myDocData.zAccel);

            //covert unix to time 
            var convertUnix = formatDateAndTime(myDocData.timeStamp);
            timeStampArray.push(convertUnix);
        }

        generateChart(xAccelArray, yAccelArray,zAccelArray, timeStampArray);

    }); 

    
}

getMostRecentTests();l