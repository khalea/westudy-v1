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
    
    $sessionID = $_POST['sessionID'];
    $title = $_POST['title'];
    $courseCode = $_POST['courseCode'];
    $sessionDescription = $_POST['sessionDescription'];
    $address = $_POST['address'];
    $room = $_POST['room'];
    $date = $_POST['date'];
    $startTime = $_POST['startTime'];
    $endTime = $_POST['endTime'];
    $isPrivate = $_POST['isPrivate'];
 
    //prepare and bind
    $stmt = $conn->prepare("UPDATE sessions SET title = ?, courseCode = ?, sessionDescription = ?, address = ?, room = ?, date = ?, startTime = ?, endTime = ?, isPrivate = ? WHERE sessionID=?");
    $stmt->bind_param('sssssssssi', $title, $courseCode, $sessionDescription, $address, $room, $date, $startTime, $endTime, $isPrivate, $sessionID);
   
        
    if ($stmt->execute()) {
        $response["error"] = false;
        $response["message"] = "Edited session successfully";

    } else {
        $response["error"] = true;
        $response["message"] = mysqli_error($conn);
        }

} else {
        $response["error"] = true;
        $response["message"] = "Invalid request";
    }

header('Content-Type: application/json');
echo json_encode($response);

    
$conn->close();
?>


