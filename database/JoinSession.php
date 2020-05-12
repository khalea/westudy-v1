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
        
    $userID = $_POST['userID'];
    $sessionID = $_POST['sessionID'];
     
    //prepare and bind
    $stmt = $conn->prepare("INSERT INTO userSessions(userID, sessionID) VALUES (?, ?)");
    $stmt->bind_param("ii", $userID, $sessionID);
        
    if ($stmt->execute()) {
        $response["error"] = false;
        $response["message"] = "Joined session successfully";
    } else {
        $response["error"] = true;
        $response["message"] = $stmt->error;
    }
}
    
else {
        $response["error"] = true;
        $response["message"] = "Invalid request";
}
    
echo json_encode($response);
    
$stmt->close();
$conn->close();
?>
