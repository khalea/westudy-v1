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
//    $userID = $_POST['userID'];


        //$userID = $_POST['userID'];
        $userID = 1;


        //retrieve session from database
        $stmt = $conn->prepare("SELECT DISTINCT s.sessionID, s.title, s.courseCode, s.sessionDescription, s.date, s.startTime, s.endTime, s.address, s.room, s.isPrivate, s.latitude, s.longitude, u.firstName, u.lastName FROM sessions as s, users as u WHERE s.ownerID = u.userID AND NOT s.ownerID = ? ORDER BY s.date ASC, s.startTime ASC");
        $stmt->bind_param("i", $userID);



        //    echo $stmt;
        $stmt->execute();
        $result = $stmt->get_result();

        //response array
        $json_array = array();

    
    
    if ($result->num_rows > 0) {
        
        while($row = $result->fetch_assoc()){
            
            $sessionID = $row['sessionID'];
            $title = $row['title'];
            $courseCode = $row['courseCode'];
            $sessionDescription = $row['sessionDescription'];
            $date = $row['date'];
            $startTime = $row['startTime'];
            $endTime = $row['endTime'];
            $address = $row['address'];
            $room = $row['room'];
            $isPrivate = $row['isPrivate'];
            $latitude = $row['latitude'];
            $longitude = $row['longitude'];
            $firstName = $row['firstName'];
            $lastName = $row['lastName'];
            

            
            $session = array('id' => $sessionID, 'ownerID' => $ownerID, 'title' => $title, 'courseCode' => $courseCode, 'sessionDescription'=> $sessionDescription, 'date' => $date, 'startTime' => $startTime, 'endTime' => $endTime, 'address' => $address, 'room' => $room, 'isPrivate' => $isPrivate, 'latitude' => $latitude, 'longitude' => $longitude, 'firstName' => $firstName, 'lastName' => $lastName, 'error' => "false", 'message' => "true");

            //inserting the temporary array inside response
            array_push($json_array, $session);
        }
        
    } elseif ($result->num_rows == 0) {
        $json_array["error"] = false;
        $json_array["message"] = "No sessions joined";
    } else {
        $json_array["error"] = true;
        $json_array["message"] = "Some error occurred";
    }
//} else {
//    $json_array["error"] = true;
//    $json_array["message"] = "Invalid request";
//}

    
echo json_encode($json_array);
// Tell that is a JSON output
header('Content-Type: application/json');
    
/*close connection */
$conn->close();

?>
