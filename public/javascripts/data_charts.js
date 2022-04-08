function makeBarChart(elementId, data){
    var ctx = document.getElementById(elementId).getContext('2d');
    var chart = new Chart(ctx, {
    type: 'bar',
    data: data
});
return chart; 
}