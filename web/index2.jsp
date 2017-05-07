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
          google.charts.load("current", {packages:['corechart']});
          google.charts.setOnLoadCallback(drawChart);
          function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ["Element", "Density", {role: "style"}],
            <%
              String format = "['%s', %d, '#0393DA'],";
              List<StatsDTO> info = stats.GetStats();
              for (int i = 0; i < info.size(); i++) {
                  out.println(String.format(format, info.get(i).getTagID(), info.get(i).getCount()));
              }
            %>

                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);

                var options = {
                    title: 'Antal opgaver ialt:  <%= stats.GetTotal()%>',
                    bar: {groupWidth: "95%"},
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
                chart.draw(view, options);
            }
        </script>
    <div id="columnchart_values" style="width: 900px; height: 300px; position: absolute; top: "></div>
    <title>WEWO stats</title>
</head>
<body>
    <div class="topbar">Wewo stats</div>
    <div id="columnchart_values" style="width: 900px; height: 300px; position: absolute; top: "></div>
    <table>
        <tr>
            <th>
                Denne hjemmeside er lavet som et eksempel på hvad .jsp kan bruges til.
                Den viser antal opgaver i databasen delt op i hvilken type de er oprettet som
                , også viser den dem i procent.
                Prøv at holde over grafen for at se mere information!</th>
        </tr>
    </table> 
    <button id="switch">Side 1</button>
    <script type="text/javascript">
        document.getElementById("switch").onclick = function () {
            location.href = "index.jsp";
        };
    </script>
</body>
</html>
