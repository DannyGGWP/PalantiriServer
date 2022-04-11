function makeBarChart(elementId, labels, data){
    var ctx = document.getElementById(elementId).getContext('2d');
    var bgColor = []
    var borderColor = []
    for (var i = 0; i < labels.length;i++)
    {
        bgColor[i] = "goldenrod"
        borderColor[i] = "white"
    }
    var chart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: labels,
        datasets: [{
            label: 'Points Per Match',
            data: data,
            backgroundColor: bgColor,
            borderColor: borderColor,
            borderWidth: 1
        }]
        },
    options: {
        title: {
            display: true,
            text: "Points From Shots Made"
        },
        scales: {
            y: { 
                min: 0
            }
        },
        legend: {
            position: 'bottom'
        }
    }
});
return chart; 
}