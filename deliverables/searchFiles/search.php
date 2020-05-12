<?php

// connection parameters
$servername = "db.sice.indiana.edu";
$username = "i494f19_team50";
$password = "my+sql=i494f19_team50";
$dbname = "i494f19_team50";

//connect to database

$conn = new mysqli($servername, $username, $password, $dbname);
    
// report connection error
if ($conn->connect_error){
    die('Failed to connect to database: ' . $this->conn::$connect_error . $this->conn->connect_error);
}

// connection successful
echo $conn->host_info . 'Connection Successful';


// receive user query from app
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $userQuery = $_POST['userQuery'];
    

    // retrieve relevant entries from sessions
    $sqlSess = "SELECT * FROM sessions WHERE courseCode LIKE '%userQuery%' OR title LIKE '%userQuery%' OR sessionDescription LIKE '%userQuery%'";
    $resultSess = $mysqli->query($sqlSess);
    
    // retrieve relevant entries from sessions
    $sqlUser = "SELECT * FROM users WHERE courseCode LIKE '%userQuery%' OR title LIKE '%userQuery%' OR sessionDescription LIKE '%userQuery%'";
    $resultUser = $mysqli->query($sqlUser);
    
    // retrieve relevant entries from sessions
    $sqlGrp = "SELECT * FROM sessions WHERE courseCode LIKE '%userQuery%' OR title LIKE '%userQuery%' OR sessionDescription LIKE '%userQuery%'";
    $resultGrp = $mysqli->query($sqlGrp);
    
}


// if the query's result is not empty, loop over the rows and write them to the JSON file
if ($resultSess->num_rows>0) {
    // JSON array
    $finalArray = array();

    while($row = $resultSess->fetch_assoc()) {
        // each row will pass through the transfer array on its way to the final (JSON) array

        $id = $row['sessionID'];
        $ownerID = $row['ownerID'];
        $title = $row['title'];
        $courseCode = $row['courseCode'];
        $description = $row['sessionDescription'];
        $date = $row['date'];
        $startTime = $row['startTime'];
        $endTime = $row['endTime'];
        $address = $row['address'];
        $room = $row['room'];
        $isPrivate = $row['isPrivate'];
        $latitude = $row['latitude'];
        $longitude = $row['longitude'];

        $transerArray = array('sessionID' => $id, 'ownerID' => $ownerID, 'title' => $title, 'courseCode' => $courseCode, 'description' => $description, 'date' => $date, 'startTime' => $time, 'endTime' => $endTime, 'address' => $address, 'room' => $room, 'isPrivate' => $isPrivate, 'latitude' => $latitude, 'longitude' => $longitude, "session" => $category);

        // add row to JSON array
        array_push($finalArray, $transerArray);
    }
    
    // send final array to JSON
    echo json_encode($finalArray);
    header('Content-Type: application/json');
}

// no results found
elseif ($result->num_rows==0) {
    echo $mysqli->host_info . 'No sessions found';
}
else {
    echo $mysqli->host_info . 'There was an error in parsing the search results';
}


    
$mysqli->close();

?>
