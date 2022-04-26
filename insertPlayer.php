<?php
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

if (isset($_POST['f_submit'])) {

  require_once("conn.php");

  $var_name = $_POST['field_name'];
  $var_num = $_POST['field_num'];
  $var_position = $_POST['field_position'];
  $var_season = $_POST['field_season'];

  $query = "CALL insertPlayer(:name, :season, :num, :position)";

  try {
    $prepared_stmt = $dbo->prepare($query);
    $prepared_stmt->bindValue(':name', $var_name, PDO::PARAM_STR);
    $prepared_stmt->bindValue(':season', $var_season, PDO::PARAM_STR);
    $prepared_stmt->bindValue(':num', $var_num, PDO::PARAM_STR);
    $prepared_stmt->bindValue(':position', $var_position, PDO::PARAM_STR);
    $result = $prepared_stmt->execute();
  } catch (PDOException $ex) { // Error in database processing.
    echo $sql . "<br>" . $error->getMessage(); // HTTP 500 - Internal Server Error
  }
}

?>

<html>

<head>
    <!-- THe following is the stylesheet file. The CSS file decides look and feel -->
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

        <h1> Create a new free agent! </h1>
        <div id="input_container">
            <form method="post">
                <b>
                    <label for="id_name">Name:</label>
                </b>
                <input type="text" name="field_name" id="id_name">

                <b>
                    <label for="id_num">Number:</label>
                </b>
                <input type="text" name="field_num" id="id_num">

                <b>
                    <label for="id_position">Position:</label>
                    <b>
                        <input type="text" name="field_position" id="id_position">

                        <select name="field_season" id="id_season">
                            <option value="2016" selected>2016</option>
                            <option value="2017" selected>2017</option>
                            <option value="2018" selected>2018</option>
                            <option value="2019" selected>2019</option>
                            <option value="2020" selected>2020</option>
                        </select>

                        <input type="submit" name="f_submit" value="Submit">
            </form>
            <br>
        </div>
        <?php
    if (isset($_POST['f_submit'])) {
      if ($result) {
    ?>
        New player was successfully created.
        <?php
      } else {
      ?>
        <h3> Sorry, there was an error. Player data was not inserted. </h3>
        <?php
      }
    }
    ?>
        <br>
    </div>
</body>

</html>