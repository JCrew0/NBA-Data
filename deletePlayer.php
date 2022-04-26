<?php
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
// If the all the variables are set when the Submit button is clicked...
if (isset($_POST['field_submit'])) {
  // It will refer to conn.php file and will open a connection.
  require_once("conn.php");
  // Will get the value typed in the form text field and save into variable
  $var_name = $_POST['field_name'];
  $var_season = $_POST['field_season'];
  // Save the query into variable called $query.
  $query = "CALL deletePlayer(:name, :season)";

  try {
    $prepared_stmt = $dbo->prepare($query);
    //bind the value saved in the variable $var_title to the place holder :title after //verifying (using PDO::PARAM_STR) that the user has typed a valid string.
    $prepared_stmt->bindValue(':name', $var_name, PDO::PARAM_STR);
    $prepared_stmt->bindValue(':season', $var_season, PDO::PARAM_STR);
    //Execute the query and save the result in variable named $result
    $result = $prepared_stmt->execute();
  } catch (PDOException $ex) { // Error in database processing.
    echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
  }
}

?>

<html>
<!-- Any thing inside the HEAD tags are not visible on page.-->

<head>
  <!-- THe following is the stylesheet file. The CSS file decides look and feel -->
  <link rel="stylesheet" type="text/css" href="project.css?id=1234" />
</head>

<!-- Everything inside the BODY tags are visible on page.-->

<body>
  <div id="container">
    <!-- See the project.css file to see how is navbar stylized.-->
    <div id="navbar">
      <!-- See the project.css file to note how ul (unordered list) is stylized.-->
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
    <!-- See the project.css file to note h1 (Heading 1) is stylized.-->
    <h1> Delete any players from a season! </h1>
    <!-- This is the start of the form. This form has one text field and one button.
      See the project.css file to note how form is stylized.-->
    <div id="input_container">
      <form method="post">

        <b>
          <label for="id_name">Name:</label>
        </b>
        <input type="text" name="field_name" id="id_name">

        <select name="field_season" id="id_season">
          <option value="2016" selected>2016</option>
          <option value="2017" selected>2017</option>
          <option value="2018" selected>2018</option>
          <option value="2019" selected>2019</option>
          <option value="2020" selected>2020</option>
        </select>

        <div id="submit_container">
          <input type="submit" id="submit" name="field_submit" value="Delete Player">
        </div>
      </form>
      <br>
    </div>
    </form>

    <?php
    if (isset($_POST['field_submit'])) {
      if ($result) {
    ?>
        Player was deleted successfully.
      <?php
      } else {
      ?>
        <h3> Sorry, there was an error. Player data was not deleted. </h3>
    <?php
      }
    }
    ?>
<br>
  </div>
</body>

</html>