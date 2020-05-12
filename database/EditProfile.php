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
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $userName = $_POST['userName'];
    $bio = $_POST['bio'];
 
    //prepare and bind
    $stmt = $conn->prepare("UPDATE users SET firstName = ?, lastName = ?, userName = ?, bio = ? WHERE userID = ?");
    $stmt->bind_param('ssssi', $firstName, $lastName, $userName, $bio, $userID);
   
        
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


