function onLoadPage(){
      //Download data
      
      //if none available, show error
      document.getElementById('piechart').textContent = "No data available"
      
      //else run: 
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart); 
}

function drawChart(arr) {
    
           
        var data = google.visualization.arrayToDataTableinput;

        var options = {
          title: 'Tags visualisering'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
}