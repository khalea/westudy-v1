<?php
// connection parameters
$servername = "db.sice.indiana.edu";
$username = "i494f19_team50";
$password = "my+sql=i494f19_team50";
$dbname = "i494f19_team50";
    
//connect to database
$conn = new mysqli($servername, $username, $password, $dbname);
    
// report connection error
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
    
// connection successful
//echo 'Connection Successful';
    
// JSON array
$finalArray = array();

//public function getSessions($query) {
    
$likeVar = '%' . $query . '%';

// retrieve relevant entries from sessions table
$sqlSess = "SELECT * FROM sessions WHERE courseCode LIKE ? OR title LIKE ? OR sessionDescription LIKE ?";


$stmtSess = $conn->prepare($sqlSess);
$stmtSess->bind_param('sss', $likeVar, $likeVar, $likeVar);

$stmtSess->execute();

// assign results to session array
$resultSess = $stmtSess->get_result();

if ($resultSess->num_rows > 0) {
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
    $category = "session";
        
        
    $transferSess = array('sessionID' => $id, 'ownerID' => $ownerID, 'title' => $title, 'courseCode' => $courseCode, 'description' => $description, 'date' => $date, 'startTime' => $startTime, 'endTime' => $endTime, 'address' => $address, 'room' => $room, 'isPrivate' => $isPrivate, 'latitude' => $latitude, 'longitude' => $longitude, 'category' => $category);
    
    // add row to JSON array
    array_push($finalArray, $transferSess);

    }
}
// no results found
elseif ($resultSess->num_rows==0) {
     $json_array["error"] = false;
     $json_array["message"] = "No sessions found";
}
else {
    $json_array["error"] = true;
    $json_array["message"] = "There was an error in parsing the search results";
}
//}
    
//$userQuery = "c";
//getSessions("c");

// encode results in JSON
echo json_encode($finalArray);
header('Content-Type: application/json');
    
// close connection to database
$conn->close();
    
?>


