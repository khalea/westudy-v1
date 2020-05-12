import UIKit
import PlaygroundSupport
import MapKit

PlaygroundPage.current.needsIndefiniteExecution = true

struct ServerMessage: Codable {
    var error: Bool
    var message: String
}

var strDate = "2020-04-02";
var room = "107";
var courseCode = "info 101";
var title = "study title";
var strTime1 = "14:00:00";
var strTime2 = "15:00:00";
var sessionDescription = "Testing2";
var isPrivate = "false";
var ownerID = 1;
var address = "1150 S Clarizz Blvd Bloomington IN 47401"
public var lat = ""
public var long = ""

let url = URL(string: "https://cgi.sice.indiana.edu/~team50/database/insertsession.php/")!


var request = URLRequest(url: url)
request.httpMethod = "POST"

//convert address to lat/long
let geocoder = CLGeocoder()

geocoder.geocodeAddressString(address){ (placemarks, error) in
   if error == nil {
       if let placemark = placemarks?[0] {
           let location = placemark.location!
           //print(location.coordinate)
           lat = String(location.coordinate.latitude)
           long = String(location.coordinate.longitude)
        
           //set parameters
           let postString = "ownerID=\(ownerID)&title=\(title)&sessionDescription=\(sessionDescription)&date=\(strDate)&startTime=\(strTime1)&endTime=\(strTime2)&address=\(address)&room=\(room)&courseCode=\(courseCode)&isPrivate=\(isPrivate)&latitude=\(lat)&longitude=\(long)"
                  
    
           //add parameters to api request
           request.httpBody = postString.data(using: String.Encoding.utf8);
        
           //send request
           let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
               if let error = error {
                   print("error:", error)
                   return
               }

               do {
                   guard let data = data else { return }
                   guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                   print("json:", json)
               } catch {
                   print("error:", error)
               }
           }

           task.resume()

         
           return
       } 
   }
   else {
     print("Some error occurred")
   }
}
 











