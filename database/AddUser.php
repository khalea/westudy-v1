<?php


$serverName = "db.sice.indiana.edu";
$userName = "i494f19_team50";
$password = "my+sql=i494f19_team50";
$dbName = "i494f19_team50";

// Create Connection
$conn = new mysqli($serverName, $userName, $password, $dbName);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$json_array = array();
    
// Get values from post request
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    //$userName = $_REQUEST['userName'];
    $email = $_POST['email'];
    //$password = $_REQUEST['passWord'];

    // SQL command
   
    $addUser = $conn->prepare("INSERT INTO sessions(firstName, lastName, email) VALUES (?, ?, ?)");
    $addUser->bind_param("sss", $firstName, $lastName, $email);
    
    //get userID if insert was successful
    if ($addUser->execute()) {
        $getUserID = $conn->prepare("SELECT userID FROM users where email = $email");
        $getUserID->bind_param("s", $email);
        
        //get response if select was successful
        if ($getUserID->execute()) {

            $result = $getUserID->get_result();
            
            //array to hold result
            $json_array = array();
            
            
            while($row = $result->fetch_assoc()){
                
                $userID = $row['userID'];
                

                
                $user = array('userID' => $userID);

                //inserting the temporary array inside response
                array_push($json_array, $user);
            }
        }
    } else {
        $json_array["userID"] = 0;
        $json_array["error"] = true;
        $json_array["message"] = $addUser->error;
    }
    

} else {
    $json_array["userID"] = 0;
     $json_array["error"] = true;
     $json_array["message"] = "Invalid request";
}

echo json_encode($json_array);
header('Content-Type: application/json');
$conn->close();
