
<%@page import="java.util.List"%>
<%@page import="Database.StatsDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="stats" class="Database.StatisticsRepository" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="PimpMyWebsite.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
          google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);

          function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Task in total'],
            <%
                String format = "['%s', %d],";
                List<StatsDTO> info = stats.GetStats();
                for (int i = 0; i < info.size(); i++) {
                    out.println(String.format(format, info.get(i).getTagID(), info.get(i).getCount()));
                }
            %>

                ]);
                var options = {
                    title: 'Antal opgaver ialt:  <%= stats.GetTotal()%>'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>
        <title>WEWO stats</title>
    </head>
    <body>
        <div class="topbar">Wewo stats</div>
        <div id="piechart"></div>
        <table>
            <tr>
                <th>
                    Denne hjemmeside er lavet som et eksempel på hvad .jsp kan bruges til.
                    Den viser antal opgaver i databasen delt op i hvilken type de er oprettet som
                    , også viser den dem i procent.
                    Prøv at holde over grafen for at se mere information!</th>
            </tr>
        </table> 
        <button id="switch">Side 2</button>
        <script type="text/javascript">
            document.getElementById("switch").onclick = function () {
                location.href = "index2.jsp";
            };
        </script>
    </body>
</html>
