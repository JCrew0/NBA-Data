<?php
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
// If the all the variables are set when the Submit button is clicked...
if (isset($_POST['field_submit'])) {
  // Refer to conn.php file and open a connection.
  require_once("conn.php");
  // Will get the value typed in the form text field and save into variable
  $var_name = $_POST['field_name'];
  $var_team = $_POST['field_team'];
  $var_school = $_POST['field_school'];
  $var_season = $_POST['field_season'];
  // Save the query into variable called $query.
  $query = "SELECT *, teamName FROM rosters JOIN games USING (teamID) WHERE season = :ph_season";
  if ($var_name != "") {
    $query .= " AND player = :ph_name";
  }
  if ($var_school != "") {
    $query .= " AND school = :ph_school";
  }
  if ($var_team != "") {
    $query .= " AND teamID =
      (SELECT teamID FROM games WHERE teamName = :ph_team LIMIT 1)";
  }
  $query .= " GROUP BY player ORDER BY player";

  try {
    // Create a prepared statement. Prepared statements are a way to eliminate SQL INJECTION.
    $prepared_stmt = $dbo->prepare($query);
    //bind the value saved in the variables to the place holders  
    // Use PDO::PARAM_STR to sanitize user string.
    if ($var_name != "") {
      $prepared_stmt->bindValue(':ph_name', $var_name, PDO::PARAM_STR);
    }
    if ($var_team != "") {
      $prepared_stmt->bindValue(':ph_team', $var_team, PDO::PARAM_STR);
    }
    if ($var_school != "") {
      $prepared_stmt->bindValue(':ph_school', $var_school, PDO::PARAM_STR);
    }
    $prepared_stmt->bindValue(':ph_season', $var_season, PDO::PARAM_STR);
    $prepared_stmt->execute();
    // Fetch all the values based on query and save that to variable $result
    $result = $prepared_stmt->fetchAll();
  } catch (PDOException $ex) { // Error in database processing.
    echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
  }
}
?>

<html>

<head>
  <title>NBA Data</title>
  <link rel="icon" type="image/x-icon" href="nba.ico">

  <link rel="stylesheet" type="text/css" href="project.css?id=1234" />
</head>

<body>
  <div id="container">
    <div id="navbar">
      <img src="NBA.jpg" alt="NBA Logo">
      <ul>
        <li><a href="index.html">Home</a></li>
        <li><a href="getPlayer.php">Search Players</a></li>
        <li><a href="sortPlayer.php">Sort Players</a></li>
        <li><a href="insertPlayer.php">Create Players</a></li>
        <li><a href="deletePlayer.php">Delete Players</a></li>
        <li><a href="updatePlayer.php">Update Players</a></li>
      </ul>
    </div>

    <h1> Search for your favorite players!</h1>
    <div id="input_container">
      <form method="post">

        <b>
          <label for="id_name">Name:</label>
        </b>
        <input type="text" name="field_name" id="id_name">

        <b>
          <label for="id_team">Team:</label>
        </b>
        <input type="text" name="field_team" id="id_team">

        <b>
          <label for="id_school">School:</label>
          <b>
            <input type="text" name="field_school" id="id_school">

            <b>
              <label for="id_season">Season:</label>
              <b>

                <select name="field_season" id="id_season">
                  <option value="2016" selected>2016</option>
                  <option value="2017" selected>2017</option>
                  <option value="2018" selected>2018</option>
                  <option value="2019" selected>2019</option>
                  <option value="2020" selected>2020</option>
                </select>

                <div id="submit_container">
                  <input type="submit" id="submit" name="field_submit" value="Submit">
                </div>
      </form>
      <br>
    </div>

    <?php
    if (isset($_POST['field_submit'])) {
      // If the query executed (result is true) and the row count returned from the query is greater than 0 then...
      if ($result && $prepared_stmt->rowCount() > 0) { ?>
        <!-- first show the header RESULT -->
        <h2>Results for selected season:</h2>
        <!-- Then create a table like structure. -->
        <table>
          <!-- Create the first row of table as table head (thead). -->
          <thead>
            <!-- The top row is table head with four columns named -- ID, Title ... -->
            <tr>
              <th id="th1">Player Name</th>
              <th id="th1">Team</th>
              <th id="th1">Number</th>
              <th id="th1">Position</th>
              <th id="th1">School</th>
              <th id="th1">Height</th>
              <th id="th1">Weight</th>
              <th id="th1">Birth Date</th>
              <th id="th1">Age</th>
              <th id="th1">Years Experience</th>
            </tr>
          </thead>
          <!-- Create rest of the the body of the table -->
          <tbody>
            <!-- For each row saved in the $result variable ... -->
            <?php foreach ($result as $row) { ?>

              <tr>
                <td id="td1"><?php echo $row["player"]; ?></td>
                <td id="td1"><?php echo $row["teamName"]; ?></td>
                <td id="td1"><?php echo $row["num"]; ?></td>
                <td id="td1"><?php echo $row["position"]; ?></td>
                <td id="td1"><?php echo $row["school"]; ?></td>
                <td id="td1"><?php echo $row["height"]; ?></td>
                <td id="td1"><?php echo $row["weight"]; ?></td>
                <td id="td1"><?php echo $row["birthDate"]; ?></td>
                <td id="td1"><?php echo $row["age"]; ?></td>
                <td id="td1"><?php echo $row["exp"]; ?></td>
              </tr>
            <?php } ?>
            <!-- End table body -->
          </tbody>
          <!-- End table -->
        </table>

      <?php } else { ?>
        <!-- If query execution resulted in error display the following message-->
        <h3>Sorry, no results found among player set. </h3>
    <?php }
    } ?>

    <br>
  </div>
</body>

</html>