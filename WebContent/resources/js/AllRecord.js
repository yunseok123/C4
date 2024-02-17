function toggleRanking(selectedTab) {
    var battingRank = document.getElementById('battingRank');
    var pitchingRank = document.getElementById('pitchingRank');

    if (selectedTab === 'batting') {
        battingRank.style.display = 'block';
        pitchingRank.style.display = 'none';
    } else {
        battingRank.style.display = 'none';
        pitchingRank.style.display = 'block';
    }
}
var currentView = 'batting'; 

function toggleRanking(selectedTab) {
    var battingRank = document.getElementById('battingRank');
    var pitchingRankEraWhip = document.getElementById('playerRankingTableEraWhip');
    var pitchingRankOther = document.getElementById('playerRankingTableOther');

    battingRank.style.display = 'none';
    pitchingRankEraWhip.style.display = 'none';
    pitchingRankOther.style.display = 'none';

    if (selectedTab === 'batting') {
        battingRank.style.display = 'block';
    } else if (selectedTab === 'pitching') {
   
        pitchingRankEraWhip.style.display = 'block';
    }
}

function togglePitchingTable(metric) {
    var pitchingRankEraWhip = document.getElementById('playerRankingTableEraWhip');
    var pitchingRankOther = document.getElementById('playerRankingTableOther');

  
    pitchingRankEraWhip.style.display = 'none';
    pitchingRankOther.style.display = 'none';

 
    if (metric === 'era' || metric === 'whip') {
        pitchingRankEraWhip.style.display = 'block';
     
        if (metric === 'era') sortTable(3, 'pitchingTableEraWhip', true); 
        else if (metric === 'whip') sortTable(13, 'pitchingTableEraWhip', true); 
    } else {
   
        pitchingRankOther.style.display = 'block';
		if (metric === 'gameplayed') sortTable2(4, 'pitchingTableOther', true);
		if (metric === 'win') sortTable2(5, 'pitchingTableOther', true);
		if (metric === 'lose') sortTable2(6, 'pitchingTableOther', true); 
		if (metric === 'hold') sortTable2(7, 'pitchingTableOther', true); 
		if (metric === 'save') sortTable2(8, 'pitchingTableOther', true);
		if (metric === 'so') sortTable2(9, 'pitchingTableOther', true);
		if (metric === 'inning') sortTable2(10, 'pitchingTableOther', true); 
		if (metric === 'bb') sortTable2(11, 'pitchingTableOther', true); 
		if (metric === 'hit_against') sortTable2(12, 'pitchingTableOther', true); 
		if (metric === 'kk9') sortTable2(14, 'pitchingTableOther', true); 
		if (metric === 'bb9') sortTable2(15, 'pitchingTableOther', true); 

       
    }
}


function sortTable(n, isPitcher = false, isAscending = true) {
    var tableId = isPitcher ? (isAscending ? 'pitchingTableEraWhip' : 'pitchingTableOther') : 'playerRankingTable';
    var table, rows, switching, i, x, y, shouldSwitch, dir = isAscending ? "asc" : "desc", switchcount = 0;
    table = document.getElementById(tableId);
    switching = true;
    
    while (switching) {
        switching = false;
        rows = table.getElementsByTagName("TR");
        
        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[n];
            y = rows[i + 1].getElementsByTagName("TD")[n];
            
            if (dir == "asc") {
                if (parseFloat(x.innerHTML.toLowerCase()) > parseFloat(y.innerHTML.toLowerCase())) {
                    shouldSwitch= true;
                    break;
                }
            } else if (dir == "desc") {
                if (parseFloat(x.innerHTML.toLowerCase()) < parseFloat(y.innerHTML.toLowerCase())) {
                    shouldSwitch= true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount ++;      
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
    updateRanks(tableId);
}

function sortTable2(columnIndex, tableId, ascending) {
    var table, rows, switching, i, x, y, xValue, yValue, shouldSwitch, dir, switchcount = 0;
    table = document.getElementById(tableId);
    switching = true;
    dir = ascending ? "asc" : "desc";

    while (switching) {
        switching = false;
        rows = table.rows;

        for (i = 1; i < (rows.length - 1); i++) {
            shouldSwitch = false;
            x = rows[i].getElementsByTagName("TD")[columnIndex];
            y = rows[i + 1].getElementsByTagName("TD")[columnIndex];

            
            xValue = parseFloat(x.innerHTML) || x.innerHTML.toLowerCase(); 
            yValue = parseFloat(y.innerHTML) || y.innerHTML.toLowerCase(); 

            if (dir == "asc") {
                if (xValue > yValue) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir == "desc") {
                if (xValue < yValue) {
                    shouldSwitch = true;
                    break;
                }
            }
        }
        if (shouldSwitch) {
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
            switchcount++;
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
    updateRanks(tableId);
}

function updateRanks(tableId) {
    var table = document.getElementById(tableId);
    var rows = table.getElementsByTagName("TR");
    for (var i = 1; i < rows.length; i++) {
        rows[i].getElementsByTagName("TD")[0].innerHTML = i;
    }
}

window.onload = function() {
    toggleRanking('batting'); 
};