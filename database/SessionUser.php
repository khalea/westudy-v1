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


//if ($_SERVER["REQUEST_METHOD"] == "POST") {
//    $ownerID = $_POST['ownerID'];
    $userID = 1;
    $sessionID = 102;
    
    //retrieve session from database
    $stmt = $conn->prepare("SELECT DISTINCT u.userID, u.userName, u.firstName, u.lastName FROM users as u, userSessions as us, sessions as s WHERE u.userID = ? AND u.userID = us.userID AND us.sessionID = ? ORDER BY u.firstName ASC");
    $stmt->bind_param("ii", $userID, $sessionID);
    $stmt->execute();
    $result = $stmt->get_result();
    
    //response array
    $json_array = array();

    if ($result->num_rows > 0) {
        
        while($row = $result->fetch_assoc()){
            
            $userID = $row['userID'];
            $userName = $row['userName'];
            $firstName = $row['firstName'];
            $lastName = $row['lastName'];
           
            
            $user = array('id' => $userID, 'userName' => $userName, 'firstName' => $firstName, 'lastName' => $lastName);

            //inserting the temporary array inside response
            array_push($json_array, $user);
        }
        
    } elseif ($result->num_rows == 0) {
        $json_array["error"] = false;
        $json_array["message"] = "No user found";
    } else {
        $json_array["error"] = true;
        $json_array["message"] = "Some error occurred";
    }
//} else {
    //$json_array["error"] = true;
    //$json_array["message"] = "Invalid request";
//}

    
echo json_encode($json_array);
    
// Tell that is a JSON output
header('Content-Type: application/json');
    
/*close connection */
$conn->close();

?>
