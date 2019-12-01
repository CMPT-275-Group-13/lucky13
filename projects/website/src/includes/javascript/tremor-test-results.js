console.log(moment());

var db = firebase.firestore();

//get patient info from url
var urlParams = new URLSearchParams(window.location.search);
var patient = urlParams.get('index');
patient = decodeURIComponent(patient);

var tremorTestRef = db.collection('tests').doc(patient).collection('tremor-test');


//from https://stackoverflow.com/questions/22663353/algorithm-to-remove-extreme-outliers-in-array/22663905
removeAnomalies = function(dataArray) {
    var l = dataArray.length;
    var sum=0;     // stores sum of elements
    for(var i=0;i<dataArray.length;++i) {
        sum+=dataArray[i];
       // sumsq+=dataArray[i]*dataArray[i];
    }
    var median = dataArray[Math.round(l/2)];
    var mean = sum/l; 
    var LQ = dataArray[Math.round(l/4)];
    var UQ = dataArray[Math.round(3*l/4)];
    var IQR = UQ-LQ;
    var data4 = new Array();
    for(var i=0;i<dataArray.length;++i) {
        if(dataArray[i]> median - 2 * IQR && dataArray[i] < mean + 2 * IQR)
            data4.push(dataArray[i]);
    }

    console.log(data4);
    return data4;
}

generateChart = function(xaccel, yaccel, zaccel) {
    var ctx = document.getElementById("tremorChart");
    // var chart = new Chart(ctx, {
    //     type: 'line',
    //     data: xaccel
    // }, 
    // );
    var chart = new Chart(ctx, {
        type: 'line',
        data: xaccel,
        options: {
            scales: {
                xAxes: [{
                    type: 'time',
                    time: {
                        displayFofrmat: {
                            millisecond: 'mm:ss:SSSS'
                        }
                    }
                    
                }],
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });

}

getMostRecentTests = function() {
     tremorTestRef.get().then( querySnapshot => {
        var tremorData = querySnapshot.docs[0].data();
        console.log("data: " + removeAnomalies(tremorData.xAccel));

        //console.log("length" + removeAnomalies(tremorData).legth);
        generateChart(removeAnomalies(tremorData.xAccel), tremorData.yAccel, tremorData.zAccel);

    }); 
}

getMostRecentTests();