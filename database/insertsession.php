<?php
    
// CONNECT TO DATABASE
$servername = "db.sice.indiana.edu";
$username = "i494f19_team50";
$password = "my+sql=i494f19_team50";
$dbname = "i494f19_team50";
    
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
    
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
//reponse array
$response = array();
    
// set parameters and execute
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // get values
    
    $ownerID = 1;
    $title = $_POST['title'];
    $courseCode = $_POST['courseCode'];
    $sessionDescription = $_POST['sessionDescription'];
    $date = $_POST['date'];
    $startTime = $_POST['startTime'];
    $endTime = $_POST['endTime'];
    $address = $_POST['address'];
    $room = $_POST['room'];
    $isPrivate = $_POST['isPrivate'];
    $latitude = $_POST['latitude'];
    $longitude = $_POST['longitude'];
 
    //prepare and bind
    $stmt = $conn->prepare("INSERT INTO sessions(ownerID, title, courseCode, sessionDescription, date, startTime, endTime, address, room, isPrivate, latitude, longitude) VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("isssssssssss", $ownerID, $title, $courseCode, $sessionDescription, $date, $startTime, $endTime, $address, $room, $isPrivate, $latitude, $longitude);
    
    if ($stmt->execute()) {
        $response["error"] = false;
        $response["message"] = "Session created successfully";

    } else {
        $response["error"] = true;
        $response["message"] = $stmt->error;
        }

} else {
        $response["error"] = true;
        $response["message"] = "Invalid request";
    }
echo json_encode($response);
$stmt->close();
$conn->close();
?>
