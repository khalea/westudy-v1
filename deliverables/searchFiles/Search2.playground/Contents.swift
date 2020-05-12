<?php

// connection parameters
$servername = "db.sice.indiana.edu";
$username = "i494f19_team50";
$password = "my+sql=i494f19_team50";
$dbname = "i494f19_team50";
<<<<<<< HEAD

=======
    
>>>>>>> master
//connect to database
$conn = new mysqli($servername, $username, $password, $dbname);
    
// report connection error
<<<<<<< HEAD
if ($conn->connect_error){
    die('Failed to connect to database: ' . $conn::$connect_error . $conn->connect_error;
}

// connection successful
echo $conn->host_info . 'Connection Successful';
    
// receive user query from app CAN I DO THIS IN SWIFT FILE INSTEAD??

// if ($_SERVER['REQUEST_METHOD'] == 'POST') { $userQuery = $_POST['userQuery'];
$userQuery = "c";
echo $userQuery . "\n";

// JSON array
$finalArray = array();

// call search functions
//getSessions($userQuery);
//getUsers($userQuery);
//getGroups($userQuery);

getSessions($query) {
    
    // retrieve relevant entries from sessions table
    $likeSess = "%" . $query . "%";
    $sqlSess = "SELECT * FROM sessions WHERE courseCode LIKE ? OR title LIKE ? OR sessionDescription LIKE ?";
    echo $sqlSess . "\n";

    $stmtSess = $conn->prepare($sqlSess);
    $stmtSess->bind_param("sss", $likeSess, $likeSess, $likeSess);
    echo $stmtSess . "\n";
        
    $stmtSess->execute();

    // assign results to session array
    $resultSess = $stmtSess->get_result();
    
    if ($resultSess->num_rows>0) {

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

            $transferSess = array('sessionID' => $id, 'ownerID' => $ownerID, 'title' => $title, 'courseCode' => $courseCode, 'description' => $description, 'date' => $date, 'startTime' => $time, 'endTime' => $endTime, 'address' => $address, 'room' => $room, 'isPrivate' => $isPrivate, 'latitude' => $latitude, 'longitude' => $longitude, 'category' => $category);

            // add row to JSON array
            array_push($finalArray, $transferSess);
        }

    }

    // no results found
    elseif ($resultSess->num_rows==0) {
        echo $conn->host_info . 'No sessions found';
        $finalArray["error"] = false;
        $finalArray["message"] = "No sessions created";
    }
    // error
    else {
        echo $conn->host_info . 'There was an error in parsing the search results';
        $finalArray["error"] = true;
        $finalArray["message"] = "Some error occurred";
    }
}
        
//// encode results in JSON
echo json_encode($finalArray);
header('Content-Type: application/json');

// close connection to database
$conn->close();

?>
//}
         
//public function getUsers($userQuery) {
//
//    // connect to db
//    $conn = $this->dbConnect();
//    // retrieve relevant entries from users table
//    $sqlUser = "SELECT * FROM users WHERE userName LIKE ? OR firstName LIKE ? OR lastName LIKE ? OR email LIKE ?";
//    $stmtUser = $conn->prepare($sqlUser);
//    $stmtUser->bind_param("ssss", $userQuery, $userQuery, $userQuery, $userQuery);
//    $stmtUser->execute();
//
//    // assign results to user array
//    $resultUser = $stmtUser->get_result();
//
//    if ($resultUser->num_rows>0) {
//
//        while($row = $resultUser->fetch_assoc()) {
//            // each row will pass through the transfer array on its way to the final (JSON) array
//
//            $id = $row['userID'];
//            $userName = $row['userName'];
//            $firstName = $row['firstName'];
//            $lastName = $row['lastName'];
//            $DOB = $row['DOB'];
//            $email = $row['email'];
//            $phone = $row['phone'];
//            $bio = $row['bio'];
//            $category = "user";
//
//            $transferUser = array('userID' => $id, 'userName' => $userName, 'firstName' => $firstName, 'lastName' => $lastName, 'email' => $email, 'phone' => $phone, 'bio' => $bio, "user" => $category);
//
//            // add row to JSON array
//            array_push($finalArray, $transferUser);
//        }
//    }
//
//    // no results found
//    elseif ($resultUser->num_rows==0) {
//        echo $conn->host_info . 'No users found';
//    }
//    else {
//        echo $conn->host_info . 'There was an error in parsing the user results';
//    }
//}
//
//public function getGroups($userQuery) {
//
//    // connect to db
//    $conn = $this->dbConnect();
//    // retrieve relevant entries from groups table
//    $sqlGrp = "SELECT * FROM groups WHERE title LIKE ?";
//    $stmtGrp = $conn->prepare($sqlGrp);
//    $stmtGrp->bind_param("s", $userQuery);
//    $stmtGrp->execute();
//
//    // assign results to user array
//    $resultGrp = $stmtGrp->get_result();
//
//    if ($resultGrp->num_rows>0) {
//
//        while($row = $resultGrp->fetch_assoc()) {
//            // each row will pass through the transfer array on its way to the final (JSON) array
//
//            $id = $row['groupID'];
//            $title = $row['title'];
//            $isPrivate = $row['isPrivate'];
//            $ownerID = $row['ownerID'];
//            $category = "group";
//
//            $transferGrp = array('groupID' => $id, 'title' => $title, 'isPrivate' => $isPrivate, 'ownerID' => $ownerID, 'email' => $email, "group" => $category);
//
//            // add row to JSON array
//            array_push($finalArray, $transferGrp);
//        }
//    }
//
//    // no results found
//    elseif ($resultGrp->num_rows==0) {
//        echo $conn->host_info . 'No groups found';
//    }
//    else {
//        echo $conn->host_info . 'There was an error in parsing the group results';
//    }
//}

=======
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
>>>>>>> master


