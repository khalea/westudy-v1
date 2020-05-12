<?php

// connect to database
$mysqli = new mysqli('db.sice.indiana.edu', 'i494f19_team50', 'my+sql=i494f19_team50', 'i494f19_team50');
    
// report connection error
if ($mysqli->connect_errno){
    die('Failed to connect to database: ' . $mysqli::$connect_error . $mysqli->connect_error);
}

// connection successful
echo $mysqli->host_info . '\n';

// retrieve all entries from sessions and groups
$sql = 'SELECT * FROM sessions';
$result = $mysqli->query($sql);

// if the query's result is not empty, loop over the rows and add them to a JSON file
if ($result->num_rows>0) {
    // JSON array
    $finalArray = array();

    while($row = $result->fetch_assoc()) {
        // each row will pass through the transfer array on its way to the final (JSON) array

        $sid = $row['sessionID'];
        $title = $row['title'];
        $courseCode = $row['courseCode'];
        $description = $row['description'];
        $date = $row['date'];
        $time = $row['time'];
        $address = $row['address'];
        $room = $row['room'];
        //$isPrivate = $row['isPrivate'];


    $transerArray = array('sessionID' => $sid, 'title' => $title, 'courseCode' => $courseCode, 'description' => $description, 'date' => $date, 'time' => $time, 'address' => $address, 'room' => $room /*, 'isPrivate' => $isPrivate*/);

        // add row to JSON array
        array_push($finalArray, $transerArray);
    }
    
    // send final array to JSON
    echo json_encode($finalArray);
    header('Content-Type: application/json');
}

// no results found
elseif ($result->num_rows==0) {
    echo 'No sessions found';
}
else {
    echo 'There was ana error in parsing the search results';
}
    
$mysqli->close();

?>
