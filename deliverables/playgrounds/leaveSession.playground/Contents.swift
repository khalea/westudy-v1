import UIKit

import PlaygroundSupport


PlaygroundPage.current.needsIndefiniteExecution = true

struct ServerMessage: Codable {
    var error: Bool
    var message: String
}


var sessionID = "100";
var userID = 1;

//set api url
let url = URL(string: "http://cgi.sice.indiana.edu/~team50/database/LeaveSession.php")!
   
// create url request object
var request = URLRequest(url: url);
request.httpMethod = "POST";

   
//add parameters
let postString = "sessionID=\(sessionID)&userID=\(userID)"
              

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
    guard (try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]) != nil else { return }
//       print("json:", json)
   } catch {
       print("error:", error)
   }
}

task.resume()
 

