<html>
  <head>
    <title>COVID-19 STATS</title>
    <link rel="stylesheet" type="text/css" href="">
  </head>
  <body>
    <div id="favorites">
    <h3 align="center">Favorites</h3>
    <table align="center" border="1">
      <thead>
        <tr>
	  <td>Favorite</td>
          <td><strong>State</strong></td>
          <td><strong>Confirmed</strong></td>
          <td><strong>New Confirmed</strong></td>
          <td><strong>Deaths</strong></td>
          <td><strong>New Deaths</strong></td>
        </tr>
      </thead>
      <tbody id="favBod">
      </tbody>
    </table>
    </div>
    <h3 id="title2" align="center">State Statistics</h3>
    <table id="sort" align="center" border="1">
      <thead>
	<tr>
	  <td>Favorite</td>
	  <td><strong id="STATE">State</strong></td>
	  <td id="CONFIRMED"><strong>Confirmed</strong></td>
	  <td id="NEW_CONFIRMED"><strong>New Confirmed</strong></td>
	  <td id="DEATHS"><strong>Deaths</strong></td>
	  <td id="NEW_DEATHS"><strong>New Deaths</strong></td>
	</tr>
      </thead>
      <tbody id="bod">
<?php

function fetchMichigan($query){ 
 $cnx = new mysqli("localhost", "root", "password", "michigan");
 if ($cnx->connect_error) { die("Connection failed: " . $cnx->connect_error);}
    $cursor = $cnx->query($query);
    while ($row = $cursor->fetch_assoc()) {
        echo '<tr>';
	echo '<td>N/A</td><td>' . $row['county'] . '</td><td>' . $row['confirmed'] . '</td><td>N/A</td><td>' . $row['deaths'] . '</td><td>N/A</td>';
	echo '</tr>';
    }
$cnx->close();
}

function calculateNew($query){
 $cnx = new mysqli("localhost", "root", "password", "demo");
 if ($cnx->connect_error) { die("Connection failed: " . $cnx->connect_error);}
 $sql = sprintf("SELECT data.state, data.confirmed, (data.confirmed - yesterday.confirmed) AS new_confirmed, data.deaths, (data.deaths - yesterday.deaths) AS new_deaths FROM data, yesterday WHERE (data.state = yesterday.state) GROUP BY data.state ORDER BY %s", $query);
 $cursor = $cnx->query($sql);
 while ($row = $cursor->fetch_assoc()) {
   if ($row['state'] == 'Michigan'){
        echo '<tr>';
	echo '<td><button class="add" value="' . $row['state'] . '">Add</button></td><td id="michigan" style="color:red;">' . $row['state'] . '</td><td>' . $row['confirmed'] . '</td><td>' . $row['new_confirmed'] . '</td><td>' . $row['deaths'] . '</td><td>' . $row['new_deaths'] . '</td>';
	  echo '</tr>';
        } else {
        echo '<tr>';
	echo '<td><button class="add" value="' . $row['state'] . '">Add</button></td><td>' . $row['state'] . '</td><td>' . $row['confirmed'] . '</td><td>' . $row['new_confirmed'] . '</td><td>' . $row['deaths'] . '</td><td>' . $row['new_deaths'] . '</td>';
	  echo '</tr>';
	} 
 }
$cnx->close();
}

function addState($state){
 $ip = $_SERVER['REMOTE_ADDR'];
 $cnx = new mysqli("localhost", "root", "password", "demo");
 if ($cnx->connect_error) { die("Connection failed: " . $cnx->connect_error);}
 //first check if already exists
 $query = sprintf("SELECT * FROM IPS WHERE IP='%s' AND state='%s'", $ip, $state);
 $cursor = $cnx->query($query);
 $exists = 0;
 while ($row = $cursor->fetch_assoc()) {
  $exists++;
 }
 if ($exists == 0){
	 $query = sprintf("INSERT INTO IPS (IP, state, confirmed, deaths) VALUES ('%s', '%s', (SELECT confirmed FROM data WHERE state='%s'), (SELECT deaths FROM data WHERE state='%s'))", $ip, $state, $state, $state);
         echo $query;
	 $cursor = $cnx->query($query);
 }
 $cnx->close();
}

function removeState($state){
 $ip = $_SERVER['REMOTE_ADDR'];
 $cnx = new mysqli("localhost", "root", "password", "demo");
 if ($cnx->connect_error) { die("Connection failed: " . $cnx->connect_error);}
 $query = sprintf("DELETE FROM IPS WHERE IP='%s' AND state='%s'", $ip, $state);
 echo $query;
 $cursor = $cnx->query($query);
 $cnx->close(); 
}

function getStates(){
 $ip = $_SERVER['REMOTE_ADDR'];
 $cnx = new mysqli("localhost", "root", "password", "demo");
 if ($cnx->connect_error) { die("Connection failed: " . $cnx->connect_error);}
 $query = "SELECT IPS.state, IPS.confirmed, (IPS.confirmed - yesterday.confirmed) AS new_confirmed, IPS.deaths, (IPS.deaths - yesterday.deaths) AS new_deaths FROM IPS, yesterday WHERE (IPS.state = yesterday.state) GROUP BY IPS.state ORDER BY confirmed DESC";
 $cursor = $cnx->query($query);
 while ($row = $cursor->fetch_assoc()) {
  echo '<tr><td><button class=remove value=\'' . $row['state'] . '\'>Remove</button></td><td>' . $row['state'] . '</td><td>' . $row['confirmed'] . '</td><td>' . $row['new_confirmed'] . '</td><td>' . $row['deaths'] . '</td><td>' . $row['new_deaths'] . '</td></tr>';
 }
 $cnx->close();  
}

?>


    </tbody>
  </table>

    <script>
      var stateFlag, confirmedFlag, new_confirmedFlag, deathsFlag, new_deathsFlag = 0;
      var michigan;
      document.addEventListener("DOMContentLoaded", function() {
	  bod = document.getElementById("bod");
	  STATE = document.getElementById("STATE");
	  CONFIRMED = document.getElementById("CONFIRMED");
	  NEW_CONFIRMED = document.getElementById("NEW_CONFIRMED");
	  DEATHS = document.getElementById("DEATHS");
	  NEW_DEATHS = document.getElementById("NEW_DEATHS");
	  function setButtons(){
	      var adds = document.getElementsByClassName("add");
	      for (i = 0; i < adds.length; i++){
		  adds[i].onclick = function(){
		      window.location.href=`index.php?add=${this.value}`
		      console.log("<?php echo addState($_GET['add']); ?>");
		  }
	      }
	      var removes = document.getElementsByClassName("remove");
	      for (i = 0; i < removes.length; i++){
		  removes[i].onclick = function(){
		      window.location.href=`index.php?remove=${this.value}`
		      console.log("<?php echo removeState($_GET['remove']); ?>");
		  }
	      }
	  }
	  function resetFlags(){
	      document.getElementById("title2").innerHTML = "State Statistics";
	      STATE.innerHTML = "State";
	      setMichigan();
   	      ipStuff();
	      stateFlag = 0;
	      confirmedFlag = 0;
	      new_confirmedFlag = 0;
	      deathsFlag = 0;
	      new_deathsFlag = 0;
	  };
	  function setMichigan(){
	      michigan = document.getElementById("michigan");
	      michigan.onclick = function(){
		  STATE.innerHTML = "County";
		  data = '<?php echo fetchMichigan("SELECT * FROM data ORDER BY confirmed DESC"); ?>';
		  bod.innerHTML = data;
		  document.getElementById("title2").innerHTML = "County Statistics";
	      };
	  };
	  function ipStuff(){
	      data = "<?php echo getStates(); ?>";
	      favBod = document.getElementById("favBod")
	      favBod.innerHTML = data;
	      setButtons();
	  }
	  STATE.onclick = function() {
	      if (stateFlag == 0){
		  data = '<?php echo calculateNew("state ASC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
		  stateFlag = 1;
	      } else {
		  data = '<?php echo calculateNew("state DESC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
	      }
	  }

	  CONFIRMED.onclick = function() {
	      if (confirmedFlag == 0){
		  data = '<?php calculateNew("confirmed DESC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
		  confirmedFlag = 1;
	      } else {
		  data = '<?php calculateNew("confirmed ASC"); ?>;';
		  bod.innerHTML = data;
		  resetFlags();
	      }
	  }

	  NEW_CONFIRMED.onclick = function() {
	      if (new_confirmedFlag == 0){
		  data = '<?php echo calculateNew("new_confirmed DESC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
		  new_confirmedFlag = 1;
	      } else {
		  data = '<?php echo calculateNew("new_confirmed ASC"); ?>;';
		  bod.innerHTML = data;
		  resetFlags();
	      }
	  }

	  DEATHS.onclick = function() {
	      if (deathsFlag == 0){
		  data = '<?php  calculateNew("deaths DESC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
		  deathsFlag = 1;
	      } else {
		  data = '<?php calculateNew("deaths ASC"); ?>;';
		  bod.innerHTML = data;
		  resetFlags();
	      }
	  }

	  NEW_DEATHS.onclick = function() {
	      if (new_deathsFlag == 0){
		  data = '<?php calculateNew("new_deaths DESC"); ?>';
		  bod.innerHTML = data;
		  resetFlags();
		  new_deathsFlag = 1;
	      } else {
		  data = '<?php calculateNew("new_deaths ASC"); ?>;';
		  bod.innerHTML = data;
		  resetFlags();
	      }
	  }
	  CONFIRMED.click();
	  CONFIRMED.click();
      })


    </script>
</body>

</html>
